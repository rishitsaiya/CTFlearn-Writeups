## Brute Force is Fun!
The main idea to find the flag is Brute Force, Basic scripting and Base64.

#### Step-1:
After downloading `legotroopers.jpg`, I tried basic `strings`, `binwalk`, it was clear that, there was a zip inside containing many folders in it.

<img src="legotroopers.jpg">

#### Step-2:
So, I tried `foremost legotroopers.jpg`, to extract all the directories from the zip. I got this output:

```bash
Processing: legotroopers.jpg
�y6Տ�F�sʘ(c6nρ�Z��媩��'���{�%��
*|
```
A directory called `output` was formed which contained `audit.txt`, `jpg`, `zip`.
#### Step-3:
Checking in zip folder, we had this `00000012.zip`, which was password protected and would fetch `flag.zip` in later period if we input correct password. For now, we just go ahead with empty passphrase.
We see many folders deflating and being created there.

#### Step-4:
Next to check the flag through all the directories, I simply used this:
`grep -R flag` and it gave me this output:

```bash
folders/73/47/p:The password is: "ctflag*****" where * is a number.
folders/73/43/p:The password is: "ctflag*****" where * is a number.
```
So, we came to know that password is of the above form and the * number is a 5 digit number.
#### Step-5:
So, now to brute the password, I wrote a script `exploit.py`, to brute the password.

```py
#!usr/bin/python3
from zipfile import ZipFile
from string import digits
import itertools

brute = itertools.product(digits,repeat=5)

with ZipFile("00000012.zip") as zf: # Path to 00000012.zip to be mentioned
    for i in brute:
        i = ''.join(i)
        password = "ctflag" + i
        try:
            zf.extractall(pwd=bytes(password,'utf-8'))
            print("Flag: " + password)
        except:
            pass
```
On running this as `python3 exploit.py`, I got the password as : `Flag: ctflag48625`
<h5>PS: Make sure in exploit.py the path to 00000012.zip is mentioned correctly. It takes some time to brute. Don't terminate the script.</h5>

#### Step-6:
So, now the password to `00000012.zip` is `ctflag48625`. So we go to location of `00000012.zip` and then unzip it with `ctflag48625` as password and got this as output:
```bash
Archive:  00000012.zip
[00000012.zip] flag.zip password: 
  inflating: flag.zip                
replace folders/73/47/p? [y]es, [n]o, [A]ll, [N]one, [r]ename: A
  inflating: folders/73/47/p         
  inflating: folders/73/43/p  
```
A zip called `flag.zip` was created. After unzipping `flag.zip`, we get `flag.txt` which contains the following text:
```
RkxBR3ttYXlfdGhlX2JydXRlX2ZvcmNlX2JlX3dpdGhfeW91fQ==
```

#### Step-7:
Clearly, this was Base64 encrypted text. (Also mentioned in the description of the challenge)
So, I just wrote this simple one-liner to get the flag:

```bash
cat flag.txt | base64 -d
```
Voila! I had the flag.

#### Step-8:
Finally, the flag becomes:
`FLAG{may_the_brute_force_be_with_you}`