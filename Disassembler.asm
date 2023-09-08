%include "in_out.asm"
section .data
    msg_enter_dir1 db "Enter directory to open file:",0xA,0
    msg_enter_dir2 db "Enter directory to create result:",0xA,0
    file_descriptor dq 0
    new_file_descriptor1 dq 0
    msg_save1 db "Assembly file saved to :",0xA,0
    asm_file db 'machin_code.txt',0
    next_line db 0xa,0
    number_of_oprand db 0
    dict_sambol db ':',0
    end_sambol db ',',0
    splitter_sambol db '-',0
    z db '0',0
    ozo db '101',0
    zz db '00',0
    ozz db '100',0
    oo db '11',0
    zzzz db '0000',0
    z_hex_sambol db '0x0',0
    hex_sambol db '0x',0
    memory_sambol db '[',0
    end_memory_sambol db ']',0
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
    to_sambol db 'to',0
    xadd_sambol db 'xadd',0
    test_sambol db 'test',0
    push_sambol db 'push',0
    plus_sambol db '+',0
    mul_sambol db '*',0
    byte_sambol db 'BYTE PTR',0
    word_sambol db 'WORD PTR',0
    dword_sambol db 'DWORD PTR',0
    qword_sambol db 'QWORD PTR',0
    blank db ' ',0
    act_reg_to_reg_reg_to_mem db "[reg to reg & reg to mem]",0
    act_reg_to_reg_mem_to_reg db "[reg to reg & mem to reg]",0
    act_mem_to_reg db "[mem to reg]",0
    act_imm_to_Xax db "[imm to Xax]",0
    act_reg db "[reg]",0
    act_mem db "[mem]",0
    act_imm db "[imm]",0
    act_imm_to_reg_imm_to_mem db "[imm to reg & imm to mem]",0
    act_reg_to_reg_mem_to_reg_reg_to_mem db "[reg to reg & mem to reg & reg to mem]",0
    act_reg_to_Xax db "[reg to Xax]",0
    act_imm_to_reg_no_64 db "[imm to reg!64]",0
    act_imm_to_reg64_imm_to_mem db "[imm to reg64 & imm to mem]",0
    act_reg_mem db "[reg & mem]",0
    prefix_66_code db '01100110',0
    prefix_67_code db '01100111',0
    push_imm_code db ',011010,',0 ; if we have it next bit is S and next bit is zero
    have_s_opcode db ',100000,',0 ; if we have it next bit is S
    prefix_66 db ' ',0
    prefix_67 db ' ',0
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
    reg64_code db "0000:1al,2ax,3eax,4rax,0001:1cl,2cx,3ecx,4rcx,0010:1dl,2dx,3edx,4rdx,0011:1bl,2bx,3ebx,4rbx,0100:1ah,2sp,3esp,4rsp,0101:1ch,2bp,3ebp,4rbp,0110:1dh,2si,3esi,4rsi,0111:1bh,2di,3edi,4rdi,1000:1r8b,2r8w,3r8d,4r8,1001:1r9b,2r9w,3r9d,4r9,1010:1r10b,2r10w,3r10d,4r10,1011:1r11b,2r11w,3r11d,4r11,1100:1r12b,2r12w,3r12d,4r12,1101:1r13b,2r13w,3r13d,4r13,1110:1r14b,2r14w,3r14d,4r14,1111:1r15b,2r15w,3r15d,4r15,",0

    operation_dict db " ,0000000,:add-[reg to reg & reg to mem], ,0000001,:add-[mem to reg], ,0000010,:add-[imm to Xax], ,0000100,:or-[reg to reg & reg to mem], ,0000101,:or-[mem to reg], ,0000110,:or-[imm to Xax], ,0000111110101111,:imul-[reg to reg & mem to reg], ,0000111110111100,:bsf-[reg to reg & mem to reg], ,0000111110111101,:bsr-[reg to reg & mem to reg], ,000011111100000,:xadd-[reg to reg & mem to reg], ,0001000,:adc-[reg to reg & reg to mem], ,0001001,:adc-[mem to reg], ,0001010,:adc-[imm to Xax], ,0001100,:sbb-[reg to reg & reg to mem], ,0001101,:sbb-[mem to reg], ,0001110,:sbb-[imm to Xax], ,0010000,:and-[reg to reg & reg to mem], ,0010001,:and-[mem to reg], ,0010010,:and-[imm to Xax], ,0010100,:sub-[reg to reg & reg to mem], ,0010101,:sub-[mem to reg], ,0010110,:sub-[imm to Xax], ,0011000,:xor-[reg to reg & reg to mem], ,0011001,:xor-[mem to reg], ,0011010,:xor-[imm to Xax], ,0011100,:cmp-[reg to reg & reg to mem], ,0011101,:cmp-[mem to reg], ,0011110,:cmp-[imm to Xax], ,01010,:push-[reg], ,01011,:pop-[reg], ,011010,:push-[imm], ,1000010,:test-[reg to reg & mem to reg & reg to mem], ,1000011,:xchg-[reg to reg & mem to reg & reg to mem], ,1000100,:mov-[reg to reg & reg to mem], ,1000101,:mov-[mem to reg], ,10001111,:pop-[mem], ,10010,:xchg-[reg to Xax], ,1010100,:test-[imm to Xax], ,1011,:mov-[imm to reg!64], ,1100011,:mov-[imm to reg64 & imm to mem], ,11101000,:call-[imm], ,11101001,:jmp-[imm], ,11111000,:clc, ,11111100,:cld, ,11000011,:ret, ,11111001,:stc, ,11111101,:std, ,0000111100000101,:syscall,",0


    execption_list db ",100000,1100000,1101000,1111011,1111111,11111111,",0
    excp1 db ',100000,',0
    reg_op_1 db "010:adc,000:add,100:and,111:cmp,001:or,011:sbb,101:sub,110:xor,",0

    excp2 db ',1100000,',0
    reg_op_2 db "100:shl,101:shr,",0
    excp3 db ',1101000,',0
    reg_op_3 db "111:idiv,101:imul,011:neg,010:not,000:test,",0
    excp4 db ',1111011,',0
    reg_op_5 db "001:dec,000:inc,010:call,100:jmp,110:push,",0
    excp5 db ',1111111,',0
    excp6 db ',11111111,',0

    no_w_list db ",0000111110101111,0000111110111100,0000111110111101,01010,01011,011010,10001111,10010,11101000,11101001,11111111,11111000,11111100,11000011,11111001,11111101,0000111100000101,",0

    no_mod_list db ",1011,0000010,0001010,0010110,0001110,0010010,0000110,0011010,0011110,1010100,10010,01010,011010,01011,11101001,11101000,11111001,11111000,11111101,11111100,0000111100000101,11000011,",0

    scale_dict db "00:1,01:2,10:4,11:8,",0
    j_c_p_p db "jmp,call,pop,push,",0
    dec_inc db "dec,inc,",0
