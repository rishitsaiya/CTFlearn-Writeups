## Simple Steganography
The main idea to find the flag is to use Steghide tool.

#### Step-1:
We are given this image `Minions1.jpeg`

<img src="Minions1.jpeg">

#### Step-2:
When we do a `exiftool Minions1.jpeg`, we get the following output:
```bash
ExifTool Version Number         : 11.88
File Name                       : Minions1.jpeg
Directory                       : .
File Size                       : 6.8 kB
File Modification Date/Time     : 2020:10:08 13:24:48+05:30
File Access Date/Time           : 2020:10:18 15:26:57+05:30
File Inode Change Date/Time     : 2020:10:08 13:24:48+05:30
File Permissions                : rw-r--r--
File Type                       : JPEG
File Type Extension             : jpg
MIME Type                       : image/jpeg
JFIF Version                    : 1.01
Resolution Unit                 : None
X Resolution                    : 1
Y Resolution                    : 1
Current IPTC Digest             : b9e8892a1b55650cf0a6341fe676d194
Keywords                        : myadmin
Application Record Version      : 4
Image Width                     : 225
Image Height                    : 225
Encoding Process                : Baseline DCT, Huffman coding
Bits Per Sample                 : 8
Color Components                : 3
Y Cb Cr Sub Sampling            : YCbCr4:2:0 (2 2)
Image Size                      : 225x225
Megapixels                      : 0.051
```

#### Step-3:
Next, I used `steghide extract -sf Minions1.jpeg` and used the passphrase as `myadmin` from above and got `raw.txt` which had the following content.

```bash
AEMAVABGAGwAZQBhAHIAbgB7AHQAaABpAHMAXwBpAHMAXwBmAHUAbgB9
```

#### Step-4:
After decoding the above Base64 string, `cat raw.txt | base64 -d`.

Voila, I got the flag.
#### Step-5:
Finally, the flag becomes:
`CTFlearn{this_is_fun}`