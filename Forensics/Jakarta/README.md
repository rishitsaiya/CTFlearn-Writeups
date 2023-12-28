## Jakarta
The main idea finding the flag using RSA.

#### Step-1:
After we download `Jakarta.jpg` from the cloud, we see the image as follows:

<img src="Jakarta.jpg">

#### Step-2:
We proceed by using Exiftool on this by the command: `exiftool -v6 Jakarta.jpg`. It shows the following bytes at the end of output.

```sh
Unknown trailer (5650 bytes at offset 0xc41e1):
c41e1: c4 4e a5 c0 71 10 e1 44 17 ca a3 a3 ee be 20 58 [.N..q..D...... X]
c41f1: 69 77 57 bc 6b 8a 85 ca cb 70 98 07 45 6d 2c 43 [iwW.k....p..Em,C]
c4201: 49 21 26 aa d5 cd 49 6a 08 e5 58 65 c4 2d 3a 5b [I!&...Ij..Xe.-:[]
c4211: 69 33 99 46 3e 76 a3 df 9f 26 20 bc 23 53 cd 22 [i3.F>v...& .#S."]
c4221: bc 1b ba 71 5e b2 a3 05 f2 fc e2 9e fd a8 4b 44 [...q^.........KD]
c4231: b0 f7 48 ed f8 7f 39 de 7c 51 db 77 98 69 2e 9b [..H...9.|Q.w.i..]
c4241: d5 aa d0 d4 ad d7 28 5e 26 6d e1 fd 4a f0 39 ce [......(^&m..J.9.]
c4251: a0 91 17 0a 08 ef a0 3f 0b dd 16 b0 2e d3 17 dd [.......?........]
...
```

#### Step-3:
We then dump those bytes to a file (as below) `jakarta_data.py` and find that several EOF markers: `'\xff\xd9'`. If we use them as delimitter, we get 4 parts as follows:

Those 4 parts may look like this:

<img src="jakarta_data.png">

#### Step-4:

The first part had length 3243, generated a 4096 bits RSA key at [CryptoTools](https://cryptotools.net/rsagen), the key has the same length, so part 0 was likely to be the encrypted RSA key.

Exiftool also gave 1437 bytes of data at the second comment, analyzed it at [here](https://www.boxentriq.com/code-breaking/text-analysis), ROT25 gave a meaningful string `thischalle`, decrypted it with ROT25, the plain text was a description about this challenge. Ran ROT25 on part 1, it gave some bytes look like python script, ROT -1 on each punctuation and digits, decrypted text was python script with three functions, `ReadBinaryFile()`, `WriteBinaryFile()` and `xorFilesAtOffset()`.

Those bytes used to XOR RSA key were still unknown. As a RSA key starts with `'-----BEGIN RSA PRIVATE KEY-----'`, XOR the prefix and part 0 to get XOR'ed bytes, search these bytes in the `.jpg` file, the match should be the bytes used to XOR RSA key.


#### Step-5:
With this method, found the bytes at offset `12862`. XOR bytes start at `12862` from which we can find the RSA key like as follows:

```python
with open('jakarta_rsa.key', 'wb') as fd:
    for i in range(len(parts[0])):
        fd.write(int.to_bytes(parts[0][i] ^ jpg[xord_offset+i], 1, 'little'))
```

#### Step-6:
Finally, we can compile altogether to write a script `jakarta.py` wherein it can be used to fetch the flag.

```py
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
```

#### Step-7:
We finally use the generated key (jakarta_rsa.key) by executing above script `python3 jakarta.py` in [CyberChef](https://gchq.github.io/CyberChef/) as with following configuration to get the flag.

<img src="Flag.png">

#### Step-8:
Finally the flag becomes:
`CTFlearn{Jakarta_Ind0nes1a}`
