## Read in Color
The main idea of finding the flag is using PIL library in Python.

#### Step-1:
We are given this file `color_img.png` which is a follows:

<img src="color_img.png">

#### Step-2:
After reading the description of challenge, I wrote a script `exploit.py`, which helped me to get a flag.

```py
from PIL import Image
from collections import OrderedDict

#Image Load
file = Image.open("color_img.png")
rgb_mode = file.convert("RGB")
width, height = file.size

myrgbvalue = []

for i in range(width):
    for j in range(height):
        rgbvalue = rgb_mode.getpixel((i,j))
        myrgbvalue.append(rgbvalue)

values = []
orderedvalues = list(OrderedDict.fromkeys(myrgbvalue))
word = ""

for tup in orderedvalues:
    for value in tup:
        word += chr(value)
print(word)
```

#### Step-3:
Executing the script as `python3 exploit.py`, I got the flag.

#### Step-4:
Finally, the flag becomes: 
`flag{c0l0r_c0d3d}`
