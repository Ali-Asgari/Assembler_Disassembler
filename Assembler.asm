%include "in_out.asm"
section .data
    msg_enter_dir1 db "Enter directory to open file:",0xA,0
    msg_enter_dir2 db "Enter directory to create result:",0xA,0
    msg_save1 db "Binary file saved to :",0xA,0
    msg_save2 db "Hex file saved to :",0xA,0
    file_descriptor dq 0
    new_file_descriptor1 dq 0
    new_file_descriptor2 dq 0
    memory_sambol db '[',0
    end_memory_sambol db ']',0
    byte_sambol db 'BYTE',0
    word_sambol db 'WORD',0
    dword_sambol db 'DWORD',0
    qword_sambol db 'QWORD',0
    r8_sambol db 'r8',0
    r9_sambol db 'r9',0
    r10_sambol db 'r10',0
    r11_sambol db 'r11',0
    r12_sambol db 'r12',0
    r13_sambol db 'r13',0
    r14_sambol db 'r14',0
    r15_sambol db 'r15',0
    eax_sambol db "eax",0
    ebx_sambol db "ebx",0
    ecx_sambol db "ecx",0
    edx_sambol db "edx",0
    esp_sambol db "esp",0
    ebp_sambol db "ebp",0
    esi_sambol db "esi",0
    edi_sambol db "edi",0
    r8d_sambol db "r8d",0
    r9d_sambol db "r9d",0
    r10d_sambol db "r10d",0
    r11d_sambol db "r11d",0
    r12d_sambol db "r12d",0
    r13d_sambol db "r13d",0
    r14d_sambol db "r14d",0
    r15d_sambol db "r15d",0
    plus_sambol db '+',0
    mul_sambol db '*',0
    dict_sambol db ':',0
    end_sambol db ',',0
    to_sambol db ' to ',0
    xax_sambol db 'Xax',0
    ax_sambol db 'ax',0
    al_sambol db 'al',0
    zero_sambol db '0',0
    blank db ' ',0
    next_line db 0xa,0
    number_of_oprands db 0
    oprand1_type db ' ' ,0
    oprand2_type db ' ',0
    need_rex db ' ',0
    prefix_66 db ' ',0
    prefix_67 db ' ',0
    prefix_66_code db '01100110',0
    prefix_67_code db '01100111',0
    sambol_8 dq '8',0
    sambol_16 dq 16,0
    sambol_32 dq '32',0
    bp_sambol db "bp",0
    s_sambol db 's',0
    mov_sambol db 'mov',0
    test_sambol db 'test',0
    with_64_sambol db '==64',0
    no_64_sambol db '!=64',0
    imul_sambol db 'imul',0
    jmp_sambol db 'jmp',0
    push_sambol db 'push',0
    sambol0 db '0000',0
    sambol1 db '0001',0
    sambol2 db '0010',0
    sambol3 db '0011',0
    sambol4 db '0100',0
    sambol5 db '0101',0
    sambol6 db '0110',0
    sambol7 db '0111',0
    sambol8 db '1000',0
    sambol9 db '1001',0
    sambola db '1010',0
    sambolb db '1011',0
    sambolc db '1100',0
    sambold db '1101',0
    sambole db '1110',0
    sambolf db '1111',0
    binary_file db 'Binary_machin_code.txt',0
    hex_file db 'Hex_machin_code.txt',0
    rex_code db '0100',0
    rex_w db '0',0
    R db '0',0
    X db '0',0
    B db '0',0
    cod_w db '0',0
    mod db '  ',0
    reg_op db '   ',0
    r_m db '   ',0
    Scales db '  ',0
    Inx db '   ',0
    Bas db '   ',0
    tempch db ' ',0
    reg_list db "rax,eax,ax,ah,al,rbx,ebx,bx,bh,bl,rcx,ecx,cx,ch,cl,rdx,edx,dx,dh,dl,rsp,esp,sp,rbp,ebp,bp,rsi,esi,si,rdi,edi,di,r8,r8d,r8w,r8b,r9,r9d,r9w,r9b,r10,r10d,r10w,r10b,r11,r11d,r11w,r11b,r12,r12d,r12w,r12b,r13,r13d,r13w,r13b,r14,r14d,r14w,r14b,r15,r15d,r15w,r15b,",0
    reg_8_bit db "al,bl,cl,dl,ah,bh,ch,dh,r8b,r9b,r10b,r11b,r12b,r13b,r14b,r15b,",0
    reg_16_bit db "ax,bx,cx,dx,sp,bp,si,di,r8w,r9w,r10w,r11w,r12w,r13w,r14w,r15w,",0
    reg_32_bit db "eax,ebx,ecx,edx,esp,ebp,esi,edi,r8d,r9d,r10d,r11d,r12d,r13d,r14d,r15d,",0
    reg_64_bit db "rax,rbx,rcx,rdx,rsp,rbp,rsi,rdi,r8,r9,r10,r11,r12,r13,r14,r15,",0
    reg64_code db "rax:0000,eax:0000,ax:0000,ah:0100,al:0000,rbx:0011,ebx:0011,bx:0011,bh:0111,bl:0011,rcx:0001,ecx:0001,cx:0001,ch:0101,cl:0001,rdx:0010,edx:0010,dx:0010,dh:0110,dl:0010,rsp:0100,esp:0100,sp:0100,rbp:0101,ebp:0101,bp:0101,rsi:0110,esi:0110,si:0110,rdi:0111,edi:0111,di:0111,r8:1000,r8d:1000,r8w:1000,r8b:1000,r9:1001,r9d:1001,r9w:1001,r9b:1001,r10:1010,r10d:1010,r10w:1010,r10b:1010,r11:1011,r11d:1011,r11w:1011,r11b:1011,r12:1100,r12d:1100,r12w:1100,r12b:1100,r13:1101,r13d:1101,r13w:1101,r13b:1101,r14:1110,r14d:1110,r14w:1110,r14b:1110,r15:1111,r15d:1111,r15w:1111,r15b:1111,",0
    opration_dict db "#two oprands mov R to R:1000100,#w : 11 R1 R2 mov M to R:1000101,#w : mod R r/m mov R to M:1000100,#w : mod R r/m mov I to r==64:1100011,#w : 11 000 R : immediate data mov I to M:1100011,#w : mod 000 r/m : immediate data mov I to r!=64:1011,# w R : immediate data add R to R:0000000,#w : 11 R1 R2 add M to R:0000001,#w : mod R r/m add R to M:0000000,#w : mod R r/m add I to R:100000s,#w : 11 000 R immdata add I to M:100000s,#w : mod 000 r/m : immediate data add I to Xax:0000010,#w : immediate data adc R to R:0001000,#w : 11 R1 R2 adc M to R:0001001,#w : mod R r/m adc R to M:0001000,#w : mod R r/m adc I to R:100000s,#w : 11 010 R immdata adc I to M:100000s,#w : mod 010 r/m : immediate data adc I to Xax:0001010,#w : immediate data sub R to R:0010100,#w : 11 R1 R2 sub M to R:0010101,#w : mod R r/m sub R to M:0010100,#w : mod R r/m sub I to R:100000s,#w : 11 101 R immdata sub I to M:100000s,#w : mod 101 r/m : immediate data sub I to Xax:0010110,#w : immediate data sbb R to R:0001100,#w : 11 R1 R2 sbb M to R:0001101,#w : mod R r/m sbb R to M:0001100,#w : mod R r/m sbb I to R:100000s,#w : 11 011 R immdata sbb I to M:100000s,#w : mod 011 r/m : immediate data sbb I to Xax:0001110,#w : immediate data and R to R:0010000,#w : 11 R1 R2 and M to R:0010001,#w : mod R r/m and R to M:0010000,#w : mod R r/m and I to R:100000s,#w : 11 100 R immdata and I to M:100000s,#w : mod 100 r/m : immediate data and I to Xax:0010010,#w : immediate data or R to R:0000100,#w : 11 R1 R2 or M to R:0000101,#w : mod R r/m or R to M:0000100,#w : mod R r/m or I to R:100000s,#w : 11 001 R immdata or I to M:100000s,#w : mod 001 r/m : immediate data or I to Xax:0000110,#w : immediate data xor R to R:0011000,#w : 11 R1 R2 xor M to R:0011001,#w : mod R r/m xor R to M:0011000,#w : mod R r/m xor I to R:100000s,#w : 11 110 R immdata xor I to M:100000s,#w : mod 110 r/m : immediate data xor I to Xax:0011010,#w : immediate data cmp R to R:0011100,#w : 11 R1 R2 cmp M to R:0011101,#w : mod R r/m cmp R to M:0011100,#w : mod R r/m cmp I to R:100000s,#w : 11 111 R immdata cmp I to M:100000s,#w : mod 111 r/m : immediate data cmp I to Xax:0011110,#w : immediate data test R to R:1000010,#w : 11 R1 R2 test M to R:1000010,#w : mod R r/m test R to M:1000010,#w : mod R r/m test I to R:1111011,#w : 11 000 R immdata test I to M:1111011,#w : mod 000 r/m : immediate data test I to Xax:1010100,#w : immediate data #   !!!!!!! sometime no w xchg R to R:1000011,#w : 11 R1 R2 xchg M to R:1000011,#w : mod R r/m xchg R to M:1000011,#w : mod R r/m xchg R to Xax:10010,#R xadd R to R:000011111100000,#w : 11 R1 R2 xadd M to R:000011111100000,#w : mod R r/m #     !!!!!!! no w bsf R to R:0000111110111100,#11 R1 R2 bsf M to R:0000111110111100,#mod R r/m #     !!!!!!! no w bsr R to R:0000111110111101,#11 R1 R2 bsr M to R:0000111110111101,#mod R r/m #one oprands dec R:1111111,#w : 11 001 R dec M:1111111,#w : mod 001 r_m inc R:1111111,#w : 11 000 R inc M:1111111,#w : mod 000 r_m idiv R:1111011,#w : 11 111 R errrror idiv M:1111011,#w : mod 111 r_m #     !!!!!!! no w # R:1111 1111,# : 11 110 R push R:01010,# : R push M:11111111,# : mod 110 r_m push I:011010s0,# : immediate data #     !!!!!!! no w # R:1000 1111,# : 11 000 R pop R:01011,# : R pop M:10001111,# : mod 000 r_m neg R:1111011,#w : 11 011 R neg M:1111011,#w : mod 011 r_m not R:1111011,#w : 11 010 R not M:1111011,#w : mod 010 r_, #     !!!!!!! no w jmp I:11101001,#displacement32 jmp R:11111111,# : 11 100 R jmp M:11111111,#mod 100 r_m and rex #     !!!!!!! no w call I:11101000,#displacement32 call R:11111111,# : 11 010  R call M:11111111,#mod 010  r_m and rex jcc I:000011111000,# tttn : full displacement #can be one can be two oprand #            !!!!!!! sometime no w #one oprand imul R:1111011,#w : 11 101 R imul M:1111011,#w : mod 101 r_m #two oprand imul R to R:0000111110101111,# : 11 : R1 R2 imul M to R:0000111110101111,# : mod : R r_m #one oprand  shl R:1101000,#w : 11 100 R shl M:1101000,#w : mod 100 r_m #two oprand shl I to R:1100000,#w : 11 100 R : imm8 data shl I to M:1100000,#w : mod 100 r_m : imm8 data #one oprand  shr R:1101000,#w : 11 101 R shr M:1101000,#w : mod 101 r_m #two oprand shr I to R:1100000,#w : 11 101 R : imm8 data shr I to M:1100000,#w : mod 101 r_m : imm8 data #no oprand stc:11111001, clc:11111000, std:11111101, cld:11111100, syscall:0000111100000101, # can be one oprand or zero ret:11000011,",0
    no_w_list db "bsf,bsr,pop,push,imul,jmp,call,",0
    change_oprand_place db "bsf,bsr,imul,",0
    xchg_sambol db 'xchg,',0
    displacment_dict db "0:00,8:01,16:10,32:10,",0
    scale_dict db "1:00,2:01,4:10,8:11,",0
    opcode_reg_op_dict db "mov:000,add:000,adc:010,sub:101,sbb:011,and:100,or:001,xor:110,cmp:111,test:000,dec:001,inc:000,push:110,pop:000,neg:011,not:010,imul:101,idiv:111,shl:100,shr:101,jmp:100,call:010,jcc:,ret:,",0
    ax_reg_opration_list db "add,adc,sub,sbb,and,or,xor,cmp,",0
    shift_list db "shr,shl,",0
    jmp_call db "jmp,call,",0
    push_pop db "push,pop,",0
