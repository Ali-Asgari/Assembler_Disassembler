# Assembler Disassembler for x64 Assembly Instructions

Python and NASM implementation of an Assembler and Disassembler for a wide range of x64 assembly instructions. They allow you to convert assembly instructions to their binary representation (machine code) using the Assembler, and vice versa using the Disassembler. The conversion between assembly instructions and their binary representation (machine code) is based on the reference provided at https://defuse.ca/online-x86-assembler.htm.  \
Example : xor edx,DWORD PTR [ebp+r9d*4+0x55] &#8660; 674233548d55 (hex)
## Usage
<!-- <hr> -->
### Python Assembler

To assemble assembly instructions using Python, follow these steps:

Open a terminal. Run the command:

    python3 Assembler.py

Enter your assembly instructions when prompted.

<hr>

### Python Disassembler

To disassemble binary representations to assembly instructions using Python, follow these steps:
Open a terminal. Run the command:

    python3 Disassembler.py.

Enter the machine code (hex number) when prompted.


<hr>

### NASM Assembler

To assemble assembly instructions using NASM, follow these steps:

Open a terminal. Run the following commands:

    nasm -f elf64 Assembler.asm && ld -o Assembler -e _start Assembler.o && ./Assembler

Enter the directory path of the file that includes your assembly instructions.\
Enter the directory path of the file where you want to save the machine codes.

<hr>

### NASM Disassembler

To disassemble binary representations to assembly instructions using NASM, follow these steps:
Open a terminal. Run the following commands:

    nasm -f elf64 Disassembler.asm && ld -o Disassembler -e _start Disassembler.o && ./Disassembler

Enter the directory path of the file that includes your machine codes.\
Enter the directory path of the file where you want to save the assembly instructions.

## Supported Instructions

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

Note : This tools are intended for x64 assembly instructions.