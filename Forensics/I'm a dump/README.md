## I'm a dump
The main idea to find the flag is to find strings.

#### Step-1:
After I downloaded `file`, I tried basic `cat`, `./` operations. 

#### Step-2:
But turns out, `strings file` gives us the flag. (I am not aware, but there might have been something else that author expected)

```bash
/lib64/ld-linux-x86-64.so.2
libc.so.6
__stack_chk_fail
__cxa_finalize
__libc_start_main
GLIBC_2.2.5
GLIBC_2.4
_ITM_deregisterTMCloneTable
__gmon_start__
_ITM_registerTMCloneTable
u3UH
CTFlearnH
{fl4ggyfH
l4g}H
[]A\A]A^A_
;*3$"
GCC: (Arch Linux 9.3.0-1) 9.3.0
init.c
crtstuff.c
deregister_tm_clones
__do_global_dtors_aux
completed.7393
__do_global_dtors_aux_fini_array_entry
frame_dummy
__frame_dummy_init_array_entry
flaggyFlag.c
__FRAME_END__
__init_array_end
_DYNAMIC
__init_array_start
__GNU_EH_FRAME_HDR
_GLOBAL_OFFSET_TABLE_
__libc_csu_fini
_ITM_deregisterTMCloneTable
_edata
__stack_chk_fail@@GLIBC_2.4
__libc_start_main@@GLIBC_2.2.5
__data_start
__gmon_start__
__dso_handle
_IO_stdin_used
__libc_csu_init
__bss_start
main
__TMC_END__
_ITM_registerTMCloneTable
__cxa_finalize@@GLIBC_2.2.5
.symtab
.strtab
.shstrtab
.interp
.note.gnu.build-id
.note.ABI-tag
.gnu.hash
.dynsym
.dynstr
.gnu.version
.gnu.version_r
.rela.dyn
.rela.plt
.init
.text
.fini
.rodata
.eh_frame_hdr
.eh_frame
.init_array
.fini_array
.dynamic
.got
.got.plt
.data
.bss
.comment
```

#### Step-3:
Finally, the flag becomes:
`CTFlearn{fl4ggyfl4g}`