section .bss
    directory resb 100
    folder_directory resb 100
    new_directory1 resb 100
    new_directory2 resb 100
    read_buf resb 2
    now_line resb 100
    tempstr resb 100
    tempstr2 resb 100
    opration resb 20
    oprand1 resb 100
    oprand2 resb 100
    base resb 20
    scale resb 20
    index resb 20
    disp resb 20
    displacment resb 33
    opration_dict_key resb 20
    opcode resb 20
    binary_result resb 100
    binary_result2 resb 100
    hexed_result resb 200
    imm_data resb 33
    ez_imm_data resb 33
    rev_imm_data resb 33
    maxim_size_imm resb 1
    msg_save resb 1000
section .text
    global _start

%macro prints 1
    push    rax
    mov     rax,%1
    call    putc
    call    newLine
    pop     rax
%endmacro
%macro printn 1
    push    rax
    mov     rax,%1
    call    writeNum
    call    newLine
    pop     rax
%endmacro
%macro mov_mem 2
    push r8
    mov r8b,%2
    mov %1,r8b
    pop r8 
%endmacro 
;get string from input
getString :
    xor rcx,rcx
    str_c:
        xor rax, rax
        call getc
        cmp al, NL
        je after_c1
        mov [rsi + rcx], al
        inc rcx
        jmp str_c
    after_c1:
        ret
;open file
openFile:
    ; rdi : file name; rsi : file access mode 
    ; rdx: file permission, do not need
    mov rax, sys_open
    mov rdi,r15
    mov rsi, O_RDWR     
    syscall
    mov [file_descriptor],rax
    ;return fd in rax
    ret
;read file
readFile:
    ; rdi : file descriptor ; rsi : buffer ; rdx : length
    mov rax, sys_read
    mov rdi,[file_descriptor]
    syscall
    ; return number of read byte in rax
    mov  byte[read_buf+rax], 0 ; add a  zero
    ret
;close file
closeFile:
    ; rdi : file descriptor
    mov rax, sys_close
    syscall
    ret
;creat file
creatFile:
    ; rdi : file name; rsi : file permission
    mov     rax, sys_create
    mov     rsi, sys_IRUSR | sys_IWUSR 
    syscall
    ;return file descriptor in rax
    ret
;write file
writeFile:
    ; rdi : file descriptor ; rsi : buffer ; rdx : length
    mov     rax, sys_write
    syscall
    ret
;find [rax] after index rcx in [rbx] list and return index in rcx
in_function:
    push r8
    push r9
    push rdx
    dec rcx
    loop_in_1:
        inc rcx
        mov r8b,[rbx+rcx]
        cmp r8b,0
        je not_found
        cmp [rax],r8b
        jne loop_in_1
        xor rdx,rdx
        mov r8,rcx
        loop_sub_2:
            inc rdx
            inc r8
            cmp byte [rax+rdx],0
            je finished_in
            mov r9b,[rbx+r8]
            cmp r9b,0
            je not_found
            cmp [rax+rdx],r9b
            jne loop_in_1
            jmp loop_sub_2
    not_found:
        mov rcx,-1
    finished_in:
    pop rdx
    pop r9
    pop r8
    ret
%macro call_in_function 3
    push rax
    push rbx
    mov rax,%1
    mov rbx,%2
    mov rcx,%3
    call in_function
    pop rbx
    pop rax
%endmacro
; sub string [rax[rbx:rcx]] go to [rdx]
substr:
    push r8
    push r9
    mov r8,-1
    dec rbx
    loop_sub:
        inc rbx
        inc r8
        cmp rbx,rcx
        jae finished_sub
        xor r9,r9
        mov r9b,[rax+rbx]
        cmp r9b,0
        je finished_sub
        mov [rdx+r8],r9b
        jmp loop_sub
    finished_sub:
    mov byte [rdx+r8],0
    pop r9
    pop r8 
    ret
%macro call_substr 4
    mov rax,%1
    mov rbx,%2
    mov rcx,%3
    mov rdx,%4
    call substr
%endmacro
%macro find_in_dict 3
    ;%1 is key
    ;%2 is dictionary
    ;%3 is result
    call_in_function %1,%2,0
    call_in_function dict_sambol,%2,rcx
    mov r8,rcx
    inc r8
    call_in_function end_sambol,%2,rcx
    call_substr %2,r8,rcx,%3
%endmacro
; concat two string [rax] and [rbx]
concat:
    push r8
    mov rcx,-1
    loop_concat_1:
        inc rcx
        cmp byte[rax+rcx],0
        jne loop_concat_1
    dec rcx
    mov rdx,-1
    loop_concat_2:
        inc rcx
        inc rdx
        mov r8b,[rbx+rdx]
        mov [rax+rcx],r8b
        cmp byte[rbx+rdx],0
        jne loop_concat_2
    pop r8
    ret
%macro call_concat 2
    push rax
    push rbx
    mov rax,%1
    mov rbx,%2
    call concat
    pop rbx
    pop rax
%endmacro
;find type [rax] result is in [rbx]
find_type:
    push rbx
    check_register:
        cmp byte[rax],'1'
        je it_is_imm
        mov rbx,reg_list
        xor rcx,rcx
        call in_function
        cmp rcx,-1
        je check_memory
        pop rbx
        mov byte[rbx],'R'
        ret
    check_memory:
        mov rbx,rax
        mov rax,memory_sambol
        xor rcx,rcx
        call in_function
        cmp rcx,-1
        je it_is_imm
        pop rbx
        mov byte [rbx],'M'
        ret
    it_is_imm:
        pop rbx
        mov byte [rbx],'I'
        ret
%macro call_find_type 2
    push rax
    push rbx
    mov rax,%1
    mov rbx,%2
    call find_type
    pop rbx
    pop rax
