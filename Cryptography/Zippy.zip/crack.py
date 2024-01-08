#!/usr/bin/env python3
import sys
import os
import string
import collections

import argparse
parser = argparse.ArgumentParser()
parser.add_argument('file', nargs='*')
parser.add_argument('--hex', action='append')
parser.add_argument('--dec', action='append')
parser.add_argument('--limit', type=int)
parser.add_argument('--compiler', default='g++')
parser.add_argument('--alphabet', type=os.fsencode, default=string.printable.encode())
args = parser.parse_args()

targets = collections.OrderedDict()
limit = 0
crcs = []

if args.limit:
    limit = max(limit, args.limit)
if args.hex or args.dec:
    if not args.limit:
        parser.error('Limit of length not specified')

if args.hex:
    for s in args.hex:
        crc = int(s, 16)
        targets[s] = crc
        for l in range(args.limit + 1):
            crcs += [( crc, l )]
if args.dec:
    for s in args.dec:
        crc = int(s)
        targets[s] = crc
        for l in range(args.limit + 1):
            crcs += [( crc, l )]

if args.file:
    print('reading zip files...', file=sys.stderr)
    import zipfile
    for zipname in args.file:
        fh = zipfile.ZipFile(zipname)
        for info in fh.infolist():
            targets['%s / %s' % ( zipname, info.filename )] = ( info.CRC, info.file_size )
            crcs += [( info.CRC, info.file_size )]
            limit = max(limit, info.file_size)
            print('file found: %s / %s: crc = 0x%08x, size = %d' % (zipname, info.filename, info.CRC, info.file_size), file=sys.stderr)

if not crcs:
    parser.error('No CRCs given')

# compiling c++ in python script is the easy way to have the both a good interface and better speed
code = ''
code += r'''
#include <cstdio>
#include <vector>
#include <array>
#include <string>
#include <set>
#include <cstdint>
#include <cctype>
#define repeat(i,n) for (int i = 0; (i) < (n); ++(i))
using namespace std;

uint32_t crc_table[256];
void make_crc_table() {
    repeat (i, 256) {
        uint32_t c = i;
        repeat (j, 8) {
            c = (c & 1) ? (0xedb88320 ^ (c >> 1)) : (c >> 1);
        }
        crc_table[i] = c;
    }
}
const uint32_t initial_crc32 = 0xffffffff;
uint32_t next_crc32(uint32_t c, char b) {
    return crc_table[(c ^ b) & 0xff] ^ (c >> 8);
}
const uint32_t mask_crc32 = 0xffffffff;

const char alphabet[] = { ''' + ', '.join(map(str, args.alphabet)) + r''' };
const int limit = ''' + str(limit) + r''';

array<set<uint32_t>, limit+1> crcs;
string stk;
void dfs(uint32_t crc) {
    if (crcs[stk.length()].count(crc ^ mask_crc32)) {
        fprintf(stderr, "crc found: 0x%08x: \"", crc ^ mask_crc32);
        for (char c : stk) fprintf(stderr, isprint(c) && (c != '\\') ? "%c" : "\\x%02x", c);
        fprintf(stderr, "\"\n");
        printf("%08x ", crc ^ mask_crc32);
        for (char c : stk) printf(" %02x", c);
        printf("\n");
    }
    if (stk.length() < limit) {
        for (char c : alphabet) {
            stk.push_back(c);
            dfs(next_crc32(crc, c));
            stk.pop_back();
        }
    }
}

int main() {
'''
for crc, size in crcs:
    code += '    crcs[' + str(size) + '].insert(' + hex(crc) + ');\n'
code += r'''
    make_crc_table();
    dfs(initial_crc32);
    return 0;
}
'''

import tempfile
import subprocess
with tempfile.TemporaryDirectory() as tmpdir:
    cppname = os.path.join(tmpdir, 'a.cpp')
    with open(cppname, 'w') as fh:
        fh.write(code)
    binname = os.path.join(tmpdir, 'a.out')
    print('compiling...', file=sys.stderr)
    p = subprocess.check_call([args.compiler, '-std=c++11', '-O3', '-o', binname, cppname])
    print('searching...', file=sys.stderr)
    p = subprocess.Popen([binname], stdout=subprocess.PIPE)
    output, _ = p.communicate()

print('done', file=sys.stderr)
print(file=sys.stderr)
result = collections.defaultdict(list)
for line in output.decode().strip().split('\n'):
    crc, *val = map(lambda x: int(x, 16), line.split())
    result[( crc, len(val) )] += [ bytes(val) ]
for key, crc in targets.items():
    for s in result[crc]:
        print('%s : %s' % (key, repr(s)[1:]))
