# Rangoon (Easy)
challenge link: https://ctflearn.com/challenge/994

## Writeup
This is the third challenge in the series of RE introduction made by **kcbowhunter**. And let me say this one is tougher then the previous 2.

We have a similar program which takes one argument and expects for it to be the right flag. Let's open Ghidra and look what we have here.
```
        __s = *(byte **)(param_2 + 8);
        lVar8 = 9;
        pbVar10 = __s;
        pbVar12 = (byte *)"CTFlearn{";
        do {
            if (lVar8 == 0) break;
            lVar8 = lVar8 + -1;
            bVar14 = *pbVar10 < *pbVar12;
            bVar15 = *pbVar10 == *pbVar12;
            pbVar10 = pbVar10 + (ulong)bVar16 * -2 + 1;
            pbVar12 = pbVar12 + (ulong)bVar16 * -2 + 1;
        } while (bVar15);
```
So first we see that the program checks if the argument begins with "CTFlearn{", if we don't do that we won't pass it in the debugger.
next there is `if (__s[sVar5 - 1] == 0x7d)` which checks if the strings last characters is `0x7d`, or '}' in ascii

Alright so I know that we must pass **CTFlearn{}** in order to get pass those checks, let's see what happens next.

![ghidra1](https://user-images.githubusercontent.com/29147077/160349060-da6bd8e8-074c-41f9-9b5f-d8231dcce7cf.jpg)

Looks bad but it's acrually not that bad. What happens here is that the program builds the flag, if you look with more attention you will notice three
`__strcpy_chk` calls and three `__memcpy_chk` calls. Those are similar to `strcpy` and `memcpy` but they check for buffer overflow.
(in the source that is provided, you can see that the functions used are actually `strcat`).

`__memcpy_chk` appends "_" into the string in the first two calls, and "}" in the last. `__strcpy__chk` appends a different word depending on 
the condition. Let's run GDB and see what we get there.
```
(gdb) run CTFlearn{flag}
Starting program: /home/kali/Downloads/rangoon/Rangoon CTFlearn{flag}
CTFLearn Reversing Challenge: Rangoon

Compile Options: ${CMAKE_CXX_FLAGS} -O0 -fno-stack-protector -mno-sse

Breakpoint 1, 0x00005555555552ee in main ()
(gdb) x/s $rdi
0x555555558100 <buffer+32>:     "}"
(gdb) x/s $rdi-32
0x5555555580e0 <buffer>:        "CTFlearn{Prince_Princess_Thaketa}"
```
As you can see, the buffer contatins "CTFlearn{Prince_Princess_Thaketa}" but that is not the real flag, we now this since if we run the program with this
as it's argument, we will get an error.
```
└─$ ./Rangoon CTFlearn{Prince_Princess_Thaketa}
CTFLearn Reversing Challenge: Rangoon

Compile Options: ${CMAKE_CXX_FLAGS} -O0 -fno-stack-protector -mno-sse
You entered the wrong flag :-(
```
But why? there is a really important if statement we didn't discuss yet, on line 80 in Ghidra decompiler `if (lVar8 == 0x1040fb)`. What does it do?
lVar8 is equal to the result of 
[`__memcpy_chk`](http://refspecs.linux-foundation.org/LSB_4.0.0/LSB-Core-generic/LSB-Core-generic/libc---memcpy-chk-1.html),
which works similary to the regular [`memcpy`](https://www.cplusplus.com/reference/cstring/memcpy/). In the *Return* section it's says
> destination is returned.

And the big number the lVar8 is compared too, I assume that it compares it to a specific address, but why?

First, the program saves each pointer of the resultng copy function and uses it later as a parameter. As I said earlier, the word appended is depends on
the condition we have, also if we look at the actual assembly, the if statement perhaps will make more sense. `CMP  R13,0x1c`, so what happens,
is that the program checks if the result in `buffer` (the flag) is 28 characters length. I also already writed what are the possible words we can get
each `strcpy` so let's build the flag.

The flag is **CTFlearn{1_2_3}**
1. *Prince* or *Princess*
2. *Princess* or *Maha*
3. *Thaketa* or *Devi*

As I said, let's go from the last to first. sVar5 is the length of our input`sVar5 = strlen((char *)__s);` last word added is
`Var8 = __stpcpy_chk(lVar6 + 1, *(undefined8 *)(lVar8 + ((ulong)(sVar5 == 0x1c) * 3 + 9) * 8), 0x1041df - lVar6);` focus on
`lVar8 + ((ulong)(sVar5 == 0x1c) * 3 + 9) * 8`. So the condition here is "if len is 28", we know it must be, so the third word is **Devi**.

Now we could reverse what is left, but maybe we can build it knowing the remaining lenght. Let's calculate it. "CTFlearn{1_2_Devi}. The legnth is 16
(1 and 2 are replaced with words) so we have 12 characters left. Let's look at the combinations we can build.

First, if we have *Prince* we must have another 6 characters long word, both *Princess* and *Maha* arent good, must mean first word is *Princess*, same
logic, and *Maha* is the correct one. (8 + 4).

So the flag is **CTFlearn{Princess_Maha_Devi}**.
