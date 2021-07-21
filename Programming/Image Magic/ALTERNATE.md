# Image Magic
The main idea is finding the flag by doing image processing with Python libraries like numpy and pillow.

#### Step-1:
We download the image and see the image is giant line that's a single pixel tall:
![out copy](./out%20copy.jpg)

#### Step-2:
The first part of [`script.py`](./script.py) just counts how many pixels wide the image is. It outputs 27968 which will be useful later.
```python
img = numpy.array(Image.open("out copy.jpg"))
print(len(img[0]))
```

#### Step-3:
```python
new = []
line = []
for i in range(len(img[0])):
    line.append(img[0][i])
    if i%92 == 91:
        new.append(line)
        line = []
```
This part of the script is supposed to reconstruct the image if it has a height of 304 as stated in [this comment](https://ctflearn.com/challenge/89/3000#comment-3000)

#### Step-4:
The final part of the script saves the flag in a new image.
```python
new = numpy.array(new)
Image.fromarray(new).save("flag.png")
```
![flag](./flag.png)

#### Step-5:
Finally, the flag becomes:
`flag{cool_right?}`