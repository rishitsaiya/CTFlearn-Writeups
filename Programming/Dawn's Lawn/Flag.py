import numpy as np
import sys

with open(sys.argv[1]) as f:

    lines = f.read().split('\n')
dim = len(lines[0])

conv = {'.': 0,'_': 1,'\\': 2, '-': 3, '/': 4, '|': 5, '*': 6}
matrix = np.array([[conv[y] for y in x] for x in lines])
matrix -= 2  # Mow everything
grow = np.tile(np.arange(dim-1, -1, -1), (dim, 1))
grow[matrix <= 0] = 0  # Don't grow on infertile land
matrix += grow
print("Flag: " + str((matrix >= 6).sum()))