section .bss
    directory resb 100
    folder_directory resb 100
    new_directory1 resb 100
    read_buf resb 2
    now_line resb 100
    msg_save resb 1000
    tempstr resb 100
    tempstr2 resb 100
    opcode resb 20
    opration_with_act resb 100
    opration resb 20
    act resb 80
    oprand1 resb 100
    oprand2 resb 100
    rev_bin_data resb 100
    hex_data resb 100
    reg_cod resb 10
    temp_mem resb 100
    base resb 10
    index resb 10
    scale resb 2
    result resb 100
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
%macro printfull 1
    mov rsi,%1
    call printString
    call newLine
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
    push r8
    call_in_function %1,%2,0
    call_in_function dict_sambol,%2,rcx
    mov r8,rcx
    inc r8
    call_in_function end_sambol,%2,rcx
    call_substr %2,r8,rcx,%3
    pop r8
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
;code have rex or not
check_rex:
    mov byte[rex_w],'0'
    mov byte[R],'0'
    mov byte[X],'0'
    mov byte[B],'0'
    call_in_function rex_code,now_line,0
    cmp rcx,0
    je have_rex
    jmp after_rex
    have_rex:
        mov_mem [rex_w],[now_line+4]
        mov_mem [R],[now_line+5]
        mov_mem [X],[now_line+6]
        mov_mem [B],[now_line+7]
        mov byte[tempstr],0
        mov r8,now_line
        add r8,8
        call_concat tempstr,r8
        mov byte[now_line],0
        call_concat now_line,tempstr
    after_rex:
        ret
;code have prefix 66 or not
check_66:
    mov byte[prefix_66],'N'
    call_in_function prefix_66_code,now_line,0
    cmp rcx,0
    je have_prefix_66
    jmp after_prefix_66
    have_prefix_66:
        mov byte[prefix_66],'Y'
        mov byte[tempstr],0
        mov r8,now_line
        add r8,8
        call_concat tempstr,r8
        mov byte[now_line],0
        call_concat now_line,tempstr
    after_prefix_66:
        ret
