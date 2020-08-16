import base64
import cv2
import numpy as np
import zbar

scale = 300
scanner = zbar.Scanner()

def scan(img):
    img = np.bitwise_xor(img, ~img[0,0])
    img = cv2.resize(img, (scale * 5, scale * 5), interpolation = cv2.INTER_AREA)
    ret = scanner.scan(img)
    return ret[0].data if ret else b''

img = cv2.imread('inception.png', cv2.IMREAD_GRAYSCALE)
w,h = img.shape
msg = b''.join([scan(img[y:y+scale, x:x+scale]) for y in range(0, h, scale) for x in range(0,w,scale)])
print("Decoded message: " + msg)