; Andrha Pradesh Assembler Challenge for CTFLearn
; This challenge focuses on cmp, je and jne

section .data
    welcome db "Hello CTFlearn Andhra Pradesh Assembler Challenge!",0x0a,0x00
    noflag db "Sorry no flag for you :-(",0x0a,0x00
    alldone db "All Done!",0x0a,0x00
    baddata db "Baad Data!",0x0a,0x00
    congrats db "Congrats!! You found the flag!!", 0x0a, 0x00
    data    dw 0xbb35,0xbb4c,0xbb3a,0xbb54,0xbb5b,0xbb57,0xbb66,0xbb52,0xbb5d,0xbb30,\
               0xbb5f,0xbb5c,0xbb5b,0xbb66,0xbb57,0xbb56,0xbb57,0xbb5c,0xbb41,0xbb4c,\
               0xbb5b,0xbb54,0xbb6b,0xbb59,0xbb6b,0xbb63

;   ###################################################################
;   Change the values of these five constants to solve the challenge
    con1 db 0xab  ; C syntax for hex constant
    con2 db 0xcc  ;
    con3 db 0x20
    con4 db 0adh    ; this form for hex constants is popular among assembly language programmers
    con5 db 0bah
;   ####################################################################
;   Do not change any code below here

section .bss
    buffer resb 32

section .text
    global _start

_start:
    xor r8, r8      ; init the exit status to 0

    mov rax, 1      ; sys_write system call
    mov rdi, 1      ; stdout (write to screen)
    mov rsi, welcome   ; memory location of string to write
    mov rdx, 51     ; number of characters in string to write
    syscall

    xor rax, rax    ; clear the rax register
    mov al, [con1]  ; move the value of con1 to the low byte of rax
    cmp al, 0xab
    je _test2

    mov r8, 1       ; exit status
    jmp _noflagforyou

_test2:
    xor rax, rax
    mov al, [con2]
    cmp al, 0xcb
    jne _test3

    mov r8, 2       ; exit status
    jmp _noflagforyou

_test3:
    mov r8, 3       ; exit status
    xor rax, rax
    mov al, [con3]
    cmp al, 0x20
    ja  _noflagforyou

    mov r8, 4       ; exit status
    xor rax, rax
    mov al, [con3]
    cmp al, 20h
    jb _noflagforyou

_test4:
    ; https://en.wikibooks.org/wiki/X86_Assembly/X86_Architecture
    mov r8, 5h      ; exit status
    xor rax, rax
    mov al, [con4]
    mov ah, [con5]
    cmp ax, 0baadh
    jne _noflagforyou

    mov r8, 6h      ; exit status
_checkflag:
    xor rdx, rdx    ; clear the rdx register
    xor rcx, rcx    ; init the rcx counter to zero
    xor rbx, rbx    ; clear the rbx register
    mov bl, BYTE [con1]
    add bl, BYTE [con3]
    mov dl, BYTE [con4]
    mov dh, BYTE [con5]

_Loop1:
    xor rax, rax
    mov ax, WORD [data+rcx*2]
    sub ax, dx

    xor rax, rbx

    cmp rax, 32
    jb _baddata
    cmp rax, 126
    ja _baddata

    mov [buffer+rcx], BYTE al
    inc rcx
    cmp rcx, 26
    jb _Loop1
    mov [buffer+rcx], BYTE 0x0a

_printcongrats:
    mov rax, 1      ; sys_write system call
    mov rdi, 1      ; stdout
    mov rsi, congrats ; memory location of string to write
    mov rdx, 32     ; number of characters in string to write
    syscall

_printflag:
    mov rax, 1      ; sys_write system call
    mov rdi, 1      ; stdout
    mov rsi, buffer ; memory location of string to write
    mov rdx, 27     ; number of characters in string to write
    syscall

    mov r8, 0h      ; exit status
    jmp _alldone

_baddata:
    mov rax, 1      ; sys_write system call
    mov rdi, 1      ; stdout
    mov rsi, baddata ; memory location of string to write
    mov rdx, 11     ; number of characters in string to write
    syscall
    jmp _alldone

_noflagforyou:
    mov rax, 1      ; sys_write system call
    mov rdi, 1      ; stdout
    mov rsi, noflag ; memory location of string to write
    mov rdx, 26     ; number of characters in string to write
    syscall

_alldone:
    mov rax, 1      ; sys_write system call
    mov rdi, 1      ; stdout
    mov rsi, alldone ; memory location of string to write
    mov rdx, 10     ; number of characters in string to write
    syscall

_byebye:
    mov rax, 60     ; exit system call
    mov rdi, r8     ; return code saved in register r8
    syscall

