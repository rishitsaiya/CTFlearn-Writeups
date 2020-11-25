## Simple Programming
The main idea finding the flag is some simple counting in a file.

#### Step-1:
After we download `data.dat` from the cloud, we understand that it is has 10,000 lines. So we definitely need to write up a script to get answer.

#### Step-2:
So I quickly drafted up `Flag.py` script to get number of such lines:

```py
count = 0

file = 'data.dat'

with open(file) as f:    
        l = f.readlines()
        for line in l:
                zero = line.count('0')
                one = line.count('1')
                if (zero%3 == 0) or (one%2 == 0):
                        count = count + 1

print("Number of lines: " + str(count))
f.close()
```

#### Step-3:
When we execute this script by `python3 Flag.py`, we get the flag.

Output:
`Number of lines: 6662`

#### Step-4:
Finally the flag becomes:
`CTFlearn{6662}`