;code have prefix 67 or not
check_67:
    mov byte[prefix_67],'N'
    call_in_function prefix_67_code,now_line,0
    cmp rcx,0
    je have_prefix_67
    jmp after_prefix_67
    have_prefix_67:
        mov byte[prefix_67],'Y'
        mov byte[tempstr],0
        mov r8,now_line
        add r8,8
        call_concat tempstr,r8
        mov byte[now_line],0
        call_concat now_line,tempstr
    after_prefix_67:
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
;transform immediate in [rax] to binary and put result in hex_data
immediate_to_hex:
    mov byte[hex_data],0
    mov byte[rev_bin_data],0
    cmp byte[rax],0
    je return_zero
    jmp reverse_it
    return_zero:
        call_concat hex_data,z_hex_sambol
        ret
    reverse_it:
    mov byte[rev_bin_data],0
    mov r8,-8
    loop_rev:
        add r8,8
        cmp byte[rax+r8],0
        jbe hex_it
        mov r9,r8
        add r9,8
        call_substr rax,r8,r9,tempstr
        call_concat tempstr,rev_bin_data
        mov byte[rev_bin_data],0
        call_concat rev_bin_data,tempstr
        jmp loop_rev
    hex_it:
    mov r9,-4
    mov r13,0
    hex_4_to_one:
        add r9,4
        cmp byte[rev_bin_data+r9],0
        je done_hexing
        mov r10,r9
        add r10,4
        call_substr rev_bin_data,r9,r10,tempstr
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
            mov byte[hex_data+r13],'0'
            jmp after_add_one
        add1:
            mov byte[hex_data+r13],'1'
            jmp after_add_one
        add2:
            mov byte[hex_data+r13],'2'
            jmp after_add_one
        add3:
            mov byte[hex_data+r13],'3'
            jmp after_add_one
        add4:
            mov byte[hex_data+r13],'4'
            jmp after_add_one
        add5:
            mov byte[hex_data+r13],'5'
            jmp after_add_one
        add6:
            mov byte[hex_data+r13],'6'
            jmp after_add_one
        add7:
            mov byte[hex_data+r13],'7'
            jmp after_add_one
        add8:
            mov byte[hex_data+r13],'8'
            jmp after_add_one
        add9:
            mov byte[hex_data+r13],'9'
            jmp after_add_one
        adda:
            mov byte[hex_data+r13],'a'
            jmp after_add_one
        addb:
            mov byte[hex_data+r13],'b'
            jmp after_add_one
        addc:
            mov byte[hex_data+r13],'c'
            jmp after_add_one
        addd:
            mov byte[hex_data+r13],'d'
            jmp after_add_one
        adde:
            mov byte[hex_data+r13],'e'
            jmp after_add_one
        addf:
            mov byte[hex_data+r13],'f'
            jmp after_add_one
        after_add_one:
            inc r13
            jmp hex_4_to_one
    done_hexing:
        mov byte[hex_data+r13],0
        mov byte[rev_bin_data],0
        call_concat rev_bin_data,hex_sambol
        call_concat rev_bin_data,hex_data
        mov byte[hex_data],0
        call_concat hex_data,rev_bin_data
        ret


;[rax] is codo of register find register and put in [rbx]
find_register:
    push r14
    push r15
    mov r14,rax
    mov r15,rbx
    call_in_function r14,reg64_code,rcx
    add rcx,4
    cmp byte[prefix_66],'Y'
    je two
    cmp byte[rex_w],'1'
    je four
    cmp byte[cod_w],'1'
    je three
    jmp one
    one:
        mov byte[tempch],'1'
        jmp after_index
    two:
        mov byte[tempch],'2'
        jmp after_index
    three:
        mov byte[tempch],'3'
        jmp after_index
    four:
        mov byte[tempch],'4'
        jmp after_index
    after_index:
    call_in_function tempch,reg64_code,rcx
    mov r8,rcx
    inc r8
    call_in_function end_sambol,reg64_code,rcx
    call_substr reg64_code,r8,rcx,r15
    pop r15
    pop r14
    ret
%macro indexing 2
    ;%1 is register_code
    ;register with %1 register_code go to %2
    push rax
    push rbx
    mov rax,%1
    mov rbx,%2
    call find_register
    pop rbx
    pop rax
