## Smiling ASCII
The main idea to find the flag is to use Zsteg tool.

#### Step-1:
We are given `smiling.png`. 

<img src="smiling.png">

#### Step-2:
To get the basic idea on the image given, I used [Exiftool](https://exiftool.org/).
I tried to use `exiftool smiling.png` and I got the following output:

```bash
ExifTool Version Number         : 11.88
File Name                       : smiling.png
Directory                       : .
File Size                       : 58 kB
File Modification Date/Time     : 2021:01:12 16:40:51+05:30
File Access Date/Time           : 2021:01:12 16:40:51+05:30
File Inode Change Date/Time     : 2021:01:12 16:41:50+05:30
File Permissions                : rw-r--r--
File Type                       : PNG
File Type Extension             : png
MIME Type                       : image/png
Image Width                     : 383
Image Height                    : 300
Bit Depth                       : 8
Color Type                      : RGB with Alpha
Compression                     : Deflate/Inflate
Filter                          : Adaptive
Interlace                       : Noninterlaced
Warning                         : [minor] Trailer data after PNG IEND chunk
Image Size                      : 383x300
Megapixels                      : 0.115
```

#### Step-3:
The warning, gave me the idea that maybe the metadata is at the end blocks of image. So, I used [Zsteg](https://www.aldeid.com/wiki/Zsteg) to get the flag. I ran `zsteg --all smiling.png` and got the following output:

```bash
[?] 104 bytes of extra data after image end (IEND), offset = 0xe6cd
extradata:0         .. text: "RGlkIHlvdSBrbm93IHRoYXQgcGl4ZWxzIGFyZSwgbGlrZSB0aGUgYXNjaWkgdGFibGUsIG51bWJlcmVkIGZyb20gMCB0byAyNTU/Cg=="
b3,abgr,lsb,xy      .. file: very old 16-bit-int little-endian archive
b1,rgba,lsb,yx      .. file: AIX core file
b1,abgr,lsb,yx      .. file: AIX core file fulldump 32-bit
b8,g,lsb,yx         .. text: "CTFlearn{ascii_pixel_flag}"
b8,a,lsb,yx         .. text: "CTFlearn{ascii_pixel_flag}"
b4,r,lsb,yx,prime   .. file: AIX core file fulldump 32-bit
b4,g,lsb,yx,prime   .. file: AIX core file 32-bit
b8,g,lsb,yx,prime   .. text: "Flancixla"
b8,a,lsb,yx,prime   .. text: "Flancixla"
```

#### Step-4:
Finally, the flag becomes:
`CTFlearn{ascii_pixel_flag}`
