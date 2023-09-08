#Assembler Disassembler for x64 Assembly Instructions

##This is a Python and NASM-based Assembler and Disassembler tool for a wide range of x64 assembly instructions. It allows you to convert assembly instructions to their binary representation (machine code) using the Assembler, and vice versa using the Disassembler. The tool's reference for these conversions is https://defuse.ca/online-x86-assembler.htm.
Usage
Python
Assembler

To assemble assembly instructions using Python, follow these steps:

    Open a terminal.
    Run the command: python3 Assembler.py.
    Enter your assembly instructions when prompted.

Disassembler

To disassemble binary representations to assembly instructions using Python, follow these steps:

    Open a terminal.
    Run the command: python3 Disassembler.py.
    Enter the machine code (hex string) when prompted.

NASM
Assembler

To assemble assembly instructions using NASM, follow these steps:

    Open a terminal.
    Run the following commands:
        nasm -f elf64 Assembler.asm
        ld -o Assembler -e _start Assembler.o
        ./Assembler
    Provide the directory path of the file that includes your assembly instructions.
    Provide the directory path of the file where you want to save the machine codes.

Disassembler

To disassemble binary representations to assembly instructions using NASM, follow these steps:

    Open a terminal.
    Run the following commands:
        nasm -f elf64 Disassembler.asm
        ld -o Disassembler -e _start Disassembler.o
        ./Disassembler
    Provide the directory path of the file that includes your machine codes.
    Provide the directory path of the file where you want to save the assembly instructions.

Supported Instructions

The following instructions are supported by this tool:
|   |   |   |   |   |
| ------------- | ------------- | ------------- | ------------- | ------------- |
| mov | add | adc | sub | sbb |
| and | or | xor | dec | inc |
| cmp | test | xchg | xadd | |
| imul | idiv |   |   |   |
| bsf | bsr |   |   |   |
| stc | clc |  std |  cld |   |
| shl | shr |  neg  |  not  |   |
| call | ret |  syscall  |  push  | pop  |


Note : that this tool is intended for x64 assembly instructions.