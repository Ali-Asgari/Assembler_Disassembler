reg64_code = {
    "0000":["al","ax","eax","rax"],
    "0001":["cl","cx","ecx","rcx"],
    "0010":["dl","dx","edx","rdx"],
    "0011":["bl","bx","ebx","rbx"],
    "0100":["ah","sp","esp","rsp"],
    "0101":["ch","bp","ebp","rbp"],
    "0110":["dh","si","esi","rsi"],
    "0111":["bh","di","edi","rdi"],
    "1000":["r8b","r8w","r8d","r8"],
    "1001":["r9b","r9w","r9d","r9"],
    "1010":["r10b","r10w","r10d","r10"],
    "1011":["r11b","r11w","r11d","r11"],
    "1100":["r12b","r12w","r12d","r12"],
    "1101":["r13b","r13w","r13d","r13"],
    "1110":["r14b","r14w","r14d","r14"],
    "1111":["r15b","r15w","r15d","r15"]
}
operation_dict = {
    '0000000': {
        'add': ['reg to reg', 'reg to mem']
    },
    '0000001': {
        'add': ['mem to reg']
    },
    '0000010': {
        'add': ['imm to Xax']
    },
    '0000100': {
        'or': ['reg to reg', 'reg to mem']
    },
    '0000101': {
        'or': ['mem to reg']
    },
    '0000110': {
        'or': ['imm to Xax']
    },
    '000011111000': {
        'jcc': ['imm']
    },
    '0000111110101111': {
        'imul': ['reg to reg', 'mem to reg']
    },
    '0000111110111100': {
        'bsf': ['reg to reg', 'mem to reg']
    },
    '0000111110111101': {
        'bsr': ['reg to reg', 'mem to reg']
    },
    '000011111100000': {
        'xadd': ['reg to reg', 'mem to reg']
    },
    '0001000': {
        'adc': ['reg to reg', 'reg to mem']
    },
    '0001001': {
        'adc': ['mem to reg']
    },
    '0001010': {
        'adc': ['imm to Xax']
    },
    '0001100': {
        'sbb': ['reg to reg', 'reg to mem']
    },
    '0001101': {
        'sbb': ['mem to reg']
    },
    '0001110': {
        'sbb': ['imm to Xax']
    },
    '0010000': {
        'and': ['reg to reg', 'reg to mem']
    },
    '0010001': {
        'and': ['mem to reg']
    },
    '0010010': {
        'and': ['imm to Xax']
    },
    '0010100': {
        'sub': ['reg to reg', 'reg to mem']
    },
    '0010101': {
        'sub': ['mem to reg']
    },
    '0010110': {
        'sub': ['imm to Xax']
    },
    '0011000': {
        'xor': ['reg to reg', 'reg to mem']
    },
    '0011001': {
        'xor': ['mem to reg']
    },
    '0011010': {
        'xor': ['imm to Xax']
    },
    '0011100': {
        'cmp': ['reg to reg', 'reg to mem']
    },
    '0011101': {
        'cmp': ['mem to reg']
    },
    '0011110': {
        'cmp': ['imm to Xax']
    },
    '01010': {
        'push': ['reg']
    },
    '01011': {
        'pop': ['reg']
    },
    '011010': {#s0
        'push': ['imm']
    },
    '100000': {#s
        'adc': ['imm to reg', 'imm to mem'],
        'add': ['imm to reg', 'imm to mem'],
        'and': ['imm to reg', 'imm to mem'],
        'cmp': ['imm to reg', 'imm to mem'],
        'or': ['imm to reg', 'imm to mem'],
        'sbb': ['imm to reg', 'imm to mem'],
        'sub': ['imm to reg', 'imm to mem'],
        'xor': ['imm to reg', 'imm to mem']
    },
    '1000010': {
        'test': ['reg to reg', 'mem to reg', 'reg to mem']
    },
    '1000011': {
        'xchg': ['reg to reg', 'mem to reg', 'reg to mem']
    },
    '1000100': {
        'mov': ['reg to reg', 'reg to mem']
    },
    '1000101': {
        'mov': ['mem to reg']
    },
    '10001111': {
        'pop': ['mem']
    },
    '10010': {
        'xchg': ['reg to Xax']
    },
    '1010100': {
        'test': ['imm to Xax']
    },
    '1011': {
        'mov': ['imm to reg!64'] #reg is not 64 bit
    },
    '1100000': {
        'shl': ['imm to reg', 'imm to mem'],
        'shr': ['imm to reg', 'imm to mem']
    },
    '1100011': {
        'mov': ['imm to reg64', 'imm to mem']
    },
    '1101000': {
        'shl': ['reg', 'mem'],#reg is 64 bit
        'shr': ['reg', 'mem']
    },
    '11101000': {
        'call': ['imm']
    },
    '11101001': {
        'jmp': ['imm']
    },
    '1111011': {
        'idiv': ['reg', 'mem'],
        'imul': ['reg', 'mem'],
        'neg': ['reg', 'mem'],
        'not': ['reg', 'mem'],
        'test': []
    },
    '1111111': {
        'dec': ['reg', 'mem'],
        'inc': ['reg', 'mem']
    },
    '11111111': {
        'call': ['reg', 'mem'],
        'jmp': ['reg', 'mem'],
        'push': ['mem']
    },
    '11111000':'clc',
    '11111100':'cld',
    '11000011':'ret',
    '11111001':'stc',
    '11111101':'std',
    '0000111100000101':'syscall',
}
displacment_dict = {
   '00':0,
   '01':8,
   '10':32,
}
no_w_list = ['0000111110101111','0000111110111100','0000111110111101','01010','01011',
'011010','10001111','10010','11101000','11101001','11111111','11111000','11111100',
'11000011','11111001','11111101','0000111100000101']
is_s_list = ['011010','100000']#s at last# in first at last we have s0
opcode_reg_op_dict = {
    'mov':'000',
    'add':'000',
    'adc':'010',
    'sub':'101',
    'sbb':'011',
    'and':'100',
    'or':'001',
    'xor':'110',
    'cmp':'111',
    'test':'000',
    'dec':'001',
    'inc':'000',
    'push':'110',
    'pop':'000',
    'neg':'011',
    'not':'010',
    'imul':'101',
    'idiv':'111',
    'shl':'100',
    'shr':'101',
    'jmp':'100',
    'call':'010',
    'jcc':'',
    'ret':'',
}
scale_dict = {
    '00':'1',
    '01':'2',
    '10':'4',
    '11':'8',
}
def hex_to_binary(inp):
    res = ''
    for i in inp:
            if i == '0': res+='0000'
            if i == '1': res+='0001'
            if i == '2': res+='0010'
            if i == '3': res+='0011'
            if i == '4': res+='0100'
            if i == '5': res+='0101'
            if i == '6': res+='0110'
            if i == '7': res+='0111'
            if i == '8': res+='1000'
            if i == '9': res+='1001'
            if i == 'a': res+='1010'
            if i == 'b': res+='1011'
            if i == 'c': res+='1100'
            if i == 'd': res+='1101'
            if i == 'e': res+='1110'
            if i == 'f': res+='1111'
    return res
