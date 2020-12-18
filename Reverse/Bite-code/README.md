## Bite-code
The main idea finding the flag is reversing the function approach and brute forcing the flag.


#### Step-1:
After we get the link:
 [https://mega.nz/#!qfATFaKR!zaTNExq3Bm1MjJnePjTGQyvnvLX_xZxhbGaMv_ypaxo](https://mega.nz/#!qfATFaKR!zaTNExq3Bm1MjJnePjTGQyvnvLX_xZxhbGaMv_ypaxo), we get the `bitecode.txt`

#### Step-2:
The contents of `bitecode.txt` are as follows:

```java
public static boolean checkNum(int);
    descriptor: (I)Z
    flags: ACC_PUBLIC, ACC_STATIC
    Code:
      stack=2, locals=3, args_size=1
         0: iload_0
         1: iconst_3
         2: ishl
         3: istore_1
         4: iload_0
         5: ldc           #2                  // int 525024598
         7: ixor
         8: istore_2
         9: iload_1
        10: iload_2
        11: ixor
        12: ldc           #3                  // int -889275714
        14: if_icmpne     21
        17: iconst_1
        18: goto          22
        21: iconst_0
        22: ireturn
      LineNumberTable:
        line 3: 0
        line 4: 4
        line 5: 9
      StackMapTable: number_of_entries = 2
        frame_type = 253 /* append */
          offset_delta = 21
          locals = [ int, int ]
        frame_type = 64 /* same_locals_1_stack_item */
          stack = [ int ]
```

#### Step-3:

Clearly, it is a program of Java Bytecode. For those who aren't familiar with that, you have to read and explore before you continue.

- [Java Bytecode Crash Course](https://www.youtube.com/watch?v=e2zmmkc5xI0)
- [A Java Programmer's Guide to Byte Code](https://www.beyondjava.net/java-programmers-guide-java-byte-code)
-  [Introduction to Java Bytecode](https://dzone.com/articles/introduction-to-java-bytecode)   

#### Step-4:

Now, I have added comments in front of each instruction to understand what exactly is going on there:

<a href="https://ibb.co/CHTSvgD"><img src="https://i.ibb.co/Kr387dS/comments.png" alt="comments" border="0"></a>

#### Step-5:

So basically, this is easy when we understand the sequential operations involved.

$x1 = flag << 3$ &nbsp;&nbsp; `Left Shift by 3`
$x2$ = $flag$ ^ 525024598 &nbsp;&nbsp; `Flag XOR`
$x3$ = $x1$ ^ $x2$ &nbsp;&nbsp; `x1 XOR x2`
If ($x3$ == -889275714),  then $flag$ is $x3$.

#### Step-6:

We write a simple `Bruteforce.c`C program to implement a brute force attack to find the flag.

The C Program is as follows:

```c
# include <stdio.h>
# include <stdlib.h>
# pragma warning (disable : 4146)


void BruteForce(){

	int flag , x1, x2, x3;
	flag = -2147483648;			// The biggest negative value of 32bit.
	x3 = 0;
	while (x3 != -889275714) {
		x1 = flag << 3;
		x2 = flag ^ 525024598;
		x3 = x1 ^x2;
		flag += 1;
	}
	printf("%d \n", flag - 1);
}


void main() {
	BruteForce();
	system("pause");
}
```

The flag will be obtained after we compile the C program by `gcc Bruteforce.c` and then execute it by `./a.out`.

The output is as follows:
```bash
-1352854872 
sh: 1: pause: not found
```

#### Step-7:
Finally the flag becomes:
`CTFlearn{-1352854872}`
