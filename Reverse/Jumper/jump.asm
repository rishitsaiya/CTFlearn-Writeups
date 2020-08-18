0804848f <jump>:
 804848f:       55                      push   %ebp
 8048490:       89 e5                   mov    %esp,%ebp
 8048492:       83 ec 18                sub    $0x18,%esp
 8048495:       c7 45 f0 00 00 00 00    movl   $0x0,-0x10(%ebp)
 804849c:       83 ec 0c                sub    $0xc,%esp
 804849f:       68 70 85 04 08          push   $0x8048570
 80484a4:       e8 87 fe ff ff          call   8048330 <printf@plt>
 80484a9:       83 c4 10                add    $0x10,%esp
 80484ac:       a1 20 a0 04 08          mov    0x804a020,%eax
 80484b1:       83 ec 04                sub    $0x4,%esp
 80484b4:       50                      push   %eax
 80484b5:       6a 04                   push   $0x4
 80484b7:       8d 45 f0                lea    -0x10(%ebp),%eax
 80484ba:       50                      push   %eax
 80484bb:       e8 80 fe ff ff          call   8048340 <fgets@plt>
 80484c0:       83 c4 10                add    $0x10,%esp
 80484c3:       c7 45 f4 00 00 00 00    movl   $0x0,-0xc(%ebp)
 80484ca:       eb 0d                   jmp    80484d9 <jump+0x4a>
 80484cc:       8b 45 f0                mov    -0x10(%ebp),%eax
 80484cf:       83 c0 05                add    $0x5,%eax
 80484d2:       89 45 f0                mov    %eax,-0x10(%ebp)
 80484d5:       83 45 f4 01             addl   $0x1,-0xc(%ebp)
 80484d9:       83 7d f4 07             cmpl   $0x7,-0xc(%ebp)
 80484dd:       7e ed                   jle    80484cc <jump+0x3d>
 80484df:       8b 45 f0                mov    -0x10(%ebp),%eax
 80484e2:       ff d0                   call   *%eax <--- What address does this jump to??
 80484e4:       90                      nop
 80484e5:       c9                      leave
 80484e6:       c3                      ret
 80484e7:       66 90                   xchg   %ax,%ax
 80484e9:       66 90                   xchg   %ax,%ax
 80484eb:       66 90                   xchg   %ax,%ax
 80484ed:       66 90                   xchg   %ax,%ax
 80484ef:       90                      nop