def start_with(inp1,inp2):
    if len(inp2) > len(inp1):
        return False
    for i in range(len(inp2)):
        if inp1[i] != inp2[i]:
            return False
    return True
def chech_rex():
    global inp
    global rex_w
    global R
    global X
    global B
    rex_w = '0'
    R = '0'
    X = '0'
    B = '0'
    if (start_with(inp,'0100')):
        rex_w = inp[4] 
        R = inp[5] 
        X = inp[6] 
        B = inp[7] 
        inp = inp[8:]
def check_66():
    global inp
    global prefix66
    prefix66 = False
    if (start_with(inp,'01100110')):
        prefix66 = True
        inp = inp[8:]
def check_67():
    global inp
    global prefix67
    prefix67 = False
    if (start_with(inp,'01100111')):

        prefix67 = True
        inp = inp[8:]
def immediate_to_hex(inp):
    if inp == '':
        return '0x0'
    res2 = ''
    i = len(inp)
    while i>=0:
        res2 += inp[i:i+8]
        i -= 8
    res = ''
    i = 0
    while(i < len(res2)):
        now = res2[i: i + 4]
        if(now == '0000'): res += '0'
        if(now == '0001'): res += '1'
        if(now == '0010'): res += '2'
        if(now == '0011'): res += '3'
        if(now == '0100'): res += '4'
        if(now == '0101'): res += '5'
        if(now == '0110'): res += '6'
        if(now == '0111'): res += '7'
        if(now == '1000'): res += '8'
        if(now == '1001'): res += '9'
        if(now == '1010'): res += 'a'
        if(now == '1011'): res += 'b'
        if(now == '1100'): res += 'c'
        if(now == '1101'): res += 'd'
        if(now == '1110'): res += 'e'
        if(now == '1111'): res += 'f'
        i += 4
    return hex(int('0x'+res,16))
