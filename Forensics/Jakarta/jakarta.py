#!/usr/bin/env python3
from jakarta_data import *

parts = []
data = bytes(data)
parts = data.split(b'\xff\xd9')[:-1]

for i in range(len(parts)):
    print(i, parts[i][:16], '...', parts[i][-16:], len(parts[i]))

jpg = open('Jakarta.jpg', 'rb').read()
rsa_prefix = b'-----BEGIN RSA PRIVATE KEY-----'
xord_offset = 0
for r in range(0, len(parts[0]), len(rsa_prefix)):
    xor_bytes = []
    for i in range(len(rsa_prefix)):
        xor_bytes.append(rsa_prefix[i]^parts[0][r+i])

    a = jpg.find(bytes(xor_bytes))
    if a != -1:
        print('found', a, r)
        xord_offset = a
        break

with open('jakarta_rsa.key', 'wb') as fd:
    for i in range(len(parts[0])):
        fd.write(int.to_bytes(parts[0][i] ^ jpg[xord_offset+i], 1, 'little'))

with open('jakarta_flag', 'wb') as fd:
    fd.write(parts[3])