%endmacro
;find size of oprand [rax] with type [rbx] and result in rcx
oprand_size:
    cmp byte[rbx],'R'
    jne find_size_mem
    find_size_reg:
        push r8
        mov r8,rax
        mov byte[tempstr],0
        call_concat tempstr,r8
        call_concat tempstr,end_sambol
        mov rax,tempstr
        pop r8
        check_reg_8:
        mov rbx,reg_8_bit
        mov rcx,0
        call in_function
        cmp rcx,-1
        je check_reg_16
        mov rcx,8
        jmp return_oprand_size
        check_reg_16:
        mov rbx,reg_16_bit
        mov rcx,0
        call in_function
        cmp rcx,-1
        je check_reg_32
        mov rcx,16
        jmp return_oprand_size
        check_reg_32:
        mov rbx,reg_32_bit
        mov rcx,0
        call in_function
        cmp rcx,-1
        je check_reg_64
        mov rcx,32
        jmp return_oprand_size
        check_reg_64:
        mov rcx,64
        jmp return_oprand_size
    find_size_mem:
        cmp byte[rbx],'M'
        jne return_oprand_size
        mov rbx,rax
        check_mem_8:
        mov rax,byte_sambol
        mov rcx,0
        call in_function
        cmp rcx,-1
        je check_mem_64
        mov rcx,8
        jmp return_oprand_size
        check_mem_64:
        mov rax,qword_sambol
        mov rcx,0
        call in_function
        cmp rcx,-1
        je check_mem_32
        mov rcx,64
        jmp return_oprand_size
        check_mem_32:
        mov rax,dword_sambol
        mov rcx,0
        call in_function
        cmp rcx,-1
        je check_mem_16
        mov rcx,32
        jmp return_oprand_size
        check_mem_16:
        mov rcx,16
    return_oprand_size:
        ret
%macro call_oprand_size 2
    push rax
    push rbx
    mov rax,%1
    mov rbx,%2
    call oprand_size
    pop rbx
    pop rax
%endmacro
;find that [rax] oprand have new register or not r8...r15
check_new_register:
    push r8
    mov r8,rax
    call_in_function r8_sambol,r8,0
    cmp rcx,-1
    jne new_reg
    call_in_function r9_sambol,r8,0
    cmp rcx,-1
    jne new_reg
    call_in_function r10_sambol,r8,0
    cmp rcx,-1
    jne new_reg
    call_in_function r11_sambol,r8,0
    cmp rcx,-1
    jne new_reg
    call_in_function r12_sambol,r8,0
    cmp rcx,-1
    jne new_reg
    call_in_function r13_sambol,r8,0
    cmp rcx,-1
    jne new_reg
    call_in_function r14_sambol,r8,0
    cmp rcx,-1
    jne new_reg
    call_in_function r15_sambol,r8,0
    cmp rcx,-1
    jne new_reg
    no_new_reg:
        mov byte[tempch],'N'
        pop r8
        ret
    new_reg:
        mov byte[tempch],'Y'
        pop r8
        ret
;find that [rax] memory oprand need prefix67 or not
check_prefix_67:
    cmp byte [prefix_67],'Y'
    je return_c_p
    push r8
    mov r8,rax
    call_in_function eax_sambol,r8,0
    cmp rcx,-1
    jne need_67
    call_in_function ebx_sambol,r8,0
    cmp rcx,-1
    jne need_67
    call_in_function ecx_sambol,r8,0
    cmp rcx,-1
    jne need_67
    call_in_function edx_sambol,r8,0
    cmp rcx,-1
    jne need_67
    call_in_function esp_sambol,r8,0
    cmp rcx,-1
    jne need_67
    call_in_function ebp_sambol,r8,0
    cmp rcx,-1
    jne need_67
    call_in_function esi_sambol,r8,0
    cmp rcx,-1
    jne need_67
    call_in_function edi_sambol,r8,0
    cmp rcx,-1
    call_in_function r8d_sambol,r8,0
    cmp rcx,-1
    jne need_67
    call_in_function r9d_sambol,r8,0
    cmp rcx,-1
    jne need_67
    call_in_function r10d_sambol,r8,0
    cmp rcx,-1
    jne need_67
    call_in_function r11d_sambol,r8,0
    cmp rcx,-1
    jne need_67
    call_in_function r12d_sambol,r8,0
    cmp rcx,-1
    jne need_67
    call_in_function r13d_sambol,r8,0
    cmp rcx,-1
    jne need_67
    call_in_function r14d_sambol,r8,0
    cmp rcx,-1
    jne need_67
    call_in_function r15d_sambol,r8,0
    cmp rcx,-1
    jne need_67
    pop r8
    ret
    need_67:
        mov byte[prefix_67],'Y'
        mov rax,r8
        pop r8
        ret
    return_c_p:
    ret
;find that [rax] oprand with type [rbx] need rex or not
check_rex:
    cmp byte [need_rex],'Y'
    je return_c_r
    push rax
    push rbx
    mov r9,'N'
    mov r8,'Y'
    mov rbx,rax
    mov rax,r8_sambol
    mov rcx,0
    call in_function
    cmp rcx,-1
    cmovne  r9,r8
    mov rax,r9_sambol
    mov rcx,0
    call in_function
    cmp rcx,-1
    cmovne  r9,r8
    mov rax,r10_sambol
    mov rcx,0
    call in_function
    cmp rcx,-1
    cmovne  r9,r8
    mov rax,r11_sambol
    mov rcx,0
    call in_function
    cmp rcx,-1
    cmovne  r9,r8
    mov rax,r12_sambol
    mov rcx,0
    call in_function
    cmp rcx,-1
    cmovne  r9,r8
    mov rax,r13_sambol
    mov rcx,0
    call in_function
    cmp rcx,-1
    cmovne  r9,r8
    mov rax,r14_sambol
    mov rcx,0
    call in_function
    cmp rcx,-1
    cmovne  r9,r8
    mov rax,r15_sambol
    mov rcx,0
    call in_function
    cmp rcx,-1
    cmovne  r9,r8
    pop rbx
    pop rax
    call oprand_size
    cmp rcx,64
    cmove  r9,r8
    mov byte [need_rex],r9b
    return_c_r:
        ret
;size of immediate in [rax] result in rbx 
find_num_imm:
    push rax
    cmp byte[rax],0
    je return_z
    mov r8,rax
    xor rax,rax
    mov rcx,1
    calc_imm:
        inc rcx
        cmp byte[r8+rcx],0
        je return_find_size_imm
        xor r9,r9
        mov r9b,[r8+rcx]
        sub r9,48
        cmp r9,9
        ja abcdef
        jmp adding
        abcdef:
            add r9,48
            add r9,87
        adding:
        mul qword[sambol_16]
        add rax,r9
        jmp calc_imm
    return_z:
        mov rax,0
    return_find_size_imm:
    mov rbx,rax
    pop rax
    ret
;size of displacment in [rax] that is 0 or 8 or 32 result in rbx(string) and rcx(number)
disp_size:
    ;int([rax])>128 -> 32 else 8 
    call find_num_imm
    cmp rbx,0
    je ret_0
    cmp rbx,128
    jb ret_8
    jmp ret_32
    ret_0:
        mov rcx,0
        mov rbx,zero_sambol
        ret
    ret_8:
        mov rcx,8
        mov rbx,sambol_8
        ret
    ret_32:
        mov rcx,32
        mov rbx,sambol_32
        ret
