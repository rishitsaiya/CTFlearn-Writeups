#! usr/bin/python3

# Reading the bytes
with open("fl4g.jpeg", "rb") as file:
    OFFSET = 4    
    sig_rev = b""
    sig_read  = bytearray(file.read(OFFSET))

# Cyclic Reversing 
    while sig_read:
        sig_rev += sig_read[::-1]
        sig_read = file.read(OFFSET)
# Flag Output        
    with open("Flag.jpeg", "wb") as newfile:
        newfile.write(sig_rev)