%endmacro
;calculate memeory oprand and put it in rax
calc_memory:
    push r14
    mov r14,rax
    call_in_function ozz,r_m,0
    cmp rcx,-1
    jne with_sib
    jmp no_sib
    with_sib:
        call_substr now_line,0,2,Scales
        call_substr now_line,2,5,Inx
        call_substr now_line,5,8,Bas
        call_substr now_line,8,100,tempstr
        call_substr tempstr,0,100,now_line
        call_in_function ozo,Bas,0
        cmp rcx,-1
        je bas_no_bp
        call_in_function zz,mod,0
        cmp rcx,-1
        je bas_with_bp_with_scale 
        call_in_function ozz,Inx,0
        cmp rcx,-1
        je no_base_with_scale
        jmp no_base_no_index 
        no_base_no_index: ;halat 6 direct addressing
            mov rax,now_line
            call immediate_to_hex
            call_concat temp_mem,memory_sambol
            call_concat temp_mem,hex_data
            call_concat temp_mem,end_memory_sambol
            jmp final_calc
        no_base_with_scale: ;halat 2 index*scale + disp
            mov byte[tempstr2],0
            call_concat tempstr2,X
            call_concat tempstr2,Inx
            cmp byte[prefix_67],'Y'
            je reg_32_1
            jmp reg_64_1
            reg_32_1:
                push word [prefix_66]
                mov byte [prefix_66],'N'
                push word[rex_w]
                mov byte[rex_w],'0'
                push word[cod_w]
                mov byte [cod_w],'1'
                indexing tempstr2,index
                pop word [cod_w]
                pop word [rex_w]
                pop word [prefix_66]
                jmp after_reg_1
            reg_64_1:
                push word [prefix_66]
                mov byte [prefix_66],'N'
                push word[rex_w]
                mov byte[rex_w],'1'
                indexing tempstr2,index
                pop word [rex_w]
                pop word [prefix_66]
            after_reg_1:
            find_in_dict Scales,scale_dict,scale
            mov rax,now_line
            call immediate_to_hex
            call_concat temp_mem,memory_sambol
            call_concat temp_mem,index
            call_concat temp_mem,mul_sambol
            call_concat temp_mem,scale
            call_concat temp_mem,plus_sambol
            call_concat temp_mem,hex_data
            call_concat temp_mem,end_memory_sambol
            jmp final_calc
        bas_with_bp_with_scale: ;halat 3 bp + index * scale + disp
            mov byte[tempstr2],0
            call_concat tempstr2,B
            call_concat tempstr2,Bas
            cmp byte[prefix_67],'Y'
            je reg_32_2
            jmp reg_64_2
            reg_32_2:
                push word [prefix_66]
                mov byte [prefix_66],'N'
                push word[rex_w]
                mov byte[rex_w],'0'
                push word[cod_w]
                mov byte [cod_w],'1'
                indexing tempstr2,base
                mov byte[tempstr2],0
                call_concat tempstr2,X
                call_concat tempstr2,Inx
                indexing tempstr2,index
                pop word [cod_w]
                pop word [rex_w]
                pop word [prefix_66]
                jmp after_reg_2
            reg_64_2:
                push word [prefix_66]
                mov byte [prefix_66],'N'
                push word[rex_w]
                mov byte[rex_w],'1'
                indexing tempstr2,base
                mov byte[tempstr2],0
                call_concat tempstr2,X
                call_concat tempstr2,Inx
                indexing tempstr2,index
                pop word [rex_w]
                pop word [prefix_66]
            after_reg_2:
            find_in_dict Scales,scale_dict,scale
            mov rax,now_line
            call immediate_to_hex
            call_concat temp_mem,memory_sambol
            call_concat temp_mem,base
            call_concat temp_mem,plus_sambol
            call_concat temp_mem,index
            call_concat temp_mem,mul_sambol
            call_concat temp_mem,scale
            call_concat temp_mem,plus_sambol
            call_concat temp_mem,hex_data
            call_concat temp_mem,end_memory_sambol
            jmp final_calc
        bas_no_bp: ;halat 5 base + index * scale + disp
            mov byte[tempstr2],0
            call_concat tempstr2,B
            call_concat tempstr2,Bas
            cmp byte[prefix_67],'Y'
            je reg_32_3
            jmp reg_64_3
            reg_32_3:
                push word [prefix_66]
                mov byte [prefix_66],'N'
                push word[rex_w]
                mov byte[rex_w],'0'
                push word[cod_w]
                mov byte [cod_w],'1'
                indexing tempstr2,base
                mov byte[tempstr2],0
                call_concat tempstr2,X
                call_concat tempstr2,Inx
                indexing tempstr2,index
                pop word [cod_w]
                pop word [rex_w]
                pop word [prefix_66]
                jmp after_reg_3
            reg_64_3:
                push word [prefix_66]
                mov byte [prefix_66],'N'
                push word[rex_w]
                mov byte[rex_w],'1'
                indexing tempstr2,base
                mov byte[tempstr2],0
                call_concat tempstr2,X
                call_concat tempstr2,Inx
                indexing tempstr2,index
                pop word [rex_w]
                pop word [prefix_66]
            after_reg_3:
            find_in_dict Scales,scale_dict,scale
            mov rax,now_line
            call immediate_to_hex
            call_concat temp_mem,memory_sambol
            call_concat temp_mem,base
            call_concat temp_mem,plus_sambol
            call_concat temp_mem,index
            call_concat temp_mem,mul_sambol
            call_concat temp_mem,scale
            call_concat temp_mem,plus_sambol
            call_concat temp_mem,hex_data
            call_concat temp_mem,end_memory_sambol
            jmp final_calc
    no_sib:
        call_in_function ozo,r_m,0
        cmp rcx,-1
        je no_sib_no_bp
        call_in_function zz,mod,0
        cmp rcx,-1
        jne no_sib_no_bp
        jmp no_sib_with_bp
        no_sib_with_bp: ;halat 4 bp + disp
            mov byte[tempstr2],0
            call_concat tempstr2,B
            call_concat tempstr2,r_m
            cmp byte[prefix_67],'Y'
            je reg_32_4
            jmp reg_64_4
            reg_32_4:
                push word [prefix_66]
                mov byte [prefix_66],'N'
                push word[rex_w]
                mov byte[rex_w],'0'
                push word[cod_w]
                mov byte [cod_w],'1'
                indexing tempstr2,base
                pop word [cod_w]
                pop word [rex_w]
                pop word [prefix_66]
                jmp after_reg_4
            reg_64_4:
                push word [prefix_66]
                mov byte [prefix_66],'N'
                push word[rex_w]
                mov byte[rex_w],'1'
                indexing tempstr2,base
                pop word [rex_w]
                pop word [prefix_66]
            after_reg_4:
            mov rax,now_line
            call immediate_to_hex
            call_concat temp_mem,memory_sambol
            call_concat temp_mem,base
            call_concat temp_mem,plus_sambol
            call_concat temp_mem,hex_data
            call_concat temp_mem,end_memory_sambol
            jmp final_calc
        no_sib_no_bp: ;halat 1 base + disp
            mov byte[tempstr2],0
            call_concat tempstr2,B
            call_concat tempstr2,r_m
            cmp byte[prefix_67],'Y'
            je reg_32_5
            jmp reg_64_5
            reg_32_5:
                push word [prefix_66]
                mov byte [prefix_66],'N'
                push word[rex_w]
                mov byte[rex_w],'0'
                push word[cod_w]
                mov byte [cod_w],'1'
                indexing tempstr2,base
                pop word [cod_w]
                pop word [rex_w]
                pop word [prefix_66]
                jmp after_reg_5
            reg_64_5:
                push word [prefix_66]
                mov byte [prefix_66],'N'
                push word[rex_w]
                mov byte[rex_w],'1'
                indexing tempstr2,base
                pop word [rex_w]
                pop word [prefix_66]
            after_reg_5:
            mov rax,now_line
            call immediate_to_hex
            call_in_function zz,mod,0
            cmp rcx,-1
            je add_disp
            jmp dont_add_disp
            add_disp:
                call_concat temp_mem,memory_sambol
                call_concat temp_mem,base
                call_concat temp_mem,plus_sambol
                call_concat temp_mem,hex_data
                call_concat temp_mem,end_memory_sambol
                jmp after_mod_reg_5
            dont_add_disp:
                call_concat temp_mem,memory_sambol
                call_concat temp_mem,base
                call_concat temp_mem,end_memory_sambol
            after_mod_reg_5:
            jmp final_calc

    final_calc:
        call_in_function opration,j_c_p_p,0
        mov rax,r14
        pop r14
        cmp rcx,-1
        jne add_qword
        cmp byte[prefix_66],'Y'
        je add_word
        cmp byte[rex_w],'1'
        je add_qword
        cmp byte[cod_w],'1'
        je add_dword
        jmp add_byte
        add_qword:
            call_concat rax,qword_sambol
            call_concat rax,temp_mem
            ret
        add_word:
            call_concat rax,word_sambol
            call_concat rax,temp_mem
            ret
        add_dword:
            call_concat rax,dword_sambol
            call_concat rax,temp_mem
            ret
        add_byte:
            call_concat rax,byte_sambol
            call_concat rax,temp_mem
            ret