;change immediate data in [rax] that must have size of rbx to binary result in rev_imm date
immediate_to_binary:
    cmp rbx,0
    je no_imm
    jmp with_imm
    no_imm:
        mov byte[rev_imm_data],0
        ret
    with_imm:
    mov r8,rbx
    mov rcx,-1
    cmp byte [rax],0
    jne after_zero
    loop_Zero:
        inc rcx
        cmp rcx,rbx
        je done_zero
        mov byte [rev_imm_data+rcx],'0'
        jmp loop_Zero
    done_zero:
        mov byte [rev_imm_data+rcx],0
        ret
    after_zero:
    mov rcx,1
    mov rdx,0
    hex_to_bin:
        inc rcx
        cmp byte [rax+rcx],0
        one_to_hex:
            je add_extra_zero
            cmp byte [rax+rcx],'0'
            je add_0000
            cmp byte [rax+rcx],'1'
            je add_0001
            cmp byte [rax+rcx],'2'
            je add_0010
            cmp byte [rax+rcx],'3'
            je add_0011
            cmp byte [rax+rcx],'4'
            je add_0100
            cmp byte [rax+rcx],'5'
            je add_0101
            cmp byte [rax+rcx],'6'
            je add_0110
            cmp byte [rax+rcx],'7'
            je add_0111
            cmp byte [rax+rcx],'8'
            je add_1000
            cmp byte [rax+rcx],'9'
            je add_1001
            cmp byte [rax+rcx],'a'
            je add_1010
            cmp byte [rax+rcx],'b'
            je add_1011
            cmp byte [rax+rcx],'c'
            je add_1100
            cmp byte [rax+rcx],'d'
            je add_1101
            cmp byte [rax+rcx],'e'
            je add_1110
            cmp byte [rax+rcx],'f'
            je add_1111
        add_0000:
            mov byte[imm_data+rdx],'0'
            mov byte[imm_data+rdx+1],'0'
            mov byte[imm_data+rdx+2],'0'
            mov byte[imm_data+rdx+3],'0'
            jmp after_add_4
        add_0001:
            mov byte[imm_data+rdx],'0'
            mov byte[imm_data+rdx+1],'0'
            mov byte[imm_data+rdx+2],'0'
            mov byte[imm_data+rdx+3],'1'
            jmp after_add_4
        add_0010:
            mov byte[imm_data+rdx],'0'
            mov byte[imm_data+rdx+1],'0'
            mov byte[imm_data+rdx+2],'1'
            mov byte[imm_data+rdx+3],'0'
            jmp after_add_4
        add_0011:
            mov byte[imm_data+rdx],'0'
            mov byte[imm_data+rdx+1],'0'
            mov byte[imm_data+rdx+2],'1'
            mov byte[imm_data+rdx+3],'1'
            jmp after_add_4
        add_0100:
            mov byte[imm_data+rdx],'0'
            mov byte[imm_data+rdx+1],'1'
            mov byte[imm_data+rdx+2],'0'
            mov byte[imm_data+rdx+3],'0'
            jmp after_add_4
        add_0101:
            mov byte[imm_data+rdx],'0'
            mov byte[imm_data+rdx+1],'1'
            mov byte[imm_data+rdx+2],'0'
            mov byte[imm_data+rdx+3],'1'
            jmp after_add_4
        add_0110:
            mov byte[imm_data+rdx],'0'
            mov byte[imm_data+rdx+1],'1'
            mov byte[imm_data+rdx+2],'1'
            mov byte[imm_data+rdx+3],'0'
            jmp after_add_4
        add_0111:
            mov byte[imm_data+rdx],'0'
            mov byte[imm_data+rdx+1],'1'
            mov byte[imm_data+rdx+2],'1'
            mov byte[imm_data+rdx+3],'1'
            jmp after_add_4
        add_1000:
            mov byte[imm_data+rdx],'1'
            mov byte[imm_data+rdx+1],'0'
            mov byte[imm_data+rdx+2],'0'
            mov byte[imm_data+rdx+3],'0'
            jmp after_add_4
        add_1001:
            mov byte[imm_data+rdx],'1'
            mov byte[imm_data+rdx+1],'0'
            mov byte[imm_data+rdx+2],'0'
            mov byte[imm_data+rdx+3],'1'
            jmp after_add_4
        add_1010:
            mov byte[imm_data+rdx],'1'
            mov byte[imm_data+rdx+1],'0'
            mov byte[imm_data+rdx+2],'1'
            mov byte[imm_data+rdx+3],'0'
            jmp after_add_4
        add_1011:
            mov byte[imm_data+rdx],'1'
            mov byte[imm_data+rdx+1],'0'
            mov byte[imm_data+rdx+2],'1'
            mov byte[imm_data+rdx+3],'1'
            jmp after_add_4
        add_1100:
            mov byte[imm_data+rdx],'1'
            mov byte[imm_data+rdx+1],'1'
            mov byte[imm_data+rdx+2],'0'
            mov byte[imm_data+rdx+3],'0'
            jmp after_add_4
        add_1101:
            mov byte[imm_data+rdx],'1'
            mov byte[imm_data+rdx+1],'1'
            mov byte[imm_data+rdx+2],'0'
            mov byte[imm_data+rdx+3],'1'
            jmp after_add_4
        add_1110:
            mov byte[imm_data+rdx],'1'
            mov byte[imm_data+rdx+1],'1'
            mov byte[imm_data+rdx+2],'1'
            mov byte[imm_data+rdx+3],'0'
            jmp after_add_4
        add_1111:
            mov byte[imm_data+rdx],'1'
            mov byte[imm_data+rdx+1],'1'
            mov byte[imm_data+rdx+2],'1'
            mov byte[imm_data+rdx+3],'1'
            jmp after_add_4
        after_add_4:
        add rdx,4
        jmp hex_to_bin
    add_extra_zero:
        mov r9,rdx 
        mov byte[imm_data+r9],0
        mov byte[ez_imm_data],0
        sub r8,r9
        loop_add_zero:
            dec r8
            cmp r8,0
            jl after_loop_add_zero
            call_concat ez_imm_data,zero_sambol
            jmp loop_add_zero
        after_loop_add_zero:
            call_concat ez_imm_data,imm_data
    reverse_it:
        mov byte[rev_imm_data],0
        mov r8,rbx
        add r8,8
        loop_rev:
            sub r8,8
            cmp r8,0
            jbe done_rev
            mov r9,r8
            sub r9,8
            call_substr ez_imm_data,r9,r8,tempstr
            call_concat rev_imm_data,tempstr
            jmp loop_rev
        done_rev:
        ret

;find all base scale index displacement in memory at [rax]
;base + index *index + disp
find_base_index:
    push r8
    push r9
    mov r9,rax
    call_in_function mul_sambol,r9,0
    cmp rcx,-1
    je no_scale_mod
    mov r8,rcx
    ;r8 is index of '*'
    call_in_function plus_sambol,r9,0
    cmp rcx,r8
    ja no_base_with_scale
    ;rcx is index of first '+'
    base_with_scale:
        ;[0:rcx] is base
        call_substr r9,0,rcx,base
        ;[rcx+1:r8] is index
        inc rcx
        call_substr r9,rcx,r8,index
        call_in_function plus_sambol,r9,r8
        cmp rcx,-1
        je base_with_scale_no_disp
        ;rcx is index of second '+'
        base_with_scale_with_disp:
            ;[r8+1:rcx] is scale
            inc r8
            call_substr r9,r8,rcx,scale
            ;[rcx+1:] is disp
            inc rcx
            call_substr r9,rcx,100,disp
            jmp finished_base_index
        base_with_scale_no_disp:
            ;[r8+1:] is scale
            inc r8
            call_substr r9,r8,100,scale
            mov byte [disp],0
            jmp finished_base_index
    no_base_with_scale:
        mov byte [base],0
        ;[0:r8] is index
        call_substr r9,0,r8,index
        call_in_function plus_sambol,r9,r8
        cmp rcx,-1
        je base_with_scale_no_disp
        no_base_with_scale_with_disp:
            ;[r8+1:rcx] is scale
            inc r8
            call_substr r9,r8,rcx,scale
            ;[rcx+1:] is disp
            inc rcx
            call_substr r9,rcx,100,disp
            jmp finished_base_index
        no_base_with_scale_no_disp:
            ;[r8+1:] is scale
            inc r8
            call_substr r9,r8,100,scale
            mov byte [disp],0
            jmp finished_base_index
    no_scale_mod:
        call_in_function plus_sambol,r9,0
        cmp rcx,-1
        je one_op
        mov r8,rcx
        inc rcx
        call_in_function plus_sambol,r9,rcx
        cmp rcx,-1
        je two_op
        three_op:
            ;scale = '1'
            mov byte [scale],'1'
            mov byte [scale+1],0
            ;[r8+1:rcx] is index
            inc r8
            call_substr r9,r8,rcx,index
            dec r8
            ;[rcx+1:] is disp
            inc rcx
            call_substr r9,rcx,100,disp
            ;[0:r8] is base
            call_substr r9,0,r8,base
            jmp finished_base_index
        two_op:
            ;[r8+1:]==reg ->is index else is dsip 
            inc r8
            call_substr r9,r8,100,tempstr ;tttttttttttttttttttttttt
            dec r8
            call_find_type tempstr,tempch
            cmp byte [tempch],'R'
            jne it_is_disp_two_op
            call_substr tempstr,0,100,index
            mov byte [scale],'1'
            mov byte [scale+1],0
            jmp after_index_disp
            it_is_disp_two_op:
                call_substr tempstr,0,100,disp
            after_index_disp:
            ;[0:r8] is base
            call_substr r9,0,r8,base
            jmp finished_base_index
        one_op:
            ;[:]==reg ->is index else is dsip 
            call_substr r9,0,100,tempstr
            call_find_type tempstr,tempch
            cmp byte [tempch],'R'
            jne it_is_disp_one_op
            call_substr tempstr,0,100,base
            jmp finished_base_index
            it_is_disp_one_op:
            call_substr tempstr,0,100,disp
            jmp finished_base_index
    finished_base_index:
        pop r9
        pop r8
        ret
