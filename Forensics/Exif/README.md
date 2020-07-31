## Exif
The main idea finding the flag is to have Exiftool.

#### Step-1:
After I downloaded `Computer-Password-Security-Hacker - Copy.jpg`, I immediately tried to open it using Exiftool.

<img src="Computer-Password-Security-Hacker - Copy.jpg">

#### Step-2:
If you have some experience in CTF before, [Exiftool](https://exiftool.org/) is quite widely used. So I input `exiftool Computer-Password-Security-Hacker\ -\ Copy.jpg`

Output:

```bash
ExifTool Version Number         : 11.88
File Name                       : Computer-Password-Security-Hacker - Copy.jpg
Directory                       : .
File Size                       : 54 kB
File Modification Date/Time     : 2020:07:31 14:04:06+05:30
File Access Date/Time           : 2020:07:31 14:04:06+05:30
File Inode Change Date/Time     : 2020:07:31 14:04:06+05:30
File Permissions                : rw-r--r--
File Type                       : JPEG
File Type Extension             : jpg
MIME Type                       : image/jpeg
JFIF Version                    : 1.02
X Resolution                    : 100
Y Resolution                    : 100
Exif Byte Order                 : Big-endian (Motorola, MM)
Resolution Unit                 : None
Y Cb Cr Positioning             : Centered
Exif Version                    : 0231
Components Configuration        : Y, Cb, Cr, -
Flashpix Version                : 0100
Owner Name                      : flag{3l1t3_3x1f_4uth0r1ty_dud3br0}
GPS Latitude Ref                : South
GPS Longitude Ref               : East
Quality                         : 60%
DCT Encode Version              : 100
APP14 Flags 0                   : [14], Encoded with Blend=1 downsampling
APP14 Flags 1                   : (none)
Color Transform                 : YCbCr
Image Width                     : 660
Image Height                    : 371
Encoding Process                : Baseline DCT, Huffman coding
Bits Per Sample                 : 8
Color Components                : 3
Y Cb Cr Sub Sampling            : YCbCr4:4:4 (1 1)
Image Size                      : 660x371
Megapixels                      : 0.245
GPS Latitude                    : 77 deg 17' 2.62" S
GPS Longitude                   : 44 deg 4' 7.30" E
GPS Position                    : 77 deg 17' 2.62" S, 44 deg 4' 7.30" E
```

#### Step-3:

Voila! I got the flag there. I don't have any idea why this challenge was in hard.

#### Step-5:
Finally the flag becomes: 
`flag{3l1t3_3x1f_4uth0r1ty_dud3br0}`