def calc_memory():
    global inp
    global ind
    global rex_w
    global R
    global X
    global B
    global operation
    global cod_w
    global mod
    global reg_op
    global r_m
    global SS
    global Inx
    global Base
    if r_m == '100':
        # using sib
        SS = inp[ind:ind+2]
        Inx = inp[ind+2:ind+5]
        Base = inp[ind+5:ind+8]
        ind += 8
        if Base == '101' and mod == '00':
            if Inx == '100':#direct addressing 6
                imm = immediate_to_hex(inp[ind:ind+32])
                ind += 32
                oprand = '[{}]'.format(imm)
            else:#index * scale + disp 2
                index_reg_list = reg64_code[X+Inx]
                if prefix67:
                    index = index_reg_list[-2]
                else:   
                    index = index_reg_list[-1]
                scale = scale_dict[SS]
                imm = immediate_to_hex(inp[ind:ind+32])
                ind += 32
                # if int(imm,16) == 0:
                #     oprand = '[{}*{}]'.format(index,scale)
                # else: 
                oprand = '[{}*{}+{}]'.format(index,scale,imm)
        elif Base == '101' and mod != '00':# bp + index * scale + disp 3
            index_reg_list = reg64_code[B+Base]
            if prefix67:
                base = index_reg_list[-2]
            else:   
                base = index_reg_list[-1]
            index_reg_list = reg64_code[X+Inx]
            if prefix67:
                index = index_reg_list[-2]
            else:   
                index = index_reg_list[-1]
            scale = scale_dict[SS]
            imm = immediate_to_hex(inp[ind:ind+displacment_dict[mod]])
            ind += displacment_dict[mod]
            # if int(imm,16) == 0:
            #     oprand = '[{}+{}*{}]'.format(base,index,scale)
            # else: 
            oprand = '[{}+{}*{}+{}]'.format(base,index,scale,imm)
            
        else:#base + index * scale + disp  5
            index_reg_list = reg64_code[B+Base]
            if prefix67:
                base = index_reg_list[-2]
            else:   
                base = index_reg_list[-1]
            index_reg_list = reg64_code[X+Inx]
            if prefix67:
                index = index_reg_list[-2]
            else:   
                index = index_reg_list[-1]
            scale = scale_dict[SS]
            imm = immediate_to_hex(inp[ind:ind+displacment_dict[mod]])
            ind += displacment_dict[mod]
            if mod == '00':
                oprand = '[{}+{}*{}]'.format(base,index,scale)
            else: 
                oprand = '[{}+{}*{}+{}]'.format(base,index,scale,imm)

    elif mod != '00' and r_m == '101': # bp + disp 4 
        index_reg_list = reg64_code[B+r_m]
        if prefix67:
            base = index_reg_list[-2]
        else:   
            base = index_reg_list[-1]
        
        imm = immediate_to_hex(inp[ind:ind+displacment_dict[mod]])
        ind += displacment_dict[mod]
        # if int(imm,16) == 0:
        #     oprand = '[{}]'.format(base)
        # else: 
        oprand = '[{}+{}]'.format(base,imm)
    else: # base + disp 1
        index_reg_list = reg64_code[B+r_m]
        if prefix67:
            base = index_reg_list[-2]
        else:   
            base = index_reg_list[-1]
        imm = immediate_to_hex(inp[ind:])
        if mod == '00':
            oprand = '[{}]'.format(base)
        else: 
            oprand = '[{}+{}]'.format(base,imm)
    if operation in ['jmp','call','pop','push']:
        oprand = 'QWORD PTR ' + oprand
    elif prefix66:
        oprand = 'WORD PTR ' + oprand
    elif rex_w == '1':
        oprand = 'QWORD PTR ' + oprand
    elif cod_w == '1':
        oprand = 'DWORD PTR ' + oprand
    else:
        oprand = 'BYTE PTR ' + oprand
    return oprand


inp = input("Enter machine code in hex:\n")
inp = hex_to_binary(inp)
check_67()
check_66()
chech_rex()
cod_w = mod = reg_op = r_m = S = D  = oprand1 = oprand2 = ''
operations_list =[]
opcodes_list = []
ind = 0
inds_list = []
while ind<=len(inp) and ind<=16:
    if inp[:ind] in operation_dict:
        opcodes_list.append (inp[:ind])
        operations_list.append( operation_dict[inp[:ind]])
        inds_list.append(ind)

    ind +=1