;calculate binary code memory in [rax]
calc_mem:
    mov r9,rax
    call check_prefix_67
    call_in_function memory_sambol,r9,0
    mov r8,rcx
    inc r8
    call_in_function end_memory_sambol,r9,rcx
    call_substr r9,r8,rcx,tempstr2
    mov rax,tempstr2
    call find_base_index
    cmp byte[base],0
    je no_base
    jmp with_base
    with_base:
        call_in_function bp_sambol,base,0
        cmp rcx,-1
        je with_base_no_bp
        jmp with_base_with_bp
        with_base_no_bp:
            cmp byte[index],0
            je with_base_no_bp_no_index ; halat 1
            jmp with_base_no_bp_with_index ; halat 6
        with_base_with_bp:
            cmp byte[index],0
            je with_base_with_bp_no_index ; halat 4
            jmp with_base_with_bp_with_index ; halat 3
    no_base:
        cmp byte[index],0
        je no_base_no_index ; halat 5
        jmp no_base_with_index ; halat 2
    with_base_no_bp_no_index: ; halat 1 base + disp
        mov rax,disp
        call disp_size
        mov r8,rbx
        mov r9,rcx
        find_in_dict r8,displacment_dict,mod
        find_in_dict base,reg64_code,tempstr2
        mov_mem [B],[tempstr2]
        mov_mem [r_m],[tempstr2+1]
        mov_mem [r_m+1],[tempstr2+2]
        mov_mem [r_m+2],[tempstr2+3]
        mov rax,disp
        mov rbx,r9
        call immediate_to_binary
        call_concat displacment,rev_imm_data
        ret
    no_base_with_index: ; halat 2 index * scalse + disp
        mov byte[mod],'0'
        mov byte[mod+1],'0'
        mov byte[B],'0'
        mov byte[r_m],'1'
        mov byte[r_m+1],'0'
        mov byte[r_m+2],'0'
        find_in_dict scale,scale_dict,Scales
        mov byte[base],'r'
        mov byte[base+1],'b'
        mov byte[base+2],'p'
        mov byte[base+3],0
        find_in_dict base,reg64_code,tempstr2
        mov_mem [Bas],[tempstr2+1]
        mov_mem [Bas+1],[tempstr2+2]
        mov_mem [Bas+2],[tempstr2+3]
        find_in_dict index,reg64_code,tempstr2
        mov_mem [X],[tempstr2]
        mov_mem [Inx],[tempstr2+1]
        mov_mem [Inx+1],[tempstr2+2]
        mov_mem [Inx+2],[tempstr2+3]
        mov rax,disp
        mov rbx,32
        call immediate_to_binary 
        call_concat displacment,rev_imm_data
        ret
    with_base_with_bp_with_index: ; halat 3 bp + index + disp
        mov byte[r_m],'1'
        mov byte[r_m+1],'0'
        mov byte[r_m+2],'0'
        find_in_dict scale,scale_dict,Scales
        find_in_dict index,reg64_code,tempstr2
        mov_mem [X],[tempstr2]
        mov_mem [Inx],[tempstr2+1]
        mov_mem [Inx+1],[tempstr2+2]
        mov_mem [Inx+2],[tempstr2+3]
        find_in_dict base,reg64_code,tempstr2
        mov_mem [Bas],[tempstr2+1]
        mov_mem [Bas+1],[tempstr2+2]
        mov_mem [Bas+2],[tempstr2+3]
        mov rax,disp
        call disp_size
        cmp rcx,0
        je add_8bit_disp
        jmp dont_change_disp
        add_8bit_disp:
            mov byte[mod],'0'
            mov byte[mod+1],'1'
            mov r9,8
            jmp after_check_bp
        dont_change_disp:
            mov rax,disp
            call disp_size
            mov r8,rbx
            mov r9,rcx
            find_in_dict r8,displacment_dict,mod
        after_check_bp:
        mov rax,disp
        mov rbx,r9
        call immediate_to_binary
        call_concat displacment,rev_imm_data
        ret
    with_base_with_bp_no_index: ; halat 4 bp + disp
        mov byte[r_m],'1'
        mov byte[r_m+1],'0'
        mov byte[r_m+2],'1'
        mov rax,disp
        call disp_size
        cmp rcx,0
        je add_8bit_disp1
        jmp dont_change_disp1
        add_8bit_disp1:
            mov byte[mod],'0'
            mov byte[mod+1],'1'
            mov r9,8
            jmp after_check_bp1
        dont_change_disp1:
            mov rax,disp
            call disp_size
            mov r8,rbx
            mov r9,rcx
            find_in_dict r8,displacment_dict,mod
        after_check_bp1:
        mov rax,disp
        mov rbx,r9
        call immediate_to_binary
        call_concat displacment,rev_imm_data
        ret
    no_base_no_index: ; halat 5  direct addressing
        mov byte[mod],'0'
        mov byte[mod+1],'0'
        mov byte[r_m],'1'
        mov byte[r_m+1],'0'
        mov byte[r_m+2],'0'
        mov byte[Scales],'0'
        mov byte[Scales+1],'0'
        mov byte[Inx],'1'
        mov byte[Inx+1],'0'
        mov byte[Inx+2],'0'
        mov byte[Bas],'1'
        mov byte[Bas+1],'0'
        mov byte[Bas+2],'1'
        mov rax,disp
        mov rbx,32
        call immediate_to_binary 
        call_concat displacment,rev_imm_data
        ret
    with_base_no_bp_with_index: ; halat 6 base + index + disp
        mov byte[r_m],'1'
        mov byte[r_m+1],'0'
        mov byte[r_m+2],'0'
        mov rax,disp
        call disp_size
        mov r8,rbx
        mov r9,rcx
        find_in_dict r8,displacment_dict,mod
        find_in_dict scale,scale_dict,Scales
        find_in_dict base,reg64_code,tempstr2
        mov_mem [B],[tempstr2]
        mov_mem [Bas],[tempstr2+1]
        mov_mem [Bas+1],[tempstr2+2]
        mov_mem [Bas+2],[tempstr2+3]
        find_in_dict index,reg64_code,tempstr2
        mov_mem [X],[tempstr2]
        mov_mem [Inx],[tempstr2+1]
        mov_mem [Inx+1],[tempstr2+2]
        mov_mem [Inx+2],[tempstr2+3]
        mov rax,disp
        mov rbx,r9
        call immediate_to_binary
        call_concat displacment,rev_imm_data
        ret
%macro call_calc_memory 1
    push rax
    mov rax,%1
    call calc_mem
    pop rax
%endmacro
;hex binary in [rax] result in hexed_result
binary_to_hex:
    push rbx
    push r8
    push r9
    push rdx
    push r10
    push r13
    mov r8,rax
    mov byte [hexed_result],0
    mov byte [binary_result2],0
    mov rbx,-1
    find_len:
        inc rbx
        cmp byte[rax+rbx],0
        jne find_len
    mov r9,8
    xor rdx,rdx
    mov rax,rbx
    div r9
    cmp rdx,0
    je now_hex_it
    sub r9,rdx
    inc r9
    loop_add_first_zero:
        dec r9
        cmp r9,0
        je now_hex_it
        call_concat binary_result2,zero_sambol
        jmp loop_add_first_zero
    now_hex_it:
    call_concat binary_result2,r8
    mov byte [binary_result],0
    call_concat binary_result,binary_result2
    mov r9,-4
    mov r13,0
    hex_4_to_one:
        add r9,4
        cmp byte[binary_result2+r9],0
        je done_hexing
        mov r10,r9
        add r10,4
        call_substr binary_result2,r9,r10,tempstr
        call_in_function sambol0,tempstr,0
        cmp rcx,-1
        jne add0
        call_in_function sambol1,tempstr,0
        cmp rcx,-1
        jne add1
        call_in_function sambol2,tempstr,0
        cmp rcx,-1
        jne add2
        call_in_function sambol3,tempstr,0
        cmp rcx,-1
        jne add3
        call_in_function sambol4,tempstr,0
        cmp rcx,-1
        jne add4
        call_in_function sambol5,tempstr,0
        cmp rcx,-1
        jne add5
        call_in_function sambol6,tempstr,0
        cmp rcx,-1
        jne add6
        call_in_function sambol7,tempstr,0
        cmp rcx,-1
        jne add7
        call_in_function sambol8,tempstr,0
        cmp rcx,-1
        jne add8
        call_in_function sambol9,tempstr,0
        cmp rcx,-1
        jne add9
        call_in_function sambola,tempstr,0
        cmp rcx,-1
        jne adda
        call_in_function sambolb,tempstr,0
        cmp rcx,-1
        jne addb
        call_in_function sambolc,tempstr,0
        cmp rcx,-1
        jne addc
        call_in_function sambold,tempstr,0
        cmp rcx,-1
        jne addd
        call_in_function sambole,tempstr,0
        cmp rcx,-1
        jne adde
        call_in_function sambolf,tempstr,0
        cmp rcx,-1
        jne addf
        add0:
            mov byte[hexed_result+r13],'0'
            jmp after_add_one
        add1:
            mov byte[hexed_result+r13],'1'
            jmp after_add_one
        add2:
            mov byte[hexed_result+r13],'2'
            jmp after_add_one
        add3:
            mov byte[hexed_result+r13],'3'
            jmp after_add_one
        add4:
            mov byte[hexed_result+r13],'4'
            jmp after_add_one
        add5:
            mov byte[hexed_result+r13],'5'
            jmp after_add_one
        add6:
            mov byte[hexed_result+r13],'6'
            jmp after_add_one
        add7:
            mov byte[hexed_result+r13],'7'
            jmp after_add_one
        add8:
            mov byte[hexed_result+r13],'8'
            jmp after_add_one
        add9:
            mov byte[hexed_result+r13],'9'
            jmp after_add_one
        adda:
            mov byte[hexed_result+r13],'a'
            jmp after_add_one
        addb:
            mov byte[hexed_result+r13],'b'
            jmp after_add_one
        addc:
            mov byte[hexed_result+r13],'c'
            jmp after_add_one
        addd:
            mov byte[hexed_result+r13],'d'
            jmp after_add_one
        adde:
            mov byte[hexed_result+r13],'e'
            jmp after_add_one
        addf:
            mov byte[hexed_result+r13],'f'
            jmp after_add_one
        after_add_one:
            inc r13
            jmp hex_4_to_one
    done_hexing:
    mov byte[hexed_result+r13],0
    pop r13
    pop r10
    pop rdx
    pop r9
    pop r8
    pop rbx
    ret
;find length of [rax] result in rdx
len_to_write:
    mov rdx,-1
    find_len_rax:
        inc rdx
        cmp byte[rax+rdx],0
        jne find_len_rax
    ret
%macro call_len 1
    mov rax,%1
    call len_to_write
