## RSA Beginner
The main idea finding the flag using RSA function and its operations.

#### Step-1:
After we download `rsa (1).txt` from the cloud, we try to understand what is the content.

If anyone is unaware of RSA Encryption, they can checkout here:

https://en.wikipedia.org/wiki/RSA_(cryptosystem)

#### Step-2:
The contents of `rsa (1).txt` are as follows:

```
e: 3
c: 219878849218803628752496734037301843801487889344508611639028
n: 245841236512478852752909734912575581815967630033049838269083
```
#### Step-3:
We run a simple `Flag.py` script to get the flag.

```py
import gmpy2
from gmpy2 import mpz

e=mpz(3)
c=mpz(219878849218803628752496734037301843801487889344508611639028)
n=mpz(245841236512478852752909734912575581815967630033049838269083)

#use factordb
q=mpz(416064700201658306196320137931)
p=mpz(590872612825179551336102196593)

phi=gmpy2.mul(p-1,q-1)
d=gmpy2.invert(e,phi)
f=gmpy2.powmod(c,d,n)
g=bytes.fromhex(hex(f)[2:])

print("[+] Flag is : ",g)
```
#### Step-4:
The output of `python3 Flag.py` is as follows:

`[+] Flag is :  b'abctf{rs4_is_aw3s0m3}'`

#### Step-5:
Finally the flag becomes:
`abctf{rs4_is_aw3s0m3}`