for i in range(len(opcodes_list)):
        
    if opcodes_list[i] in is_s_list:
        S = inp[inds_list[i]]
        inds_list[i] += 1
    else: 
        D = opcodes_list[i][-1]
    if opcodes_list[i] not in no_w_list:
        cod_w = inp[inds_list[i]]
        inds_list[i] += 1
for i in range(len(operations_list)):
    ind = inds_list[i]
    mod = inp[ind:ind+2]
    reg_op = inp[ind+2:ind+5]
    r_m = inp[ind+5:ind+8]
    ind += 8
    if str(type(operations_list[i])) == "<class 'dict'>":
        if len(operations_list[i])   == 1:
                opcode = opcodes_list[i]
                operation = list(operations_list[i].keys())[0]
                ind = inds_list[i]
                mod = inp[ind:ind+2]
                reg_op = inp[ind+2:ind+5]
                r_m = inp[ind+5:ind+8]
                ind += 8
        else:
            for j in operations_list[i]:
                if opcode_reg_op_dict[j] == reg_op:
                    opcode = opcodes_list[i]
                    operation = j
                    ind = inds_list[i]
                    mod = inp[ind:ind+2]
                    reg_op = inp[ind+2:ind+5]
                    r_m = inp[ind+5:ind+8]
                    ind += 8
    else:
        opcode = opcodes_list[i]
        operation = operation_dict[opcodes_list[i]]