%endmacro
_start:
    mov rsi,msg_enter_dir1
    call printString
    mov rsi,directory
    call getString
    mov r15,rsi
    call openFile
    mov rsi,msg_enter_dir2
    call printString
    mov rsi,folder_directory
    call getString
    call_concat new_directory1,folder_directory
    call_concat new_directory1,binary_file
    mov rdi,new_directory1
    call creatFile
    mov [new_file_descriptor1],rax
    call_concat new_directory2,folder_directory
    call_concat new_directory2,hex_file
    mov rdi,new_directory2
    call creatFile
    mov [new_file_descriptor2],rax
    ; now must read char by char until arrive to 0xA then assemble that
read_lines:
    mov r14,-1
    read_a_line:
        inc r14 
        mov rdx,1
        mov rsi,read_buf
        call readFile
        mov al,[read_buf]
        mov [now_line+r14],al
        cmp word[read_buf],0
        je after_read_line
        cmp byte[read_buf],0xa
        je after_read_line
        jmp read_a_line
    after_read_line:
        mov byte[now_line+r14],0
        call calc_a_line
        call apply_prefix66_prefix_67_rex
        mov rax,binary_result
        call binary_to_hex
            ; call_concat binary_result,next_line
        call_len binary_result
        mov rdi,[new_file_descriptor1]
        mov rsi,binary_result
        call writeFile
        call_concat hexed_result,blank
        call_concat hexed_result,now_line
        call_concat hexed_result,next_line
        call_len hexed_result
        mov rdi,[new_file_descriptor2]
        mov rsi,hexed_result
        call writeFile
            ; line is in "nowLine"
            ; binary is in "binary_result"
            ; hex is in "hexed_result"
            ; mov rsi,now_line
            ; call printString
            ; call newLine
            ; mov rsi,hexed_result
            ; call printString
            ; call newLine
            ; mov rsi,binary_result
            ; call printString
            ; call newLine
    cmp word[read_buf],0
    je exit
    jmp read_lines
exit:
    mov rdi,[file_descriptor]
    call closeFile
    mov rdi,[new_file_descriptor1]
    call closeFile
    mov rdi,[new_file_descriptor2]
    call closeFile
    call_concat msg_save,msg_save1
    call_concat msg_save,new_directory1
    mov rsi,msg_save
    call printString
    call newLine
    mov byte[msg_save],0
    call_concat msg_save,msg_save2
    call_concat msg_save,new_directory2
    mov rsi,msg_save
    call printString
    call newLine
    mov rax,60           
    xor rdi,rdi
    syscall
