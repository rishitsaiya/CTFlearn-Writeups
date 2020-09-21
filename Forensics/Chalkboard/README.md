## Chalkboard
The main idea finding the flag is to use strings.

#### Step-1:
After I downloaded `math.jpg`, I tried using `strings`, `binwalk`, etc.

<img src="math.jpg">

#### Step-2:
When I gave input `strings math.jpg`

Output:

```
JFIF
The flag for this challenge is of the form:
CTFlearn{I_Like_Math_x_y}
where x and y are the solution to these equations:
3x + 5y = 31
7x + 9y = 59
...
```

#### Step-3:

Just solved the equations to get `x = 2` & `y = 5`.

#### Step-4:
Finally the flag becomes: 
`CTFlearn{I_Like_Math_2_5}`
