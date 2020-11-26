## Binwalk
The main idea finding the flag using Binwalk commands and its extensions.

#### Step-1:
After downloading `PurpleThing.jpeg` from the cloud, I tried `strings PurpleThing.jpeg | grep {`.

<img src="PurpleThing.jpeg">

I couldn't find anything special.

#### Step-2:

So I tried `binwalk PurpleThing.jpeg` as the question suggests.

It showed me following output:

```bash
DECIMAL       HEXADECIMAL     DESCRIPTION
--------------------------------------------------------------------------------
0             0x0             PNG image, 780 x 720, 8-bit/color RGBA, non-interlaced
41            0x29            Zlib compressed data, best compression
153493        0x25795         PNG image, 802 x 118, 8-bit/color RGBA, non-interlaced
```

Clearly, there is hidden data in there, let's extract that.
#### Step-3:
I input a command of `binwalk -D 'image:png' PurpleThing.jpeg` and I get a directory named `_PurpleThing.jpeg.extracted`. 

The contents are different files. In it `25795.png` has the flag.

#### Step-4:

Finally the flag becomes:
`ABCTF{b1nw4lk_is_us3ful}`