calc_a_line:
    init:
        mov byte [number_of_oprands],0
        mov byte [oprand1_type], ' ' 
        mov byte [oprand2_type],' '
        mov byte [need_rex],'N'
        mov byte [prefix_66],'N'
        mov byte [prefix_67],'N'
        mov byte [rex_w],'0'
        mov byte [R],'0'
        mov byte [X],'0'
        mov byte [B],'0'
        mov byte [cod_w],0
        mov byte [mod],0
        mov byte [reg_op],0
        mov byte [r_m],0
        mov byte [Scales],0
        mov byte [Inx],0
        mov byte [Bas],0
        mov byte [displacment],0
        mov byte [tempstr],0
        mov byte [tempstr2],0
        mov byte [opration],0
        mov byte [oprand1],0
        mov byte [oprand2],0
        mov byte [base],0
        mov byte [scale],0
        mov byte [index],0
        mov byte [disp],0
        mov byte [displacment],0
        mov byte [opration_dict_key],0
        mov byte [opcode],0
        mov byte [binary_result],0
        mov byte [binary_result2],0
        mov byte [imm_data],0
        mov byte [ez_imm_data],0
        mov byte [rev_imm_data],0
        mov byte [maxim_size_imm],0
    mov r8,-1
    mov r9,-1
    mov r10,-1
    mov r11,-1
    find_opration:
        inc r10
        inc r8
        cmp byte [now_line+r10],0
        je after_oprands
        cmp byte [now_line+r10],' '
        je find_oprand1
        mov al,[now_line+r10]
        mov [opration+r10],al
        jmp find_opration
    find_oprand1:
        inc r10
        inc r11
        cmp byte [now_line+r10],0
        je after_oprands
        cmp byte [now_line+r10],','
        je find_oprand2
        mov al,[now_line+r10]
        mov [oprand1+r11],al
        jmp find_oprand1
    find_oprand2:
        inc r10
        inc r9
        cmp byte [now_line+r10],0
        je after_oprands
        mov al,[now_line+r10]
        mov [oprand2+r9],al
        jmp find_oprand2
    after_oprands:
        done_opration_oprands:
            mov rcx,2
            cmp r9,-1
            jne a_c_r9
            mov r9,0
            dec cl
            a_c_r9:
            cmp r11,-1
            jne a_c_r11
            mov r11,0
            dec cl
            a_c_r11:
            mov byte [opration+r8],0
            mov byte [oprand1+r11],0
            mov byte [oprand2+r9],0
            mov [number_of_oprands],cl
            cmp byte [number_of_oprands],2
            je two_oprand
            cmp byte [number_of_oprands],1
            je one_oprand
            jmp no_oprand
        two_oprand:
            ;find oprand type style:
            call_find_type oprand1,oprand1_type
            call_find_type oprand2,oprand2_type
            ;check rex style:
            mov rax,oprand1
            mov rbx,oprand1_type
            call check_rex
            mov rax,oprand2
            mov rbx,oprand2_type
            call check_rex
            mov byte[opration_dict_key],0
            call_concat opration_dict_key,opration
            call_concat opration_dict_key,blank
            call_concat opration_dict_key,oprand2_type
            call_concat opration_dict_key,to_sambol
            call_concat opration_dict_key,oprand1_type
            find_in_dict opration_dict_key,opration_dict,opcode
            call_oprand_size oprand1,oprand1_type
            cmp rcx,64
            je set_rex_w
            mov byte [rex_w],'0'
            mov byte[maxim_size_imm],cl
            jmp check_cod_w
            set_rex_w:
                mov byte [rex_w],'1'
                mov byte[maxim_size_imm],32
            check_cod_w:
                cmp rcx,8
                jne set_cod_w
                mov byte [cod_w],'0'
                jmp use_cod_w_or_not
            set_cod_w:
                mov byte [cod_w],'1'
            use_cod_w_or_not:
                call_in_function opration,no_w_list,0
                cmp rcx,-1
                jne no_cod_w
                jmp after_check_no_cod_w
            no_cod_w:
                mov byte [cod_w],0
            after_check_no_cod_w:
            cmp byte [oprand2_type],'R'
            je second_reg
            cmp byte [oprand2_type],'M'
            je second_mem
            jmp second_imm;first could be reg or imm
            second_reg: ; ? reg
                call_in_function opration,change_oprand_place,0
                cmp rcx,-1      
                je dont_change1
                    find_in_dict oprand1,reg64_code,tempstr
                jmp after_changing_place1
                dont_change1:
                    find_in_dict oprand2,reg64_code,tempstr
                after_changing_place1:
                mov_mem [R],[tempstr]
                mov_mem [reg_op],[tempstr+1]
                mov_mem [reg_op+1],[tempstr+2]
                mov_mem [reg_op+2],[tempstr+3]
                cmp byte [oprand1_type],'R'
                je first_reg_second_reg
                jmp first_mem_second_reg
                first_reg_second_reg:;reg reg ;doneeeeeeeeeeeeeee
                    mov byte[mod],'1'
                    mov byte[mod+1],'1'
                    call_in_function opration,change_oprand_place,0
                    cmp rcx,-1      
                    je dont_change2
                        find_in_dict oprand2,reg64_code,tempstr
                    jmp after_changing_place2
                    dont_change2:
                        find_in_dict oprand1,reg64_code,tempstr
                    after_changing_place2:
                    mov_mem [B],[tempstr]
                    mov_mem [r_m],[tempstr+1]
                    mov_mem [r_m+1],[tempstr+2]
                    mov_mem [r_m+2],[tempstr+3]
                    call_in_function opration,xchg_sambol,0
                    cmp rcx,-1
                    je after_xchg_ax
                    check_xchg_ax:
                        call_in_function ax_sambol,oprand1,0
                        cmp rcx,-1
                        je after_xchg_ax
                        mov byte [opration_dict_key],0
                        call_concat opration_dict_key,opration
                        call_concat opration_dict_key,blank
                        call_concat opration_dict_key,oprand2_type
                        call_concat opration_dict_key,to_sambol
                        call_concat opration_dict_key,xax_sambol
                        find_in_dict opration_dict_key,opration_dict,opcode
                        mov byte [mod],0
                        mov byte [cod_w],0
                        mov byte [r_m],0
                    after_xchg_ax:
                    call_concat binary_result,opcode
                    call_concat binary_result,cod_w
                    call_concat binary_result,mod
                    call_concat binary_result,reg_op
                    call_concat binary_result,r_m
                    ;now go to add prefix66 prefix67 rex
                    ret
                first_mem_second_reg:;mem reg
                    call_calc_memory oprand1
                    call_concat binary_result,opcode
                    call_concat binary_result,cod_w
                    call_concat binary_result,mod
                    call_concat binary_result,reg_op
                    call_concat binary_result,r_m
                    call_concat binary_result,Scales
                    call_concat binary_result,Inx
                    call_concat binary_result,Bas
                    call_concat binary_result,displacment
                    ;now go to add prefix66 prefix67 rex
                    ret
            second_mem:;reg mem
                find_in_dict oprand1,reg64_code,tempstr
                mov_mem [R],[tempstr]
                mov_mem [reg_op],[tempstr+1]
                mov_mem [reg_op+1],[tempstr+2]
                mov_mem [reg_op+2],[tempstr+3]
                call_calc_memory oprand2
                call_concat binary_result,opcode
                call_concat binary_result,cod_w
                call_concat binary_result,mod
                call_concat binary_result,reg_op
                call_concat binary_result,r_m
                call_concat binary_result,Scales
                call_concat binary_result,Inx
                call_concat binary_result,Bas
                call_concat binary_result,displacment
                ;now go to add prefix66 prefix67 rex
                ret
            second_imm:;? imm
                cmp byte[oprand1_type],'R'
                je first_reg_second_imm
                jmp first_mem_second_imm
            first_reg_second_imm:;reg imm
                call_in_function opration,shift_list,0
                cmp rcx,-1
                je after_shifts
                cmp byte[oprand2],'1'
                jne check_hex
                cmp byte[oprand2+1],0
                je one_oprand
                jne after_shifts
                check_hex:
                    mov rax,oprand2
                    call find_num_imm
                    cmp rbx,1
                    je one_oprand
                    jne after_shifts
                after_shifts:
                call_in_function mov_sambol,opration,0
                cmp rcx,-1
                je after_mov_imm
                mov_imm:
                    call_oprand_size oprand1,oprand1_type
                    cmp rcx,64
                    je mov_reg_with_64_1
                    jmp mov_reg_no_64_1
                    mov_reg_with_64_1:
                        call_concat opration_dict_key,opration
                        call_concat opration_dict_key,blank
                        call_concat opration_dict_key,oprand2_type
                        call_concat opration_dict_key,to_sambol
                        call_concat opration_dict_key,oprand1_type
                        call_concat opration_dict_key,with_64_sambol
                        find_in_dict opration_dict_key,opration_dict,opcode
                        jmp after_mov_imm
                    mov_reg_no_64_1:
                        call_concat opration_dict_key,opration
                        call_concat opration_dict_key,blank
                        call_concat opration_dict_key,oprand2_type
                        call_concat opration_dict_key,to_sambol
                        call_concat opration_dict_key,oprand1_type
                        call_concat opration_dict_key,no_64_sambol
                        find_in_dict opration_dict_key,opration_dict,opcode
                        jmp after_mov_imm
                after_mov_imm:
                mov byte[mod],'1'
                mov byte[mod+1],'1'
                find_in_dict oprand1,reg64_code,tempstr
                mov_mem [B],[tempstr]
                mov_mem [r_m],[tempstr+1]
                mov_mem [r_m+1],[tempstr+2]
                mov_mem [r_m+2],[tempstr+3]
                find_in_dict opration,opcode_reg_op_dict,tempstr
                mov_mem [reg_op],[tempstr]
                mov_mem [reg_op+1],[tempstr+1]
                mov_mem [reg_op+2],[tempstr+2]
                call_in_function s_sambol,opcode,0
                cmp rcx,-1
                je reg_after_s
                reg_with_s:
                    mov rax,oprand2
                    call disp_size
                    cmp rcx,32
                    je reg_put_zero
                    reg_jmp_else:
                        call_oprand_size oprand1,oprand1_type
                        cmp rcx,8
                        ja reg_put_one
                        jmp reg_put_zero
                    reg_put_zero:
                        call_in_function s_sambol,opcode,0
                        mov byte[opcode+rcx],'0'
                        jmp reg_after_s
                    reg_put_one:
                        call_in_function s_sambol,opcode,0
                        mov byte[opcode+rcx],'1'
                reg_after_s:
                call_in_function test_sambol,opration,0
                cmp rcx,-1
                je after_test
                with_test:
                    call_in_function ax_sambol,oprand1,0
                    cmp rcx,-1
                    jne with_test_with_ax
                    call_in_function al_sambol,oprand1,0
                    cmp rcx,-1
                    jne with_test_with_ax
                    jmp after_test
                    with_test_with_ax:
                        mov byte [opration_dict_key],0
                        call_concat opration_dict_key,opration
                        call_concat opration_dict_key,blank
                        call_concat opration_dict_key,oprand2_type
                        call_concat opration_dict_key,to_sambol
                        call_concat opration_dict_key,xax_sambol
                        find_in_dict opration_dict_key,opration_dict,opcode
                after_test:
                call_in_function mov_sambol,opration,0
                cmp rcx,-1
                je no_mov
                with_mov:
                    call_oprand_size oprand1,oprand1_type
                    cmp rcx,64
                    je mov_reg_with_64_2
                    jmp mov_reg_no_64
                    mov_reg_with_64_2:
                        call_concat binary_result,opcode
                        call_concat binary_result,cod_w
                        call_concat binary_result,mod
                        call_concat binary_result,reg_op
                        call_concat binary_result,r_m
                        mov rax,oprand2
                        xor rbx,rbx
                        mov bl,[maxim_size_imm]
                        call immediate_to_binary
                        call_concat binary_result,rev_imm_data
                        ;now go to add prefix66 prefix67 rex
                        ret
                    mov_reg_no_64:
                        call_concat binary_result,opcode
                        call_concat binary_result,cod_w
                        call_concat binary_result,r_m
                        mov rax,oprand2
                        xor rbx,rbx
                        mov bl,[maxim_size_imm]
                        call immediate_to_binary
                        call_concat binary_result,rev_imm_data
                        ;now go to add prefix66 prefix67 rex
                        ret
                no_mov:
                call_in_function opration,shift_list,0
                cmp rcx,-1
                je no_shift
                with_shift:
                    call_concat binary_result,opcode
                    call_concat binary_result,cod_w
                    call_concat binary_result,mod
                    call_concat binary_result,reg_op
                    call_concat binary_result,r_m
                    mov rax,oprand2
                    mov rbx,8
                    call_concat binary_result,rev_imm_data
                        ;now go to add prefix66 prefix67 rex
                    ret
                no_shift:
                call_in_function opration,ax_reg_opration_list,0
                cmp rcx,-1
                je normal_imm
                ax_reg_op_imm:
                    call_in_function ax_sambol,oprand1,0
                    cmp rcx,-1
                    jne with_ax_reg_imm
                    call_in_function al_sambol,oprand1,0
                    cmp rcx,-1
                    jne with_ax_reg_imm
                    jmp normal_imm
                    with_ax_reg_imm:
                        mov rax,oprand2
                        call disp_size
                        cmp rcx,32
                        je unormal_imm
                        jmp normal_imm
                    unormal_imm:
                        mov byte [opration_dict_key],0
                        call_concat opration_dict_key,opration
                        call_concat opration_dict_key,blank
                        call_concat opration_dict_key,oprand2_type
                        call_concat opration_dict_key,to_sambol
                        call_concat opration_dict_key,xax_sambol
                        find_in_dict opration_dict_key,opration_dict,opcode
                        call_concat binary_result,opcode
                        call_concat binary_result,cod_w
                        mov rax,oprand2
                        call disp_size
                        cmp rcx,32
                        je with_max1
                        jmp with_8_bit1
                        with_8_bit1:
                            mov rbx,8
                            jmp ater_rbx1
                        with_max1:
                            xor rbx,rbx
                            mov bl,[maxim_size_imm]
                        ater_rbx1:
                        call immediate_to_binary
                        call_concat binary_result,rev_imm_data
                        ;now go to add prefix66 prefix67 rex
                        ret
                    normal_imm:
                        call_concat binary_result,opcode
                        call_concat binary_result,cod_w
                        call_concat binary_result,mod
                        call_concat binary_result,reg_op
                        call_concat binary_result,r_m
                        mov rax,oprand2
                        call disp_size
                        cmp rcx,32
                        je with_max2
                        jmp with_8_bit2
                        with_8_bit2:
                            mov rbx,8
                            jmp ater_rbx2
                        with_max2:
                            xor rbx,rbx
                            mov bl,[maxim_size_imm]
                        ater_rbx2:
                        call immediate_to_binary
                        call_concat binary_result,rev_imm_data
                        ;now go to add prefix66 prefix67 rex
                        ret
            first_mem_second_imm:;mem imm
                call_calc_memory oprand1
                find_in_dict opration,opcode_reg_op_dict,tempstr
                mov_mem [reg_op],[tempstr]
                mov_mem [reg_op+1],[tempstr+1]
                mov_mem [reg_op+2],[tempstr+2]
                call_in_function s_sambol,opcode,0
                cmp rcx,-1
                je mem_after_s
                mem_with_s:
                    mov rax,oprand2
                    call disp_size
                    cmp rcx,32
                    je mem_put_zero
                    mem_jmp_else:
                        call_oprand_size oprand1,oprand1_type
                        cmp rcx,8
                        ja mem_put_one
                        jmp mem_put_zero
                    mem_put_zero:
                        call_in_function s_sambol,opcode,0
                        mov byte[opcode+rcx],'0'
                        jmp mem_after_s
                    mem_put_one:
                        call_in_function s_sambol,opcode,0
                        mov byte[opcode+rcx],'1'
                mem_after_s:

                call_in_function mov_sambol,opration,0
                cmp rcx,-1
                je mem_no_mov
                mem_with_mov:
                    call_concat binary_result,opcode
                    call_concat binary_result,cod_w
                    call_concat binary_result,mod
                    call_concat binary_result,reg_op
                    call_concat binary_result,r_m
                    call_concat binary_result,Scales
                    call_concat binary_result,Inx
                    call_concat binary_result,Bas
                    call_concat binary_result,displacment
                    mov rax,oprand2
                    xor rbx,rbx
                    mov bl,[maxim_size_imm]
                    call immediate_to_binary
                    call_concat binary_result,rev_imm_data
                    ;now go to add prefix66 prefix67 rex
                    ret
                mem_no_mov:
                call_in_function opration,shift_list,0
                cmp rcx,-1
                je mem_normal_imm
                mem_with_shift:
                    call_concat binary_result,opcode
                    call_concat binary_result,cod_w
                    call_concat binary_result,mod
                    call_concat binary_result,reg_op
                    call_concat binary_result,r_m
                    call_concat binary_result,Scales
                    call_concat binary_result,Inx
                    call_concat binary_result,Bas
                    call_concat binary_result,displacment
                    mov rax,oprand2
                    mov rbx,8
                    call_concat binary_result,rev_imm_data
                    ;now go to add prefix66 prefix67 rex
                    ret
                mem_normal_imm:
                        call_concat binary_result,opcode
                        call_concat binary_result,cod_w
                        call_concat binary_result,mod
                        call_concat binary_result,reg_op
                        call_concat binary_result,r_m
                        call_concat binary_result,Scales
                        call_concat binary_result,Inx
                        call_concat binary_result,Bas
                        call_concat binary_result,displacment
                        mov rax,oprand2
                        call disp_size
                        cmp rcx,32
                        je mem_with_max2
                        jmp mem_with_8_bit2
                        mem_with_8_bit2:
                            mov rbx,8
                            jmp ater_rbx2
                        mem_with_max2:
                            xor rbx,rbx
                            mov bl,[maxim_size_imm]
                        mem_ater_rbx2:
                        call immediate_to_binary
                        call_concat binary_result,rev_imm_data
                        ;now go to add prefix66 prefix67 rex
                        ret
        one_oprand:
            call_find_type oprand1,oprand1_type
            mov byte[need_rex],'N'
            ;check rex style:
            mov rax,oprand1
            mov rbx,oprand1_type
            call check_rex
            mov byte[opration_dict_key],0
            call_concat opration_dict_key,opration
            call_concat opration_dict_key,blank
            call_concat opration_dict_key,oprand1_type
            find_in_dict opration_dict_key,opration_dict,opcode
            call_oprand_size oprand1,oprand1_type
            cmp rcx,64
            jne after_one_set_rex_w
            mov byte[rex_w],'1'
            after_one_set_rex_w:
            cmp rcx,8
            jne one_set_cod_w
            je one_clear_cod_w
                one_set_cod_w:
                    mov byte[cod_w],'1'
                    jmp after_one_code_w
                one_clear_cod_w:
                    mov byte[cod_w],'0'
                    jmp after_one_code_w
            after_one_code_w:
            call_in_function imul_sambol,opration,0
            cmp rcx,-1
            jne check_rem_cod_w
            jmp after_two_cod_w
            check_rem_cod_w:
                call_in_function opration,no_w_list,0
                cmp rcx,-1
                jne remove_cod_w
                jmp after_two_cod_w
                remove_cod_w:
                    mov byte[cod_w],0
            after_two_cod_w:
            find_in_dict opration,opcode_reg_op_dict,tempstr
            mov_mem [reg_op],[tempstr]
            mov_mem [reg_op+1],[tempstr+1]
            mov_mem [reg_op+2],[tempstr+2]
            cmp byte[oprand1_type],'R'
            je one_reg
            cmp byte[oprand1_type],'M'
            je one_mem
            jmp one_imm
            one_reg:
                find_in_dict oprand1,reg64_code,tempstr
                mov_mem [B],[tempstr]
                mov_mem [r_m],[tempstr+1]
                mov_mem [r_m+1],[tempstr+2]
                mov_mem [r_m+2],[tempstr+3]

                mov byte[mod],'1'
                mov byte[mod+1],'1'
                call_in_function opration,jmp_call,0
                cmp rcx,-1
                je after_jmp_call
                with_jmp_call:
                    mov byte[rex_w],'0'
                    mov rax,oprand1
                    call check_new_register
                    mov_mem [need_rex],[tempch]
                after_jmp_call:
                call_in_function opration,push_pop,0
                cmp rcx,-1
                je no_push_pop
                with_push_pop:
                    mov rax,oprand1
                    call check_new_register
                    mov_mem [need_rex],[tempch]
                    call_concat binary_result,opcode
                    call_concat binary_result,r_m
                    ;now go to add prefix66 prefix67 rex
                    ret
                no_push_pop:
                    call_concat binary_result,opcode
                    call_concat binary_result,cod_w
                    call_concat binary_result,mod
                    call_concat binary_result,reg_op
                    call_concat binary_result,r_m
                    ;now go to add prefix66 prefix67 rex
                    ret
            one_mem:
                call_calc_memory oprand1
                call_in_function opration,jmp_call,0
                cmp rcx,-1
                je mem_after_jmp_call
                mem_jmp_call:
                    mov byte[rex_w],'0'
                    mov rax,oprand1
                    call check_new_register
                    mov_mem [need_rex],[tempch]
                    call_oprand_size oprand1,oprand1_type
                    cmp rcx,32
                    jne mem_after_jmp_call
                    mov byte[prefix_66],'T'
                    call_in_function jmp_sambol,opration,0
                    cmp rcx,-1
                    jne reg_op_jmp
                    jmp reg_op_call 
                    reg_op_jmp:
                        mov byte[reg_op],'1'
                        mov byte[reg_op+1],'0'
                        mov byte[reg_op+2],'1'
                        jmp mem_after_jmp_call
                    reg_op_call:
                        mov byte[reg_op],'0'
                        mov byte[reg_op+1],'1'
                        mov byte[reg_op+2],'1'
                        jmp mem_after_jmp_call
                mem_after_jmp_call:
                call_in_function opration,push_pop,0
                cmp rcx,-1
                je mem_after_push_pop
                mem_push_pop:
                    mov rax,oprand1
                    call check_new_register
                    mov_mem [need_rex],[tempch]
                mem_after_push_pop:
                    call_concat binary_result,opcode
                    call_concat binary_result,cod_w
                    call_concat binary_result,mod
                    call_concat binary_result,reg_op
                    call_concat binary_result,r_m
                    call_concat binary_result,Scales
                    call_concat binary_result,Inx
                    call_concat binary_result,Bas
                    call_concat binary_result,displacment
                    ;now go to add prefix66 prefix67 rex
                    ret
            one_imm:
                ;push jmp call
                call_in_function push_sambol,opration,0
                cmp rcx,-1
                jne its_push
                jmp its_jmp_or_call
                its_push:
                    mov rax,oprand1
                    call disp_size
                    cmp rcx,32
                    je clear_s_push
                    jne set_s_push_with_8bit_data
                    clear_s_push:
                        mov byte[opcode+7],'0'
                        mov rax,oprand1
                        mov rbx,32
                        call immediate_to_binary
                        call_concat binary_result,opcode
                        call_concat binary_result,rev_imm_data
                        ;now go to add prefix66 prefix67 rex
                        ret
                    set_s_push_with_8bit_data:
                        mov byte[opcode+7],'1'
                        mov rax,oprand1
                        mov rbx,8
                        call immediate_to_binary
                        call_concat binary_result,opcode
                        call_concat binary_result,rev_imm_data
                        ;now go to add prefix66 prefix67 rex
                        ret
                its_jmp_or_call:
                    mov rax,oprand2;oprand2 is empty so we have 32 number of 0 in rev_imm_data
                    mov rbx,32
                    call immediate_to_binary
                    call_concat binary_result,opcode
                    call_concat binary_result,rev_imm_data
                    ;now go to add prefix66 prefix67 rex
                    ret
        no_oprand:
            call_concat opration_dict_key,opration
            find_in_dict opration_dict_key,opration_dict,binary_result
            ;now go to add prefix66 prefix67 rex
            ret