if str(type(operation_dict[opcode])) != "<class 'str'>": 
    if len(operation_dict[opcode][operation][0].split()) == 1:#one oprand
        if mod == '11': # reg
            reg_list = reg64_code[B+r_m]
            if operation in ['jmp','call','pop','push']:
                oprand = reg_list[3]
            elif (prefix66):
                oprand = reg_list[1]
            elif rex_w == '1':
                oprand = reg_list[3]
            elif cod_w == '1':
                oprand = reg_list[2]
            else :
                oprand = reg_list[0]
        elif operation_dict[opcode][operation][0] == 'imm':#imm 
            if operation == 'push':
                S = inp[ind]
                ind += 2
                oprand = immediate_to_hex(inp[ind:])
            else :
                oprand = immediate_to_hex(inp[ind:])
        else :#      mem
            oprand = calc_memory()
        if operation in ['shr','shl']:
            oprand = oprand + ',1'
        res = operation + ' '+oprand
    else:#      two oprand'
        if operation_dict[opcode][operation] == ['reg to reg', 'reg to mem'] or operation == 'xadd':
            reg_list = reg64_code[R+reg_op]
            if (prefix66):
                oprand2 = reg_list[1]
            elif rex_w == '1':
                oprand2 = reg_list[3]
            elif cod_w == '1':
                oprand2 = reg_list[2]
            else :
                oprand2 = reg_list[0]
            if mod == '11':
                reg_list = reg64_code[B+r_m]
                if (prefix66):
                    oprand1 = reg_list[1]
                elif rex_w == '1':
                    oprand1 = reg_list[3]
                elif cod_w == '1':
                    oprand1 = reg_list[2]
                else :
                    oprand1 = reg_list[0]
            else:
                oprand1 = calc_memory()
        elif operation_dict[opcode][operation] == ['reg to reg', 'mem to reg']:
            cod_w = '1'
            reg_list = reg64_code[R+reg_op]
            if (prefix66):
                oprand1 = reg_list[1]
            elif rex_w == '1':
                oprand1 = reg_list[3]
            elif cod_w == '1':
                oprand1 = reg_list[2]
            else :
                oprand1 = reg_list[0]
            if mod == '11':
                reg_list = reg64_code[B+r_m]
                if (prefix66):
                    oprand2 = reg_list[1]
                elif rex_w == '1':
                    oprand2 = reg_list[3]
                elif cod_w == '1':
                    oprand2 = reg_list[2]
                else :
                    oprand2 = reg_list[0]
            else:
                oprand2 = calc_memory()
        elif operation_dict[opcode][operation] == ['imm to reg', 'imm to mem']:
            if mod == '11':
                reg_list = reg64_code[B+r_m]
                if (prefix66):
                    oprand1 = reg_list[1]
                elif rex_w == '1':
                    oprand1 = reg_list[3]
                elif cod_w == '1':
                    oprand1 = reg_list[2]
                else :
                    oprand1 = reg_list[0]
            else:
                oprand1 = calc_memory()
            oprand2 = immediate_to_hex (inp[ind:])
        elif operation_dict[opcode][operation] == ['reg to reg', 'mem to reg', 'reg to mem']:
            if mod == '11':
                reg_list = reg64_code[R+reg_op]
                if (prefix66):
                    oprand1 = reg_list[1]
                elif rex_w == '1':
                    oprand1 = reg_list[3]
                elif cod_w == '1':
                    oprand1 = reg_list[2]
                else :
                    oprand1 = reg_list[0]
                reg_list = reg64_code[B+r_m]
                if (prefix66):
                    oprand2 = reg_list[1]
                elif rex_w == '1':
                    oprand2 = reg_list[3]
                elif cod_w == '1':
                    oprand2 = reg_list[2]
                else :
                    oprand2 = reg_list[0]
                oprand1,oprand2 = oprand2,oprand1
            else:
                reg_list = reg64_code[R+reg_op]
                if (prefix66):
                    oprand1 = reg_list[1]
                elif rex_w == '1':
                    oprand1 = reg_list[3]
                elif cod_w == '1':
                    oprand1 = reg_list[2]
                else :
                    oprand1 = reg_list[0]
                oprand2 = calc_memory()
                oprand1,oprand2 = oprand2,oprand1
        elif operation_dict[opcode][operation] == ['mem to reg']:
            reg_list = reg64_code[R+reg_op]
            if (prefix66):
                oprand1 = reg_list[1]
            elif rex_w == '1':
                oprand1 = reg_list[3]
            elif cod_w == '1':
                oprand1 = reg_list[2]
            else :
                oprand1 = reg_list[0]
            oprand2 = calc_memory()
        elif operation_dict[opcode][operation] == ['imm to reg']:
            reg_list = reg64_code[B+r_m]
            if (prefix66):
                oprand1 = reg_list[1]
            elif rex_w == '1':
                oprand1 = reg_list[3]
            elif cod_w == '1':
                oprand1 = reg_list[2]
            else :
                oprand1 = reg_list[0]
            oprand2 = immediate_to_hex (inp[ind:])
        elif operation_dict[opcode][operation] == ['imm to Xax']:
            reg_list = reg64_code['0000']
            if (prefix66):
                oprand1 = reg_list[1]
            elif rex_w == '1':
                oprand1 = reg_list[3]
            elif cod_w == '1':
                oprand1 = reg_list[2]
            else :
                oprand1 = reg_list[0]
            oprand2 = immediate_to_hex (inp[ind:])
        elif operation_dict[opcode][operation] == ['reg to Xax']:
            cod_w = '1'
            reg_list = reg64_code['0000']
            if (prefix66):
                oprand1 = reg_list[1]
            elif rex_w == '1':
                oprand1 = reg_list[3]
            elif cod_w == '1':
                oprand1 = reg_list[2]
            else :
                oprand1 = reg_list[0]
            reg_list = reg64_code[inp[-4:]]
            if (prefix66):
                oprand2 = reg_list[1]
            elif rex_w == '1':
                oprand2 = reg_list[3]
            elif cod_w == '1':
                oprand2 = reg_list[2]
            else :
                oprand2 = reg_list[0]
        elif operation_dict[opcode][operation] == ['imm to reg64', 'imm to mem']:
            if mod == '11':
                reg_list = reg64_code[B+r_m]
                if (prefix66):
                    oprand1 = reg_list[1]
                elif rex_w == '1':
                    oprand1 = reg_list[3]
                elif cod_w == '1':
                    oprand1 = reg_list[2]
                else :
                    oprand1 = reg_list[0]
            else:
                oprand1 = calc_memory()
            oprand2 = immediate_to_hex (inp[ind:])
        elif operation_dict[opcode][operation] == ['imm to reg!64']:
            reg_list = reg64_code['0000']
            if (prefix66):
                oprand1 = reg_list[1]
            elif rex_w == '1':
                oprand1 = reg_list[3]
            elif cod_w == '1':
                oprand1 = reg_list[2]
            else :
                oprand1 = reg_list[0]
            oprand2 = immediate_to_hex(inp[4:])
        res = operation +' '+oprand1+',' +oprand2
else:
    res = operation 
print ("Assembly instruction:\n%s"%(res))