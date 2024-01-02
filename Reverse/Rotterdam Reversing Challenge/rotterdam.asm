            ;-- entry0:
            ;-- section..text:
            ;-- segment.LOAD1:
            ;-- .text:
            ;-- _start:
            ;-- map._home_zex_lab_ex_hacking_lab_ctflearn_Rotterdam.r_x:
            ;-- rip:
            0x00401000      41ba00000000   mov r10d, 0                 ; [01] -r-x section size 35569 named .text
            0x00401006      48b89da04000.  movabs rax, loc.congrats    ; 0x40a09d ; "Congrats!! You found the flag!!\n"
            0x00401010      48b800a04000.  movabs rax, map._home_zex_lab_ex_hacking_lab_ctflearn_Rotterdam.rw_ ; 0x40a000 ; "Hello CTFlearn.com Rotterdam Reversing Challenge by kcbowhunter\n"
            0x0040101a      e811060000     call loc._PrintString
            0x0040101f      48b871a14000.  movabs rax, loc.newline     ; 0x40a171 ; "\n"
            0x00401029      e802060000     call loc._PrintString
            0x0040102e      0f31           rdtsc
            0x00401030      48c1e220       shl rdx, 0x20
            0x00401034      4809d0         or rax, rdx
            0x00401037      488d1dea9100.  lea rbx, loc.tstart         ; loc._edata
                                                                       ; 0x40a228
            0x0040103e      4889c3         mov rbx, rax
            0x00401041      e8aa460000     call loc._InitTData
            0x00401046      480fb6052591.  movzx rax, byte [loc.time]  ; [0x40a173:1]=0
            0x0040104e      4883f800       cmp rax, 0
        ┌─< 0x00401052      7448           je loc._Step0
        │   0x00401054      48b89da04000.  movabs rax, loc.congrats    ; 0x40a09d ; "Congrats!! You found the flag!!\n"
        │   0x0040105e      48b82da14000.  movabs rax, loc.startt      ; 0x40a12d ; "Starting rdtsc: "
        │   0x00401068      e8c3050000     call loc._PrintString
        │   0x0040106d      488b05b49100.  mov rax, qword [loc.tstart] ; loc._edata
        │                                                              ; [0x40a228:8]=0
        │   0x00401074      e842060000     call loc._HexToString
        │   0x00401079      e8b2050000     call loc._PrintString
        │   0x0040107e      48b84fa14000.  movabs rax, loc.cpucycles   ; 0x40a14f ; " CPU Cycles\n"
        │   0x00401088      e8a3050000     call loc._PrintString
        │   0x0040108d      48b871a14000.  movabs rax, loc.newline     ; 0x40a171 ; "\n"
        │   0x00401097      e894050000     call loc._PrintString
        │   ;-- _Step0:
        └─> 0x0040109c      4158           pop r8
            0x0040109e      4983f801       cmp r8, 1                   ; 1
        ┌─< 0x004010a2      7537           jne loc._Step1
        │   0x004010a4      e8d7050000     call loc._Usage
        │   0x004010a9      48b871a14000.  movabs rax, loc.newline     ; 0x40a171 ; "\n"
       ┌──< 0x004010b3      e9d1040000     jmp loc._AllDone
       ││   ;-- _TooLong:
      ┌───> 0x004010b8      48b86da04000.  movabs rax, loc.toolong     ; 0x40a06d ; "Your flag kernel is too long dude!\n"
      ╎││   0x004010c2      e869050000     call loc._PrintString
      ╎││   0x004010c7      48b871a14000.  movabs rax, loc.newline     ; 0x40a171 ; "\n"
      ╎││   0x004010d1      e85a050000     call loc._PrintString
     ┌────< 0x004010d6      e9ae040000     jmp loc._AllDone
     │╎││   ;-- _Step1:
     │╎│└─> 0x004010db      48b89da04000.  movabs rax, loc.congrats    ; 0x40a09d ; "Congrats!! You found the flag!!\n"
     │╎│    0x004010e5      488b442408     mov rax, qword [rsp + 8]
     │╎│    0x004010ea      4989c0         mov r8, rax
     │╎│    0x004010ed      e86b050000     call loc._StringLength
     │╎│    0x004010f2      4883fb40       cmp rbx, 0x40               ; 64
     │└───< 0x004010f6      77c0           ja loc._TooLong
     │ │    0x004010f8      48b8e6a04000.  movabs rax, loc.flag1       ; 0x40a0e6 ; "Your flag is: CTFlearn{"
     │ │    0x00401102      e829050000     call loc._PrintString
     │ │    0x00401107      4c89c0         mov rax, r8
     │ │    0x0040110a      e821050000     call loc._PrintString
     │ │    0x0040110f      48b8fea04000.  movabs rax, loc.flag2       ; 0x40a0fe ; "}\n"
     │ │    0x00401119      e812050000     call loc._PrintString
     │ │    0x0040111e      48b871a14000.  movabs rax, loc.newline     ; 0x40a171 ; "\n"
     │ │    0x00401128      e803050000     call loc._PrintString
     │ │    0x0040112d      4831db         xor rbx, rbx
     │ │    0x00401130      b8c5000000     mov eax, 0xc5               ; 197
     │ │    0x00401135      e8a6060000     call loc._GetTData
     │ │    0x0040113a      4889c3         mov rbx, rax
     │ │    0x0040113d      b8ab000000     mov eax, 0xab               ; 171
     │ │    0x00401142      e899060000     call loc._GetTData
     │ │    0x00401147      4801c3         add rbx, rax
     │ │    0x0040114a      b8ab030000     mov eax, 0x3ab              ; 939
     │ │    0x0040114f      e88c060000     call loc._GetTData
     │ │    0x00401154      4801c3         add rbx, rax
     │ │    0x00401157      b877020000     mov eax, 0x277              ; 631
     │ │    0x0040115c      e87f060000     call loc._GetTData
     │ │    0x00401161      4801c3         add rbx, rax
     │ │    0x00401164      b801010000     mov eax, 0x101              ; 257
     │ │    0x00401169      e872060000     call loc._GetTData
     │ │    0x0040116e      4801c3         add rbx, rax
     │ │    0x00401171      b887000000     mov eax, 0x87               ; 135
     │ │    0x00401176      e865060000     call loc._GetTData
     │ │    0x0040117b      4801c3         add rbx, rax
     │ │    ;-- _Step1a:
     │ │    0x0040117e      498b00         mov rax, qword [r8]
     │ │    0x00401181      4831c3         xor rbx, rax
     │ │    0x00401184      48b8569ad581.  movabs rax, 0x4b227ff781d59a56
     │ │    0x0040118e      4839d8         cmp rax, rbx
     │ │    0x00401191      0f856b030000   jne loc._BadFlag
     │ │    ;-- _Step2:
     │ │    0x00401197      48b89da04000.  movabs rax, loc.congrats    ; 0x40a09d ; "Congrats!! You found the flag!!\n"
     │ │    0x004011a1      4831c0         xor rax, rax
     │ │    0x004011a4      b804000000     mov eax, 4
     │ │    0x004011a9      b904000000     mov ecx, 4
     │ │    0x004011ae      4801c1         add rcx, rax
     │ │    0x004011b1      4831c0         xor rax, rax
     │ │    0x004011b4      418a0408       mov al, byte [r8 + rcx]
     │ │    0x004011b8      4883f85f       cmp rax, 0x5f               ; 95
     │ │    0x004011bc      0f8540030000   jne loc._BadFlag
     │ │    ;-- _Step3:
     │ │    0x004011c2      48b89da04000.  movabs rax, loc.congrats    ; 0x40a09d ; "Congrats!! You found the flag!!\n"
     │ │    0x004011cc      b82f010000     mov eax, 0x12f              ; 303
     │ │    0x004011d1      e80a060000     call loc._GetTData
     │ │    0x004011d6      b9ffffffff     mov ecx, 0xffffffff         ; -1
     │ │    0x004011db      4821c8         and rax, rcx
     │ │    0x004011de      4831db         xor rbx, rbx
     │ │    0x004011e1      418b5809       mov ebx, dword [r8 + 9]
     │ │    0x004011e5      4801d8         add rax, rbx
     │ │    0x004011e8      48b946ff6457.  movabs rcx, 0x15764ff46
     │ │    0x004011f2      4839c8         cmp rax, rcx
     │ │    0x004011f5      0f8507030000   jne loc._BadFlag
     │ │    ;-- _Step3a:
     │ │    0x004011fb      4831d2         xor rdx, rdx
     │ │    0x004011fe      b814050000     mov eax, 0x514              ; 1300
     │ │    0x00401203      b964000000     mov ecx, 0x64               ; 'd' ; 100
     │ │    0x00401208      48f7f1         div rcx
     │ │    0x0040120b      4889c1         mov rcx, rax
     │ │    0x0040120e      4831c0         xor rax, rax
     │ │    0x00401211      418a0408       mov al, byte [r8 + rcx]
     │ │    0x00401215      4883f85f       cmp rax, 0x5f               ; 95
     │ │    0x00401219      0f85e3020000   jne loc._BadFlag
     │ │    ;-- _Step4:
     │ │    0x0040121f      4839c8         cmp rax, rcx
     │ │    0x00401222      0f84fa020000   je loc._WootWoot
     │ │    0x00401228      48b89da04000.  movabs rax, loc.congrats    ; 0x40a09d ; "Congrats!! You found the flag!!\n"
     │ │    0x00401232      b823010000     mov eax, 0x123              ; 291
     │ │    0x00401237      e8a4050000     call loc._GetTData
     │ │    0x0040123c      bbcdab0000     mov ebx, 0xabcd
     │ │    0x00401241      4831c3         xor rbx, rax
     │ │    0x00401244      4881ebadba00.  sub rbx, 0xbaad
     │ │    0x0040124b      b90201cdab     mov ecx, 0xabcd0102
     │ │    0x00401250      4831d9         xor rcx, rbx
     │ │    0x00401253      ba0df0adba     mov edx, 0xbaadf00d
     │ │    0x00401258      4801d1         add rcx, rdx
     │ │    0x0040125b      4889c3         mov rbx, rax
     │ │    0x0040125e      48b86da04000.  movabs rax, loc.toolong     ; 0x40a06d ; "Your flag kernel is too long dude!\n"
     │ │    0x00401268      b812000000     mov eax, 0x12               ; 18
     │ │    0x0040126d      e86e050000     call loc._GetTData
     │ │    0x00401272      4801c3         add rbx, rax
     │ │    0x00401275      48b891a04000.  movabs rax, loc.baddata     ; 0x40a091 ; "Baad Data!\n"
     │ │    0x0040127f      b812030000     mov eax, 0x312              ; 786
     │ │    0x00401284      e857050000     call loc._GetTData
     │ │    0x00401289      4801c3         add rbx, rax
     │ │    0x0040128c      48b8bea04000.  movabs rax, loc.falseflag   ; 0x40a0be ; "CTFlearn{R0tterdam_R0cks!}\n"
     │ │    0x00401296      b82b020000     mov eax, 0x22b              ; 555
     │ │    0x0040129b      e840050000     call loc._GetTData
     │ │    0x004012a0      4801c3         add rbx, rax
     │ │    0x004012a3      48b8daa04000.  movabs rax, loc.solarwinds  ; 0x40a0da ; "SolarWinds\n"
     │ │    0x004012ad      b81c010000     mov eax, 0x11c              ; 284
     │ │    0x004012b2      e829050000     call loc._GetTData
     │ │    0x004012b7      4801c3         add rbx, rax
     │ │    ;-- _Step4a:
     │ │    0x004012ba      48b8fecaadba.  movabs rax, 0xbaadf00dbaadcafe
     │ │    0x004012c4      4839e0         cmp rax, rsp
     │ │    0x004012c7      0f8455020000   je loc._WootWoot
     │ │    0x004012cd      48b89da04000.  movabs rax, loc.congrats    ; 0x40a09d ; "Congrats!! You found the flag!!\n"
     │ │    0x004012d7      498b400e       mov rax, qword [r8 + 0xe]
     │ │    0x004012db      4889c1         mov rcx, rax
     │ │    0x004012de      48b8ffffffff.  movabs rax, 0xffffffffff    ; 1099511627775
     │ │    0x004012e8      4821c1         and rcx, rax
     │ │    0x004012eb      4821c3         and rbx, rax
     │ │    0x004012ee      4839d9         cmp rcx, rbx
     │ │    0x004012f1      0f820b020000   jb loc._BadFlag
     │ │    0x004012f7      4829d9         sub rcx, rbx
     │ │    0x004012fa      48b85335a5d4.  movabs rax, 0x17d4a53553
     │ │    0x00401304      4839c1         cmp rcx, rax
     │ │    0x00401307      0f85f5010000   jne loc._BadFlag
     │ │    ;-- _Step4b:
     │ │    0x0040130d      4831d2         xor rdx, rdx
     │ │    0x00401310      b88742d309     mov eax, 0x9d34287
     │ │    0x00401315      4989c2         mov r10, rax
     │ │    0x00401318      b80df0adba     mov eax, 0xbaadf00d
     │ │    0x0040131d      49f7f2         div r10
     │ │    0x00401320      4889c1         mov rcx, rax
     │ │    0x00401323      4831c0         xor rax, rax
     │ │    0x00401326      418a0408       mov al, byte [r8 + rcx]
     │ │    0x0040132a      4883f85f       cmp rax, 0x5f               ; 95
     │ │    0x0040132e      0f85ce010000   jne loc._BadFlag
     │ │    ;-- _Step5:
     │ │    0x00401334      48b89da04000.  movabs rax, loc.congrats    ; 0x40a09d ; "Congrats!! You found the flag!!\n"
     │ │    0x0040133e      48bb18a14000.  movabs rbx, loc.debugger    ; 0x40a118 ; "Debugger Detected!!\n"
     │ │    0x00401348      4839d8         cmp rax, rbx
     │ │    0x0040134b      0f84d1010000   je loc._WootWoot
     │ │    0x00401351      4831db         xor rbx, rbx
     │ │    0x00401354      b823010000     mov eax, 0x123              ; 291
     │ │    0x00401359      e882040000     call loc._GetTData
     │ │    0x0040135e      4889c3         mov rbx, rax
     │ │    0x00401361      b812000000     mov eax, 0x12               ; 18
     │ │    0x00401366      e875040000     call loc._GetTData
     │ │    0x0040136b      4801c3         add rbx, rax
     │ │    0x0040136e      b812030000     mov eax, 0x312              ; 786
     │ │    0x00401373      e868040000     call loc._GetTData
     │ │    0x00401378      4801c3         add rbx, rax
     │ │    0x0040137b      b82b020000     mov eax, 0x22b              ; 555
     │ │    0x00401380      e85b040000     call loc._GetTData
     │ │    0x00401385      4801c3         add rbx, rax
     │ │    0x00401388      b81c010000     mov eax, 0x11c              ; 284
     │ │    0x0040138d      e84e040000     call loc._GetTData
     │ │    0x00401392      4801c3         add rbx, rax
     │ │    ;-- _Step5a:
     │ │    0x00401395      498b4014       mov rax, qword [r8 + 0x14]
     │ │    0x00401399      4889c1         mov rcx, rax
     │ │    0x0040139c      48b8ffffffff.  movabs rax, 0xffffffffff    ; 1099511627775
     │ │    0x004013a6      4821c1         and rcx, rax
     │ │    0x004013a9      4889c8         mov rax, rcx
     │ │    0x004013ac      4831d2         xor rdx, rdx
     │ │    0x004013af      48f7e3         mul rbx
     │ │    0x004013b2      4989c2         mov r10, rax
     │ │    0x004013b5      4989d3         mov r11, rdx
     │ │    0x004013b8      48b8beb9770a.  movabs rax, 0x37f7d400a77b9be
     │ │    0x004013c2      4c39d0         cmp rax, r10
     │ │    0x004013c5      0f8537010000   jne loc._BadFlag
     │ │    0x004013cb      48b838495487.  movabs rax, 0x6a87544938
     │ │    0x004013d5      4c39d8         cmp rax, r11
     │ │    0x004013d8      0f8524010000   jne loc._BadFlag
     │ │    ;-- _Step5b:
     │ │    0x004013de      4831d2         xor rdx, rdx
     │ │    0x004013e1      b8efbeadde     mov eax, 0xdeadbeef
     │ │    0x004013e6      b9adba0000     mov ecx, 0xbaad
     │ │    0x004013eb      48f7f1         div rcx
     │ │    0x004013ee      48             invalid
     │ │    0x004013ef      81             invalid
     │ │    0x004013f0      ea             invalid
     │ │    0x004013f1      a35b00004889.  movabs dword [0x3148d1894800005b], eax ; [0x3148d1894800005b:4]=-1
     │ │    0x004013fa      c0418a04       rol byte [rcx - 0x76], 4
     │ │    0x004013fe      084883         or byte [rax - 0x7d], cl
     │ │    0x00401401      f8             clc
     │ │    0x00401402      5f             pop rdi
     │ │    0x00401403      0f85f9000000   jne loc._BadFlag
     │ │    ;-- _Step6:
     │ │    0x00401409      48ffc1         inc rcx
     │ │    0x0040140c      498b0408       mov rax, qword [r8 + rcx]
     │ │    0x00401410      48c1e828       shr rax, 0x28
     │ │    0x00401414      4825ff000000   and rax, 0xff               ; 255
     │ │    0x0040141a      4883f800       cmp rax, 0
     │ │    0x0040141e      0f85de000000   jne loc._BadFlag
     │ │    0x00401424      498b0408       mov rax, qword [r8 + rcx]
     │ │    0x00401428      4889c1         mov rcx, rax
     │ │    0x0040142b      48b8ffffffff.  movabs rax, 0xffffffffff    ; 1099511627775
     │ │    0x00401435      4821c1         and rcx, rax
     │ │    ;-- _Step6a:
     │ │    0x00401438      48b818a14000.  movabs rax, loc.debugger    ; 0x40a118 ; "Debugger Detected!!\n"
     │ │    0x00401442      4831d2         xor rdx, rdx
     │ │    0x00401445      b8ab020000     mov eax, 0x2ab              ; 683
     │ │    0x0040144a      e891030000     call loc._GetTData
     │ │    0x0040144f      4889c3         mov rbx, rax
     │ │    0x00401452      48b818a14000.  movabs rax, loc.debugger    ; 0x40a118 ; "Debugger Detected!!\n"
     │ │    0x0040145c      b8a7000000     mov eax, 0xa7               ; 167
     │ │    0x00401461      e87a030000     call loc._GetTData
     │ │    0x00401466      4801c3         add rbx, rax
     │ │    0x00401469      48b89da04000.  movabs rax, loc.congrats    ; 0x40a09d ; "Congrats!! You found the flag!!\n"
     │ │    0x00401473      b823010000     mov eax, 0x123              ; 291
     │ │    0x00401478      e863030000     call loc._GetTData
     │ │    0x0040147d      4801c3         add rbx, rax
     │ │    ;-- _Step6b:
     │ │    0x00401480      4889d8         mov rax, rbx
     │ │    0x00401483      48f7f1         div rcx
     │ │    0x00401486      4989c2         mov r10, rax
     │ │    0x00401489      4989d3         mov r11, rdx
     │ │    0x0040148c      48b89da04000.  movabs rax, loc.congrats    ; 0x40a09d ; "Congrats!! You found the flag!!\n"
     │ │    0x00401496      b852534f00     mov eax, 0x4f5352           ; 'RSO'
     │ │    0x0040149b      4c39d0         cmp rax, r10
     │ │    0x0040149e      7562           jne loc._BadFlag
     │ │    0x004014a0      48b89da04000.  movabs rax, loc.congrats    ; 0x40a09d ; "Congrats!! You found the flag!!\n"
     │ │    0x004014aa      48b8bedb3059.  movabs rax, 0x55930dbbe
     │ │    0x004014b4      4c39d8         cmp rax, r11
     │ │    0x004014b7      7549           jne loc._BadFlag
     │ │    0x004014b9      48b89da04000.  movabs rax, loc.congrats    ; 0x40a09d ; "Congrats!! You found the flag!!\n"
     │ │    0x004014c3      e868010000     call loc._PrintString
     │ │    0x004014c8      48b801a14000.  movabs rax, loc.flag3       ; 0x40a101 ; "The flag is: CTFlearn{"
     │ │    0x004014d2      e859010000     call loc._PrintString
     │ │    0x004014d7      4c89c0         mov rax, r8
     │ │    0x004014da      e851010000     call loc._PrintString
     │ │    0x004014df      48b8fea04000.  movabs rax, loc.flag2       ; 0x40a0fe ; "}\n"
     │ │    0x004014e9      e842010000     call loc._PrintString
     │ │    0x004014ee      48             invalid
     │ │    0x004014ef      b8             invalid
     │ │    0x004014f0      71             invalid
     │ │    0x004014f1      a14000000000.  movabs eax, dword [0x33e8000000000040] ; [0x33e8000000000040:4]=-1 ; 3740239490531196992
     │ │    0x004014fa      0100           add dword [rax], eax
     │ │    0x004014fc      00e9           add cl, ch
     │ │    0x004014fe      8700           xchg dword [rax], eax
     │ │    0x00401500      0000           add byte [rax], al
     │ │    ;-- _BadFlag:
     │ │    0x00401502      48b841a04000.  movabs rax, loc.badflag     ; 0x40a041 ; "Sorry dood bad flag for you :-(\n"
     │ │    0x0040150c      e81f010000     call loc._PrintString
     │ │    0x00401511      48b871a14000.  movabs rax, loc.newline     ; 0x40a171 ; "\n"
     │ │    0x0040151b      e810010000     call loc._PrintString
     │ │    0x00401520      eb67           jmp loc._AllDone
     │ │    ;-- _WootWoot:
     │ │    0x00401522      48b89da04000.  movabs rax, loc.congrats    ; 0x40a09d ; "Congrats!! You found the flag!!\n"
     │ │    0x0040152c      e8ff000000     call loc._PrintString
     │ │    0x00401531      48b801a14000.  movabs rax, loc.flag3       ; 0x40a101 ; "The flag is: CTFlearn{"
     │ │    0x0040153b      e8f0000000     call loc._PrintString
     │ │    0x00401540      4c89c0         mov rax, r8
     │ │    0x00401543      e8e8000000     call loc._PrintString
     │ │    0x00401548      48b8fea04000.  movabs rax, loc.flag2       ; 0x40a0fe ; "}\n"
     │ │    0x00401552      e8d9000000     call loc._PrintString
     │ │    0x00401557      48b871a14000.  movabs rax, loc.newline     ; 0x40a171 ; "\n"
     │ │    0x00401561      e8ca000000     call loc._PrintString
     │ │    0x00401566      eb21           jmp loc._AllDone
     │ │    ;-- _Debugger:
     │ │    0x00401568      48b89da04000.  movabs rax, loc.congrats    ; 0x40a09d ; "Congrats!! You found the flag!!\n"
     │ │    0x00401572      48b818a14000.  movabs rax, loc.debugger    ; 0x40a118 ; "Debugger Detected!!\n"
     │ │    0x0040157c      e8af000000     call loc._PrintString
     │ │    0x00401581      41baff000000   mov r10d, 0xff              ; 255
     │ │    0x00401587      eb00           jmp loc._AllDone
     │ │    ;-- _AllDone:
     └─└──> 0x00401589      0f31           rdtsc
            0x0040158b      48c1e220       shl rdx, 0x20
            0x0040158f      4809d0         or rax, rdx
            0x00401592      4889c3         mov rbx, rax
            0x00401595      480fb605d68b.  movzx rax, byte [loc.time]  ; [0x40a173:1]=0
            0x0040159d      4883f800       cmp rax, 0
            0x004015a1      745d           je loc._Step99
            0x004015a3      48b83ea14000.  movabs rax, loc.endt        ; 0x40a13e ; "Ending   rdtsc: "
            0x004015ad      e87e000000     call loc._PrintString
            0x004015b2      4889d8         mov rax, rbx
            0x004015b5      e801010000     call loc._HexToString
            0x004015ba      e871000000     call loc._PrintString
            0x004015bf      48b84fa14000.  movabs rax, loc.cpucycles   ; 0x40a14f ; " CPU Cycles\n"
            0x004015c9      e862000000     call loc._PrintString
            0x004015ce      48b85ca14000.  movabs rax, loc.elapsed     ; 0x40a15c ; "Elapsed CPU cycles: "
            0x004015d8      e853000000     call loc._PrintString
            0x004015dd      4889d8         mov rax, rbx
            0x004015e0      482b05418c00.  sub rax, qword [loc.tstart] ; loc._edata
                                                                       ; [0x40a228:8]=0
            0x004015e7      e8cf000000     call loc._HexToString
            0x004015ec      e83f000000     call loc._PrintString
            0x004015f1      48b871a14000.  movabs rax, loc.newline     ; 0x40a171 ; "\n"
            0x004015fb      e830000000     call loc._PrintString
            ;-- _Step99:
            0x00401600      48b862a04000.  movabs rax, loc.alldone     ; 0x40a062 ; "All Done!\n"
            0x0040160a      e821000000     call loc._PrintString
            0x0040160f      48b89da04000.  movabs rax, loc.congrats    ; 0x40a09d ; "Congrats!! You found the flag!!\n"
            0x00401619      b83c000000     mov eax, 0x3c               ; '<' ; 60
            0x0040161e      4c89d7         mov rdi, r10
            0x00401621      0f05           syscall
            0x00401623      662e0f1f8400.  nop word cs:[rax + rax]
            0x0040162d      0f1f00         nop dword [rax]
            ;-- _PrintString:
            0x00401630      50             push rax
            0x00401631      52             push rdx
            0x00401632      51             push rcx
            0x00401633      53             push rbx
            0x00401634      50             push rax
            0x00401635      4831db         xor rbx, rbx
            0x00401638      4831c9         xor rcx, rcx
            ;-- _printStringLoop:
            0x0040163b      48ffc0         inc rax
            0x0040163e      48ffc3         inc rbx
            0x00401641      8a08           mov cl, byte [rax]
            0x00401643      80f900         cmp cl, 0
            0x00401646      75f3           jne loc._printStringLoop
            ;-- _PrintString2:
            0x00401648      b801000000     mov eax, 1
            0x0040164d      bf01000000     mov edi, 1
            0x00401652      5e             pop rsi
            0x00401653      4889da         mov rdx, rbx
            0x00401656      0f05           syscall
            0x00401658      5b             pop rbx
            0x00401659      59             pop rcx
            0x0040165a      5a             pop rdx
            0x0040165b      58             pop rax
            0x0040165c      c3             ret
            ;-- _StringLength:
            0x0040165d      51             push rcx
            0x0040165e      50             push rax
            0x0040165f      4831db         xor rbx, rbx
            ;-- _StringLengthLoop:
            0x00401662      48ffc0         inc rax
            0x00401665      48ffc3         inc rbx
            0x00401668      8a08           mov cl, byte [rax]
            0x0040166a      80f900         cmp cl, 0
            0x0040166d      75f3           jne loc._StringLengthLoop
            0x0040166f      58             pop rax
            0x00401670      59             pop rcx
            0x00401671      c3             ret
            0x00401672      662e0f1f8400.  nop word cs:[rax + rax]
            0x0040167c      0f1f4000       nop dword [rax]
            ;-- _Usage:
            0x00401680      48b8c8a14000.  movabs rax, loc.usage1      ; 0x40a1c8 ; "Usage: Rotterdam kernel\n"
            0x0040168a      e8a1ffffff     call loc._PrintString
            0x0040168f      48b8e1a14000.  movabs rax, loc.usage2      ; 0x40a1e1 ; "       where kernel is defined as CTFlearn{kernel}\n"
            0x00401699      e892ffffff     call loc._PrintString
            0x0040169e      c3             ret
            ;-- _PrintHexNumber:
            0x0040169f      50             push rax
            0x004016a0      e816000000     call loc._HexToString
            0x004016a5      e886ffffff     call loc._PrintString
            0x004016aa      48b815a24000.  movabs rax, loc.newline_1   ; 0x40a215 ; "\n"
            0x004016b4      e877ffffff     call loc._PrintString
            0x004016b9      58             pop rax
            0x004016ba      c3             ret
            ;-- _HexToString:
            0x004016bb      4883f800       cmp rax, 0
            0x004016bf      752e           jne loc._HexToStringNonZero
            0x004016c1      c60588ab0000.  mov byte [loc.hexbuffer], 0x30 ; '0'
                                                                       ; [0x40c250:1]=0
            0x004016c8      c60582ab0000.  mov byte [0x0040c251], 0x78 ; 'x'
                                                                       ; [0x40c251:1]=0
            0x004016cf      c6057cab0000.  mov byte [0x0040c252], 0x30 ; '0'
                                                                       ; [0x40c252:1]=0
            0x004016d6      c60576ab0000.  mov byte [0x0040c253], 0x30 ; '0'
                                                                       ; [0x40c253:1]=0
            0x004016dd      c60570ab0000.  mov byte [0x0040c254], 0    ; [0x40c254:1]=0
            0x004016e4      48b850c24000.  movabs rax, loc.hexbuffer   ; 0x40c250
            0x004016ee      c3             ret
            ;-- _HexToStringNonZero:
            0x004016ef      53             push rbx
            0x004016f0      51             push rcx
            0x004016f1      52             push rdx
            0x004016f2      4150           push r8
            0x004016f4      4151           push r9
            0x004016f6      4152           push r10
            0x004016f8      4831db         xor rbx, rbx
            0x004016fb      4831c9         xor rcx, rcx
            0x004016fe      4831d2         xor rdx, rdx
            0x00401701      4d31c0         xor r8, r8
            0x00401704      4d31c9         xor r9, r9
            0x00401707      4d31d2         xor r10, r10
            0x0040170a      4889c3         mov rbx, rax
            0x0040170d      48b850c24000.  movabs rax, loc.hexbuffer   ; 0x40c250
            0x00401717      480fcb         bswap rbx
            ;-- _HexToStringLabel1:
            0x0040171a      4889da         mov rdx, rbx
            0x0040171d      4881e2ff0000.  and rdx, 0xff               ; 255
            0x00401724      48c1eb08       shr rbx, 8
            0x00401728      4883fa00       cmp rdx, 0
            0x0040172c      74ec           je loc._HexToStringLabel1
            0x0040172e      c6051bab0000.  mov byte [loc.hexbuffer], 0x30 ; '0'
                                                                       ; [0x40c250:1]=0
            0x00401735      c60515ab0000.  mov byte [0x0040c251], 0x78 ; 'x'
                                                                       ; [0x40c251:1]=0
            0x0040173c      b902000000     mov ecx, 2
            ;-- _HexToStringLabel2:
            0x00401741      4989d0         mov r8, rdx
            0x00401744      48c1ea04       shr rdx, 4
            0x00401748      4c8d8a17a240.  lea r9, [rdx + loc.hexchars]
            0x0040174f      458a11         mov r10b, byte [r9]
            0x00401752      44889150c240.  mov byte [rcx + loc.hexbuffer], r10b
            0x00401759      48ffc1         inc rcx
            0x0040175c      4c89c2         mov rdx, r8
            0x0040175f      4883e20f       and rdx, 0xf                ; 15
            0x00401763      4c8d8a17a240.  lea r9, [rdx + loc.hexchars]
            0x0040176a      458a11         mov r10b, byte [r9]
            0x0040176d      44889150c240.  mov byte [rcx + loc.hexbuffer], r10b
            0x00401774      48ffc1         inc rcx
            0x00401777      c68150c24000.  mov byte [rcx + loc.hexbuffer], 0
            0x0040177e      48b850c24000.  movabs rax, loc.hexbuffer   ; 0x40c250
            ;-- _HexToStringLabel3:
            0x00401788      4883fb00       cmp rbx, 0
            0x0040178c      7410           je loc._HexToStringAllDone
            0x0040178e      4889da         mov rdx, rbx
            0x00401791      4881e2ff0000.  and rdx, 0xff               ; 255
            0x00401798      48c1eb08       shr rbx, 8
            0x0040179c      eba3           jmp loc._HexToStringLabel2
            ;-- _HexToStringAllDone:
            0x0040179e      415a           pop r10
            0x004017a0      4159           pop r9
            0x004017a2      4158           pop r8
            0x004017a4      5a             pop rdx
            0x004017a5      59             pop rcx
            0x004017a6      5b             pop rbx
            0x004017a7      c3             ret
            ;-- _Sum8Bytes:
            0x004017a8      53             push rbx
            0x004017a9      51             push rcx
            0x004017aa      52             push rdx
            0x004017ab      4150           push r8
            0x004017ad      4831db         xor rbx, rbx
            0x004017b0      4831c9         xor rcx, rcx
            0x004017b3      4831d2         xor rdx, rdx
            0x004017b6      4d31c0         xor r8, r8
            0x004017b9      4889c3         mov rbx, rax
            ;-- _Sum8BytesLoop:
            0x004017bc      4989d8         mov r8, rbx
            0x004017bf      4981e0ff0000.  and r8, 0xff                ; 255
            0x004017c6      4c01c2         add rdx, r8
            0x004017c9      48c1eb08       shr rbx, 8
            0x004017cd      48ffc1         inc rcx
            0x004017d0      4883f908       cmp rcx, 8                  ; 8
            0x004017d4      72e6           jb loc._Sum8BytesLoop
            0x004017d6      4889d0         mov rax, rdx
            0x004017d9      4158           pop r8
            0x004017db      5a             pop rdx
            0x004017dc      59             pop rcx
            0x004017dd      5b             pop rbx
            0x004017de      c3             ret
            0x004017df      90             nop
            ;-- _GetTData:
            0x004017e0      4883f85c       cmp rax, 0x5c               ; 92
            0x004017e4      7508           jne loc.tlabel000
            0x004017e6      488b05b39a00.  mov rax, qword [loc.t522]   ; [0x40b2a0:8]=0
            0x004017ed      c3             ret
            ;-- tlabel000:
            0x004017ee      48             invalid
            0x004017ef      3d             invalid
            0x004017f0      e3             invalid
            0x004017f1      0300           add eax, dword [rax]
            0x004017f3      007508         add byte [rbp + 8], dh
            0x004017f6      488b05f39600.  mov rax, qword [loc.t404]   ; [0x40aef0:8]=0
            0x004017fd      c3             ret
            ;-- tlabel001:
            0x004017fe      483dc5000000   cmp rax, 0xc5               ; 197
            0x00401804      7508           jne loc.tlabel002
            0x00401806      488b05f39600.  mov rax, qword [loc.t406]   ; [0x40af00:8]=0
            0x0040180d      c3             ret
            ;-- tlabel002:
            0x0040180e      483d51010000   cmp rax, 0x151              ; 337
            0x00401814      7508           jne loc.tlabel003
            0x00401816      488b05939a00.  mov rax, qword [loc.t524]   ; [0x40b2b0:8]=0
            0x0040181d      c3             ret
            ;-- tlabel003:
            0x0040181e      483d0f010000   cmp rax, 0x10f              ; 271
            0x00401824      7508           jne loc.tlabel004
            0x00401826      488b05f39500.  mov rax, qword [loc.t378]   ; [0x40ae20:8]=0
            0x0040182d      c3             ret
            ;-- tlabel004:
            0x0040182e      483d09020000   cmp rax, 0x209              ; 521
            0x00401834      7508           jne loc.tlabel005
            0x00401836      488b056b9300.  mov rax, qword [loc.t299]   ; [0x40aba8:8]=0
            0x0040183d      c3             ret
            ;-- tlabel005:
            0x0040183e      483d6e030000   cmp rax, 0x36e              ; 878
            0x00401844      7508           jne loc.tlabel006
            0x00401846      488b05cba200.  mov rax, qword [loc.t793]   ; [0x40bb18:8]=0
            0x0040184d      c3             ret
            ;-- tlabel006:
            0x0040184e      483dff020000   cmp rax, 0x2ff              ; 767
            0x00401854      7508           jne loc.tlabel007
            0x00401856      488b05ab9700.  mov rax, qword [loc.t439]   ; [0x40b008:8]=0
            0x0040185d      c3             ret
            ;-- tlabel007:
            0x0040185e      483d6a030000   cmp rax, 0x36a              ; 874
            0x00401864      7508           jne loc.tlabel008
            0x00401866      488b0533a000.  mov rax, qword [loc.t714]   ; [0x40b8a0:8]=0
            0x0040186d      c3             ret
            ;-- tlabel008:
            0x0040186e      483d8f020000   cmp rax, 0x28f              ; 655
            0x00401874      7508           jne loc.tlabel009
            0x00401876      488b05038e00.  mov rax, qword [loc.t134]   ; [0x40a680:8]=0
            0x0040187d      c3             ret
            ;-- tlabel009:
            0x0040187e      4883f86d       cmp rax, 0x6d               ; 109
            0x00401882      7508           jne loc.tlabel010
            0x00401884      488b05659900.  mov rax, qword [loc.t500]   ; [0x40b1f0:8]=0
            0x0040188b      c3             ret
            ;-- tlabel010:
            0x0040188c      483d79030000   cmp rax, 0x379              ; 889
            0x00401892      7508           jne loc.tlabel011
            0x00401894      488b056d8d00.  mov rax, qword [loc.t119]   ; [0x40a608:8]=0
            0x0040189b      c3             ret
            ;-- tlabel011:
            0x0040189c      483d06030000   cmp rax, 0x306              ; 774
            0x004018a2      7508           jne loc.tlabel012
            0x004018a4      488b05c5a300.  mov rax, qword [loc.t836]   ; [0x40bc70:8]=0
            0x004018ab      c3             ret
            ;-- tlabel012:
            0x004018ac      483d75010000   cmp rax, 0x175              ; 373
            0x004018b2      7508           jne loc.tlabel013
            0x004018b4      488b05359a00.  mov rax, qword [loc.t532]   ; [0x40b2f0:8]=0
            0x004018bb      c3             ret
            ;-- tlabel013:
            0x004018bc      483d82020000   cmp rax, 0x282              ; 642
            0x004018c2      7508           jne loc.tlabel014
            0x004018c4      488b05bd9400.  mov rax, qword [loc.t359]   ; [0x40ad88:8]=0
            0x004018cb      c3             ret
            ;-- tlabel014:
            0x004018cc      483de2010000   cmp rax, 0x1e2              ; 482
