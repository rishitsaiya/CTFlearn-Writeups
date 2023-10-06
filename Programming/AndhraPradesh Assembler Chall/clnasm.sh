#!/bin/bash

set -x

# rm AndhraPradesh

nasm -f elf64 -F dwarf -o AndhraPradesh.o AndhraPradesh.asm

ld AndhraPradesh.o -o AndhraPradesh

set +x

chmod +x AndhraPradesh
./AndhraPradesh
echo $?


