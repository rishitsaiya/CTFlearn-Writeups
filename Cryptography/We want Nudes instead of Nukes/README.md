## We want Nudes instead of Nukes
The main idea of getting the flag is to alter the IV before the decryption happens, so it gives a different, altered result of our choice.

#### Step-1:
The description of the challenge:
```
Donald has gone completely crazy. To prevent world chaos, you kidnapped him. Right before the kidnapping he tried to send one encrypted message to his wife Melania. Luckily you intercepted the message. Donald admits that he used AES-CBC encryption - a block cipher operating with a block length of 16 bytes. (here represented by 32 characters). 
The message was: {391e95a15847cfd95ecee8f7fe7efd66,8473dcb86bc12c6b6087619c00b6657e}

The format contains first the Initialization vector(IV) and then the cipher text(c) separated by a colon all wrapped in curly braces. {IV,c} After torturing him by stealing his hairpiece, he tells you the plain text of the message is:

FIRE_NUKES_MELA!

As a passionate hacker you of course try to take advantage of this message. To get the flag alter the message that Melania will read: SEND_NUDES_MELA!

Submit the flag in the format: flag{IV,c}

The characters are hexlified, and one byte is represented by two characters; e.g. the string "84" represents the character "F" of the message and so on.
```

#### Step-2:
We know the IV (Initialization Vector) and the original plaintext, so if we reverse the `XOR` operation, the state of the ciphertext can be known right before it being finally decrypted with the IV.

The main idea being 
`(Output) XOR (Initial Vector) = Plaintext` (Where Output is AES' output right before the XOR)

#### Step-3:
I wrote this script `exploit.py` that does the XOR operation with the given hashes to us.

```py
IV = bytearray.fromhex("391e95a15847cfd95ecee8f7fe7efd66")
CT = bytearray.fromhex("8473dcb86bc12c6b6087619c00b6657e")

# Hashes from the description of challenge
ORIGINAL_MESSAGE = bytearray.fromhex(
    "464952455f4e554b45535f4d454c4121")  # FIRE_NUKES_MELA!

ALTERED_MESSAGE = bytearray.fromhex(
    "53454e445f4e554445535f4d454c4121")  # SEND_NUDES_MELA!

ALTERED_IV = bytearray()

# XOR
for i in range(16):
    ALTERED_IV.append(ALTERED_MESSAGE[i] ^ ORIGINAL_MESSAGE[i] ^ IV[i])
```
When we run this as `python3 exploit.py`
#### Step-4:
Finally, the flag becomes:
`flag{2c1289a05847cfd65ecee8f7fe7efd66,8473dcb86bc12c6b6087619c00b6657e}`
