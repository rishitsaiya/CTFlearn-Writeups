Once you have obtained the flag, you can read the source with:
openssl enc -d -aes-256-cbc -pbkdf2 -k FLAG -in qr.asm.enc -out qr.asm
