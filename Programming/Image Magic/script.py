import numpy
from PIL import Image
import matplotlib

img = numpy.array(Image.open("out copy.jpg"))
print(len(img[0]))
new = []
line = []
for i in range(len(img[0])):
    line.append(img[0][i])
    if i%92 == 91:
        new.append(line)
        line = []
new = numpy.array(new)
Image.fromarray(new).save("flag.png")