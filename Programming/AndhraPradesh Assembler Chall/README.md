## AndhraPradesh Assembler Chall
The main idea finding the flag using basic variable values in conditional statements.

#### Step-1:
As per the instructions in file `readme`, I checked the constants provided in the `AndhraPradesh.asm` file.

```
; ###################################################################
;   Change the values of these five constants to solve the challenge
    con1 db 0x00  ; C syntax for hex constant
    con2 db 0x00  ;
    con3 db 0x00
    con4 db 00h    ; this form for hex constants is popular among assembly language programmers
    con5 db 00h
;   ####################################################################
```

#### Step-2:
The values of this constant are changed according to the flow of conditional statements as follows:

```
;   ###################################################################
;   Change the values of these five constants to solve the challenge
    con1 db 0xab  ; C syntax for hex constant
    con2 db 0xcc  ;
    con3 db 0x20
    con4 db 0adh    ; this form for hex constants is popular among assembly language programmers
    con5 db 0bah
;   ####################################################################
```

#### Step-3:
The modified values of the constants are then recomplied by executing the `clnasm.sh` script. The output generated is as follows:
```
+ nasm -f elf64 -F dwarf -o AndhraPradesh.o AndhraPradesh.asm
+ ld AndhraPradesh.o -o AndhraPradesh
+ set +x
Hello CTFlearn Andhra Pradesh Assembler Challenge!
Congrats!! You found the flag!!
CTFlearn{Hyderabad_Telugu}
All Done!
0
```

#### Step-4:
Finally the flag becomes:
`CTFlearn{Hyderabad_Telugu}`