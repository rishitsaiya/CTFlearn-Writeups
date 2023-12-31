## Ramada
The main idea finding the flag using the decompiler to understand main function.

#### Step-1:
After we download `Rangoon.zip` from the cloud, we see there are 3 files namely `Rangoon`, `readme`, `sources.zip.enc` where `Rangoon`is the main executable which is to be reversed.

#### Step-2:
When we decompile the executable `Rangoon` using [Ghidra](https://ghidra-sre.org/), we see the following function
```c
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
#### Step-3:
We see that the program checks if the argument begins with `CTFlearn{`, if we don't do that we won't pass it in the debugger. There is `if (__s[sVar5 - 1] == 0x7d)` which checks if the strings last characters is `0x7d`, or `}` in ASCII. The actual program flow such that the program builds the flag, we see 3  `__strcpy_chk`  calls and 3  `__memcpy_chk` calls. Those are similar to `strcpy` and `memcpy` but they check for buffer overflow. `__memcpy_chk` appends `_` into the string in the first 2 calls, and `}` in the last.  `__strcpy__chk` appends a different word depending on the condition.


#### Step-4:
With [gdb](https://www.sourceware.org/gdb/) we can see that the program saves each pointer of the resulting copy function and uses it later as a parameter. The word is then appended and it depends on the condition we have. `CMP R13,0x1c` - the program checks if the result in `buffer` (the flag) is 28 characters length. 

#### Step-5:
Finally the flag becomes:
`CTFlearn{Princess_Maha_Devi}`