%macro call_calc_mem 1
    mov rax,%1
    call calc_memory
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
    call_concat new_directory1,asm_file
    mov rdi,new_directory1
    call creatFile
    mov [new_file_descriptor1],rax
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
            ; prints 'N'
            ; mov rsi,now_line
            ; call printString
            ; call newLine
        call calc_a_line
        mov byte[result],0
        cmp byte[number_of_oprand],2
        je add_two_op
        cmp byte[number_of_oprand],1
        je add_one_op
        jmp add_z_op
        add_two_op:
            call_concat result,opration
            call_concat result,blank
            call_concat result,oprand1
            call_concat result,end_sambol
            call_concat result,oprand2
            jmp afte_ops
        add_one_op:
            call_concat result,opration
            call_concat result,blank
            call_concat result,oprand1
            jmp afte_ops
        add_z_op:
            call_concat result,opration
            jmp afte_ops
        afte_ops:
        call_concat result,next_line
        call_len result
        mov rdi,[new_file_descriptor1]
        mov rsi,result
        call writeFile
    cmp word[read_buf],0
    je exit
    jmp read_lines
exit:
    mov rdi,[file_descriptor]
    call closeFile
    mov rdi,[new_file_descriptor1]
    call closeFile
    call_concat msg_save,msg_save1
    call_concat msg_save,new_directory1
    mov rsi,msg_save
    call printString
    mov rax,60           
    xor rdi,rdi
    syscall
