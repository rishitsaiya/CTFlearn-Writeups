## Finish The Flag
The main idea finding the flag analyzing the Fibonacci Sequence.

#### Step-1:
After we download `letter.zip` from the cloud, we see there is a directory called `finish_the_flag` which contains 3 files named `qr.asm.enc`, `qr.png`and `readme.txt`.

#### Step-2:
We proceed by scanning the QR code online at [here](https://zxing.org/w/decode.jspx). 

<img src="qr.png">

We get the following text from there:
```txt
f0VMRgEBAQAAAAAAAAAAAAIAAwABAAAAgIAECDQAAACMAgAAAAAAADQAIAACACgABgAFAAEAAAAAAAAAAIAECACABAjFAAAAxQAAAAUAAAAAEAAAAQAAAMgAAADIkAQIyJAECFcAAABXAAAABgAAAAAQAAAAAAAAAAAAAAAAAAC6CgAAALkUkQQIuwEAAAC4BAAAAM2AMcA8B3Qdi5DkkAQIQOkAAAAAVYnlUIDyF4hVAFhd6d////+7AAAAALgBAAAAzYAAAAA5w6nhu7PDvHtqbj09fSAgPFw6ICBfXyAgUDAARkVIYSQnagBRw7NBOGTDunAwbTk5cse5MDQwVjA1ZmYxTGxrOVwwb09cQy9cMDAAQ1RGbGVhcm57CgAAAAAAAAAAAAAAAAAAAAAAAAAAAACAgAQIAAAAAAMAAQAAAAAAyJAECAAAAAADAAIAAQAAAAAAAAAAAAAABADx/wgAAADIkAQIAAAAAAAAAgAPAAAA5JAECAAAAAAAAAIAFQAAAOyQBAgAAAAAAAACAB0AAAAUkQQIAAAAAAAAAgAjAAAAmIAECAAAAAAAAAEAKAAAAKiABAgAAAAAAAABADUAAAC5gAQIAAAAAAAAAQA/AAAAgIAECAAAAAAQAAEAOgAAAB+RBAgAAAAAEAACAEYAAAAfkQQIAAAAABAAAgBNAAAAIJEECAAAAAAQAAIAAHFyLmFzbQByYW5kb20AZWZsYWcAcmFuZG9tMgBzZmxhZwBsb29wAGJpdGVfb2ZfZmxhZwBkb25lAF9fYnNzX3N0YXJ0AF9lZGF0YQBfZW5kAAAuc3ltdGFiAC5zdHJ0YWIALnNoc3RydGFiAC50ZXh0AC5kYXRhAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAbAAAAAQAAAAYAAACAgAQIgAAAAEUAAAAAAAAAAAAAABAAAAAAAAAAIQAAAAEAAAADAAAAyJAECMgAAABXAAAAAAAAAAAAAAAEAAAAAAAAAAEAAAACAAAAAAAAAAAAAAAgAQAA8AAAAAQAAAALAAAABAAAABAAAAAJAAAAAwAAAAAAAAAAAAAAEAIAAFIAAAAAAAAAAAAAAAEAAAAAAAAAEQAAAAMAAAAAAAAAAAAAAGICAAAnAAAAAAAAAAAAAAABAAAAAAAAAA==
```

#### Step-3:
Decoding that into Base64 by the following script `exec.py` (below), we come to know that it is an executable. `exec.py` generates an executable called `exec_bin`, which when run gives first part of the flag.

```py
import base64
data = "f0VMRgEBAQAAAAAAAAAAAAIAAwABAAAAgIAECDQAAACMAgAAAAAAADQAIAACACgABgAFAAEAAAAAAAAAAIAECACABAjFAAAAxQAAAAUAAAAAEAAAAQAAAMgAAADIkAQIyJAECFcAAABXAAAABgAAAAAQAAAAAAAAAAAAAAAAAAC6CgAAALkUkQQIuwEAAAC4BAAAAM2AMcA8B3Qdi5DkkAQIQOkAAAAAVYnlUIDyF4hVAFhd6d////+7AAAAALgBAAAAzYAAAAA5w6nhu7PDvHtqbj09fSAgPFw6ICBfXyAgUDAARkVIYSQnagBRw7NBOGTDunAwbTk5cse5MDQwVjA1ZmYxTGxrOVwwb09cQy9cMDAAQ1RGbGVhcm57CgAAAAAAAAAAAAAAAAAAAAAAAAAAAACAgAQIAAAAAAMAAQAAAAAAyJAECAAAAAADAAIAAQAAAAAAAAAAAAAABADx/wgAAADIkAQIAAAAAAAAAgAPAAAA5JAECAAAAAAAAAIAFQAAAOyQBAgAAAAAAAACAB0AAAAUkQQIAAAAAAAAAgAjAAAAmIAECAAAAAAAAAEAKAAAAKiABAgAAAAAAAABADUAAAC5gAQIAAAAAAAAAQA/AAAAgIAECAAAAAAQAAEAOgAAAB+RBAgAAAAAEAACAEYAAAAfkQQIAAAAABAAAgBNAAAAIJEECAAAAAAQAAIAAHFyLmFzbQByYW5kb20AZWZsYWcAcmFuZG9tMgBzZmxhZwBsb29wAGJpdGVfb2ZfZmxhZwBkb25lAF9fYnNzX3N0YXJ0AF9lZGF0YQBfZW5kAAAuc3ltdGFiAC5zdHJ0YWIALnNoc3RydGFiAC50ZXh0AC5kYXRhAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAbAAAAAQAAAAYAAACAgAQIgAAAAEUAAAAAAAAAAAAAABAAAAAAAAAAIQAAAAEAAAADAAAAyJAECMgAAABXAAAAAAAAAAAAAAAEAAAAAAAAAAEAAAACAAAAAAAAAAAAAAAgAQAA8AAAAAQAAAALAAAABAAAABAAAAAJAAAAAwAAAAAAAAAAAAAAEAIAAFIAAAAAAAAAAAAAAAEAAAAAAAAAEQAAAAMAAAAAAAAAAAAAAGICAAAnAAAAAAAAAAAAAAABAAAAAAAAAA=="
encodedBytes = base64.b64decode(data)
execute_file = open("exec_bin", "wb")
execute_file.write(encodedBytes)
```

<img src="exec.png">

#### Step-4:
When we do the objdump of the above executable using the command: `objdump -S -M intel exec_bin`, we see that there is a loop at instruction # `08048098`, which is executed up to 7 times.

<img src="objdump.png">

#### Step-5:
We see within the function `480a8 <bite_of_flag>`, these instructions have flag contents.

```asm
 80480ac:       80 f2 17                xor    dl,0x17
 80480af:       88 55 00                mov    BYTE PTR [ebp+0x0],dl
```

#### Step-6:
After debugging the register dl to hex using gdb, we see its value at `0x51` (which is Q in ASCII). We can spin up a small script `exploit.py` to iterate through the loop to spit out the flag.

```py
import gdb

gdb.execute('break *0x80480af')
gdb.execute('run')

flag = ''
for i in range(7):
    dl = gdb.parse_and_eval('$dl')
    flag += chr(dl)

    gdb.execute('continue')

print("CTFlearn{" + flag)
```

#### Step-7:
Finally, executing the above script with the command `gdb exec_bin -x ./exploit.py` gives us the flag.

<img src="Flag.png">

#### Step-8:
Finally the flag becomes:
`CTFlearn{QR_v30}`
