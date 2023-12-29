#!/usr/bin/env python3
data = open('bin', 'rb').read()

w = 600

with open('600x600_picture', 'wb') as fd:
    for i in range(0, len(data), w):
        if data[i] == 0x10: break
        if b'1' in data[i:i+w]:
            fd.write(data[i+200:i+364])
            fd.write(b'\n')