apply_prefix66_prefix_67_rex:
    cmp byte[need_rex],'Y'
    jne after_rex
    add_rex:
        mov byte [binary_result2],0
        call_concat binary_result2,rex_code
        call_concat binary_result2,rex_w
        call_concat binary_result2,R
        call_concat binary_result2,X
        call_concat binary_result2,B
        call_concat binary_result2,binary_result
        mov byte [binary_result],0
        call_concat binary_result,binary_result2
    after_rex:

    cmp byte[prefix_66],'Y'
    je add_prefix_66
    check_66:
        cmp byte[number_of_oprands],0
        je after_prefix_66
        call_oprand_size oprand1,oprand1_type
        cmp rcx,16
        jne after_prefix_66

    add_prefix_66:
        mov byte [binary_result2],0
        call_concat binary_result2,prefix_66_code
        call_concat binary_result2,binary_result
        mov byte [binary_result],0
        call_concat binary_result,binary_result2
    after_prefix_66:
    cmp byte[prefix_67],'Y'
    je add_prefix_67
    jmp after_prefix_67
    add_prefix_67:
         mov byte [binary_result2],0
        call_concat binary_result2,prefix_67_code
        call_concat binary_result2,binary_result
        mov byte [binary_result],0
        call_concat binary_result,binary_result2
    after_prefix_67:
    ret
;finished