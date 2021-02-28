## Reykjavik
The main idea to find the flag is to use GDB to navigate across instructions.

#### Step-1:
Using `gdb -q Rejkjavik`, we get can hop on to the `main` function using break points. The command for the same would be `b * main`. After reaching, using `ni` Next Instriction, we land up to the flag as mentioned below.

#### Step-2:
Finally, the flag becomes:
`CTFlearn{Eye_L0ve_Iceland_U}`