calc_a_line:
    init:
        mov byte [number_of_oprand],0
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
        mov byte [scale],0
        mov byte [base],0
        mov byte [index],0
        mov byte [tempstr],0
        mov byte [tempstr2],0
        mov byte [opration],0
        mov byte [oprand1],0
        mov byte [oprand2],0
        mov byte [opcode],0
        mov byte [opration_with_act],0
        mov byte [act],0
        mov byte [hex_data],0
        mov byte [reg_cod],0
        mov byte [temp_mem],0
        mov byte [result],0
    call check_67
    call check_66
    call check_rex
    mov r8,-1
    loop_find_opcode:
        inc r8
        cmp byte[now_line+r8],0
        je exit
        inc r8
        call_substr now_line,0,r8,tempstr
        dec r8
        mov byte[tempstr2],0
        call_concat tempstr2,end_sambol
        call_concat tempstr2,tempstr
        call_concat tempstr2,end_sambol

        call_in_function tempstr2,execption_list,0
        cmp rcx,-1
        jne execption_mod
        call_in_function tempstr2,operation_dict,0
        cmp rcx,-1
        je loop_find_opcode
        call_concat opcode,tempstr2
        find_in_dict tempstr2,operation_dict,opration_with_act
        call_in_function splitter_sambol,opration_with_act,0
        cmp rcx,-1
        je no_oprand
        call_substr opration_with_act,0,rcx,opration
        inc rcx
        call_substr opration_with_act,rcx,100,act
        after_act:
        inc r8
        mov byte [tempstr],0
        add r8,now_line

        call_concat tempstr,r8

        mov byte[now_line],0
        call_concat now_line,tempstr
        jmp find_s_code_w
    execption_mod:
        inc r8
        call_substr now_line,r8,100,tempstr
        call_substr tempstr,0,100,now_line
        call_substr tempstr2,0,100,opcode
        call_in_function opcode,excp1,0
        cmp rcx,-1
        jne handel_group_1
        call_in_function opcode,excp2,0
        cmp rcx,-1
        jne handel_group_2
        call_in_function opcode,excp3,0
        cmp rcx,-1
        jne handel_group_3 
        call_in_function opcode,excp4,0
        cmp rcx,-1
        jne handel_group_4
        call_in_function opcode,excp5,0
        cmp rcx,-1
        jne handel_group_5
        handel_group_1:
            mov_mem [cod_w],[now_line+1]
            call_substr now_line,4,7,reg_op
            find_in_dict reg_op,reg_op_1,opration
            call_concat act,act_imm_to_reg_imm_to_mem
            call_substr now_line,2,100,tempstr
            call_substr tempstr,0,100,now_line
            jmp after_cod_w
        handel_group_2:
            mov_mem [cod_w],[now_line]
            call_substr now_line,3,6,reg_op
            find_in_dict reg_op,reg_op_2,opration
            call_concat act,act_imm_to_reg_imm_to_mem
            call_substr now_line,1,100,tempstr
            call_substr tempstr,0,100,now_line
            jmp after_cod_w
        handel_group_3:
            mov_mem [cod_w],[now_line]
            call_substr now_line,3,6,reg_op
            find_in_dict reg_op,reg_op_2,opration
            call_substr now_line,1,100,tempstr
            call_substr tempstr,0,100,now_line
            call_concat act,act_reg_mem
            jmp after_cod_w
        handel_group_4:
            mov_mem [cod_w],[now_line]
            call_substr now_line,3,6,reg_op
            find_in_dict reg_op,reg_op_3,opration
            call_substr now_line,1,100,tempstr
            call_substr tempstr,0,100,now_line
            call_in_function test_sambol,opration,0
            cmp rcx,-1
            jne it_test
            jmp it_no_test
            it_test:
                call_concat act,act_imm_to_reg_imm_to_mem
                jmp after_cod_w
            it_no_test:
                call_concat act,act_reg_mem
                jmp after_cod_w
        handel_group_5:
            call_substr now_line,3,6,reg_op
            find_in_dict reg_op,reg_op_5,opration
            call_in_function opration,dec_inc,0
            cmp rcx,-1
            jne g5
            jmp g6
            g5:
                mov_mem [cod_w],[now_line]
                call_substr now_line,1,100,tempstr
                call_substr tempstr,0,100,now_line
                call_concat act,act_reg_mem
                jmp after_cod_w
            g6:
                call_substr now_line,1,100,tempstr
                call_substr tempstr,0,100,now_line
                call_in_function push_sambol,opration,0
                cmp rcx,-1
                jne it_is_push
                jmp it_is_not_push
                it_is_push:
                    call_concat act,act_mem
                    jmp after_cod_w
                it_is_not_push:
                    call_concat act,act_reg_mem
                    jmp after_cod_w
    find_s_code_w:
        call_in_function opcode,push_imm_code,0
        cmp rcx,-1
        jne add_s_and_zero
        call_in_function opcode,have_s_opcode,0
        cmp rcx,-1
        jne add_s
        jmp after_s
        add_s_and_zero:
            call_substr now_line,2,100,tempstr
            mov byte[now_line],0
            call_concat now_line,tempstr
            jmp after_s
        add_s:
            call_substr now_line,1,100,tempstr
            mov byte[now_line],0
            call_concat now_line,tempstr
        after_s:  
            call_in_function opcode,no_w_list,0
            cmp rcx,-1
            jne after_cod_w
            mov_mem [cod_w],[now_line]
            call_substr now_line,1,100,tempstr
            mov byte[now_line],0
            call_concat now_line,tempstr
    after_cod_w:
        call_in_function opcode,no_mod_list,0
        cmp rcx,-1
        jne no_mod
        ;find mod reg_op and r_m
        call_substr now_line,0,2,mod
        call_substr now_line,2,5,reg_op
        call_substr now_line,5,8,r_m
        call_substr now_line,8,100,tempstr
        call_substr tempstr,0,100,now_line
        jmp after_mod
            

    no_mod:
        jmp after_mod
    after_mod:
        call_in_function to_sambol,act,0
        cmp rcx,-1
        je one_oprand
        jmp two_oprand
    two_oprand:
        mov byte[number_of_oprand],2
        call_in_function act_reg_to_reg_reg_to_mem,act,0
        cmp rcx,-1
        jne acting_reg_to_reg_reg_to_mem
        call_in_function xadd_sambol,opration,0
        cmp rcx,-1
        jne acting_reg_to_reg_reg_to_mem

        call_in_function act_reg_to_reg_mem_to_reg,act,0
        cmp rcx,-1
        jne acting_reg_to_reg_mem_to_reg

        call_in_function act_mem_to_reg,act,0
        cmp rcx,-1
        jne acting_mem_to_reg

        call_in_function act_imm_to_Xax,act,0
        cmp rcx,-1
        jne acting_imm_to_Xax

        call_in_function act_imm_to_reg_imm_to_mem,act,0
        cmp rcx,-1
        jne acting_imm_to_reg_imm_to_mem

        call_in_function act_reg_to_reg_mem_to_reg_reg_to_mem,act,0
        cmp rcx,-1
        jne acting_reg_to_reg_mem_to_reg_reg_to_mem

        call_in_function act_reg_to_Xax,act,0
        cmp rcx,-1
        jne acting_reg_to_Xax

        call_in_function act_imm_to_reg_no_64,act,0
        cmp rcx,-1
        jne acting_imm_to_reg_no_64

        call_in_function act_imm_to_reg64_imm_to_mem,act,0
        cmp rcx,-1
        jne acting_imm_to_reg64_imm_to_mem
        acting_reg_to_reg_reg_to_mem:
            call_concat reg_cod,R
            call_concat reg_cod,reg_op
            indexing reg_cod,oprand2
            call_in_function oo,mod,0
            cmp rcx,-1
            jne first_is_reg1
            jmp first_is_mem1
            first_is_reg1:
                mov byte[reg_cod],0
                call_concat reg_cod,B
                call_concat reg_cod,r_m
                indexing reg_cod,oprand1
                ret
            first_is_mem1:
                call_calc_mem oprand1
                ret
        acting_reg_to_reg_mem_to_reg:
            mov byte [cod_w],'1'
            call_concat reg_cod,R
            call_concat reg_cod,reg_op
            indexing reg_cod,oprand1
            call_in_function oo,mod,0
            cmp rcx,-1
            jne second_is_reg2
            jmp second_is_mem2
            second_is_reg2:
                mov byte[reg_cod],0
                call_concat reg_cod,B
                call_concat reg_cod,r_m
                indexing reg_cod,oprand2
                ret
            second_is_mem2:
                call_calc_mem oprand2
                ret
        acting_reg_to_reg_mem_to_reg_reg_to_mem:
            call_in_function oo,mod,0
            cmp rcx,-1
            jne no_mod_oo3
            jmp mod_oo3
            no_mod_oo3:
                call_concat reg_cod,R
                call_concat reg_cod,reg_op
                indexing reg_cod,oprand2
                call_calc_mem oprand1
                ret
            mod_oo3:
                call_concat reg_cod,R
                call_concat reg_cod,reg_op
                indexing reg_cod,oprand2
                mov byte[reg_cod],0
                call_concat reg_cod,B
                call_concat reg_cod,r_m
                indexing reg_cod,oprand1
                ret
        acting_imm_to_reg_imm_to_mem:
            call_in_function oo,mod,0
            cmp rcx,-1
            jne no_mod_oo4
            jmp mod_oo4
            no_mod_oo4:
                call_concat reg_cod,B
                call_concat reg_cod,r_m
                indexing reg_cod,oprand1
                jmp after_mod_4
            mod_oo4:
                call_calc_mem oprand1
            after_mod_4:
                mov rax,now_line
                call immediate_to_hex
                call_concat oprand2,hex_data
                ret
                
        acting_mem_to_reg:
            call_concat reg_cod,R
            call_concat reg_cod,reg_op
            indexing reg_cod,oprand1
            call_calc_mem oprand2
            ret
        acting_imm_to_Xax:
            call_concat reg_cod,zzzz
            indexing reg_cod,oprand1
            mov rax,now_line
            call immediate_to_hex
            call_concat oprand2,hex_data
            ret
        acting_reg_to_Xax:
            mov byte[cod_w],'1'
            call_concat reg_cod,zzzz
            indexing reg_cod,oprand1
            mov byte[reg_cod],0
            call_concat reg_cod,B
            call_concat reg_cod,now_line
            indexing reg_cod,oprand2
            ret
        acting_imm_to_reg64_imm_to_mem:
            call_in_function oo,mod,0
            cmp rcx,-1
            jne first_is_reg8
            jmp first_is_mem8
            first_is_reg8:
                call_concat reg_cod,B
                call_concat reg_cod,r_m
                indexing reg_cod,oprand1
                jmp after_mod8
            first_is_mem8:
                call_calc_mem oprand1
            after_mod8:
                mov rax,now_line
                call immediate_to_hex
                call_concat oprand2,hex_data
                ret
        acting_imm_to_reg_no_64:
            call_concat reg_cod,B
            call_substr now_line,1,4,tempstr
            call_concat reg_cod,tempstr
            indexing reg_cod,oprand1
            call_substr now_line,4,100,tempstr
            call_substr tempstr,0,100,now_line
            mov rax,now_line
            call immediate_to_hex
            call_concat oprand2,hex_data
            ret



    one_oprand:
        mov byte[number_of_oprand],1

        call_in_function act_reg,act,0
        cmp rcx,-1
        jne acting_reg

        call_in_function act_mem,act,0
        cmp rcx,-1
        jne acting_mem

        call_in_function act_imm,act,0
        cmp rcx,-1
        jne acting_imm

        call_in_function act_reg_mem,act,0
        cmp rcx,-1
        jne acting_reg_mem
        acting_reg:
            ;just push or pop with no mod
            mov byte[reg_cod],0
            call_concat reg_cod,B
            call_concat reg_cod,now_line
            cmp byte[prefix_66],'Y'
            je its_word
            jmp its_qword
            its_word:
                indexing reg_cod,oprand1
                ret
            its_qword:
                mov byte[prefix_66],'N'
                mov byte[rex_w],'1'
                indexing reg_cod,oprand1
                ret
        acting_mem:
            call_calc_mem oprand1
            ret
        acting_imm:
            mov rax,now_line
            call immediate_to_hex
            call_concat oprand1,hex_data
            ret
        acting_reg_mem:
            call_in_function oo,mod,0
            cmp rcx,-1
            jne itreg
            jmp itmem
            itreg:
                mov byte[reg_cod],0
                call_concat reg_cod,B
                call_concat reg_cod,r_m
                indexing reg_cod,oprand1
                ret
            itmem:
                call_calc_mem oprand1
                ret
    no_oprand:
        mov byte[number_of_oprand],0
        call_substr opration_with_act,0,100,opration
        ret
;finished