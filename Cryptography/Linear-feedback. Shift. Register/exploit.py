#!/usr/bin/env python3

def msb(num, pos):
    ret = (num & (1 << pos[0])) >> pos[0]

    for p in pos[1:]:
        ret ^= (num & (1 << p)) >> p
    return ret

def get_next(last, pos):
    m = msb(last, pos)
    return (m << 7)|(last >> 1)

def decode():
    msb_pos = [6,5,3,2,0]
    last = 0
    last = prefix[-1] ^ cipher[len(prefix)-1]

    output=''
    for i in range(len(prefix), len(cipher)):
        last = get_next(last, msb_pos)
        output += chr(cipher[i] ^ last)
        
    print(prefix+output.encode())

cipher = open('secretMessage.hex', 'rb').read()
prefix = b"CTFlearn{"

decode()
