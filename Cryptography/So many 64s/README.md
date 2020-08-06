## Base 2 2 the 6
The main idea finding the flag is Base64 decryption.

#### Step-1:
After I downloaded `flag.txt`, I got a humungous Base64 encrypted message.

#### Step-2:
So, when I tried to decrypt in online, it gave huge cipher again. So, I had to write a script to get the flag. 

#### Step-3:
The `exploit.py` has the script.

```python
import base64

f = open('flag.txt', 'r')
text = f.read()

while 1:
    text = base64.b64decode(text).decode('utf-8')

    if '{' in text:
        print(text)
        #continue
        break
```
 
#### Step-4: 

So finally, when I ran the script by `python3 exploit.py`, I got the flag.

#### Step-5: 
Finally the flag becomes:
`ABCTF{pr3tty_b4s1c_r1ght?}`