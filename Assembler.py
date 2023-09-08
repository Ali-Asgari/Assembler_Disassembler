reg_list=[
    'rax','eax','ax','ah','al',
    'rbx','ebx','bx','bh','bl',
    'rcx','ecx','cx','ch','cl',
    'rdx','edx','dx','dh','dl',
    'rsp','esp','sp',
    'rbp','ebp','bp',
    'rsi','esi','si',
    'rdi','edi','di',
    'r8' ,'r8d','r8w','r8b',
    'r9' ,'r9d','r9w','r9b',
    'r10','r10d','r10w','r10b',
    'r11','r11d','r11w','r11b',
    'r12','r12d','r12w','r12b',
    'r13','r13d','r13w','r13b',
    'r14','r14d','r14w','r14b',
    'r15','r15d','r15w','r15b'
]
reg32_list = ['eax','ebx','ecx','edx','esp','ebp','esi','edi','r8d','r9d','r10d','r11d','r12d','r13d','r14d','r15d']
reg64_code = {
    'rax':'0000','eax':'0000','ax':'0000','ah':'0100','al':'0000',
    'rbx':'0011','ebx':'0011','bx':'0011','bh':'0111','bl':'0011',
    'rcx':'0001','ecx':'0001','cx':'0001','ch':'0101','cl':'0001',
    'rdx':'0010','edx':'0010','dx':'0010','dh':'0110','dl':'0010',
    'rsp':'0100','esp':'0100','sp':'0100',
    'rbp':'0101','ebp':'0101','bp':'0101',
    'rsi':'0110','esi':'0110','si':'0110',
    'rdi':'0111','edi':'0111','di':'0111',
    'r8':'1000','r8d':'1000','r8w':'1000','r8b':'1000',
    'r9':'1001','r9d':'1001','r9w':'1001','r9b':'1001',
    'r10':'1010','r10d':'1010','r10w':'1010','r10b':'1010',
    'r11':'1011','r11d':'1011','r11w':'1011','r11b':'1011',
    'r12':'1100','r12d':'1100','r12w':'1100','r12b':'1100',
    'r13':'1101','r13d':'1101','r13w':'1101','r13b':'1101',
    'r14':'1110','r14d':'1110','r14w':'1110','r14b':'1110',
    'r15':'1111','r15d':'1111','r15w':'1111','r15b':'1111',
}
displacment_dict = {
    0:'00',
    8:'01',
    16:'10',
    32:'10'
}
scale_dict = {
    '1':'00',
    '2':'01',
    '4':'10',
    '8':'11'
}
opration_dict = {
#two oprands
    'mov':{
        'reg to reg':'1000 100',#w : 11 reg1 reg2
        'mem to reg':'1000 101',#w : mod reg r/m
        'reg to mem':'1000 100',#w : mod reg r/m
        'imm to reg64':'1100 011',#w : 11 000 reg : immediate data
        'imm to reg!64':'1011',# w reg : immediate data
        'imm to reg':'',# w reg : immediate data
        'imm to mem':'1100 011',#w : mod 000 r/m : immediate data
    },
    'add':{
        'reg to reg':'0000 000',#w : 11 reg1 reg2
        'mem to reg':'0000 001',#w : mod reg r/m
        'reg to mem':'0000 000',#w : mod reg r/m
        'imm to reg':'1000 00s',#w : 11 000 reg immdata
        'imm to mem':'1000 00s',#w : mod 000 r/m : immediate data
        'imm to Xax':'0000 010',#w : immediate data
    },
    'adc':{
        'reg to reg':'0001 000',#w : 11 reg1 reg2
        'mem to reg':'0001 001',#w : mod reg r/m
        'reg to mem':'0001 000',#w : mod reg r/m
        'imm to reg':'1000 00s',#w : 11 010 reg immdata
        'imm to mem':'1000 00s',#w : mod 010 r/m : immediate data
        'imm to Xax':'0001 010',#w : immediate data
    },
    'sub':{
        'reg to reg':'0010 100',#w : 11 reg1 reg2
        'mem to reg':'0010 101',#w : mod reg r/m
        'reg to mem':'0010 100',#w : mod reg r/m
        'imm to reg':'1000 00s',#w : 11 101 reg immdata
        'imm to mem':'1000 00s',#w : mod 101 r/m : immediate data
        'imm to Xax':'0010 110',#w : immediate data
    },
    'sbb':{
        'reg to reg':'0001 100',#w : 11 reg1 reg2
        'mem to reg':'0001 101',#w : mod reg r/m
        'reg to mem':'0001 100',#w : mod reg r/m
        'imm to reg':'1000 00s',#w : 11 011 reg immdata
        'imm to mem':'1000 00s',#w : mod 011 r/m : immediate data
        'imm to Xax':'0001 110',#w : immediate data
    },
    'and':{
        'reg to reg':'0010 000',#w : 11 reg1 reg2
        'mem to reg':'0010 001',#w : mod reg r/m
        'reg to mem':'0010 000',#w : mod reg r/m
        'imm to reg':'1000 00s',#w : 11 100 reg immdata
        'imm to mem':'1000 00s',#w : mod 100 r/m : immediate data
        'imm to Xax':'0010 010',#w : immediate data
    },
    'or':{
        'reg to reg':'0000 100',#w : 11 reg1 reg2
        'mem to reg':'0000 101',#w : mod reg r/m
        'reg to mem':'0000 100',#w : mod reg r/m
        'imm to reg':'1000 00s',#w : 11 001 reg immdata
        'imm to mem':'1000 00s',#w : mod 001 r/m : immediate data
        'imm to Xax':'0000 110',#w : immediate data
    },
    'xor':{
        'reg to reg':'0011 000',#w : 11 reg1 reg2
        'mem to reg':'0011 001',#w : mod reg r/m
        'reg to mem':'0011 000',#w : mod reg r/m
        'imm to reg':'1000 00s',#w : 11 110 reg immdata
        'imm to mem':'1000 00s',#w : mod 110 r/m : immediate data
        'imm to Xax':'0011 010',#w : immediate data
    },
    'cmp':{#with
        'reg to reg':'0011 100',#w : 11 reg1 reg2
        'mem to reg':'0011 101',#w : mod reg r/m
        'reg to mem':'0011 100',#w : mod reg r/m
        'imm to reg':'1000 00s',#w : 11 111 reg immdata
        'imm to mem':'1000 00s',#w : mod 111 r/m : immediate data
        'imm to Xax':'0011 110',#w : immediate data
    },
    'test':{ #with
        'reg to reg':'1000 010',#w : 11 reg1 reg2
        'mem to reg':'1000 010',#w : mod reg r/m
        'reg to mem':'1000 010',#w : mod reg r/m
        'imm to reg':'1111 011',#w : 11 000 reg immdata
        'imm to mem':'1111 011',#w : mod 000 r/m : immediate data
        'imm to Xax':'1010 100',#w : immediate data
    },
    'xchg':{#with   !!!!!!! sometime no w
        'reg to reg':'1000 011',#w : 11 reg1 reg2
        'mem to reg':'1000 011',#w : mod reg r/m
        'reg to mem':'1000 011',#w : mod reg r/m
        'reg to Xax':'1001 0',#reg
    },
    'xadd':{
        'reg to reg':'0000 1111 1100 000',#w : 11 reg1 reg2
        'mem to reg':'0000 1111 1100 000',#w : mod reg r/m
    },
    'bsf':{#     !!!!!!! no w
        'reg to reg':'0000 1111 1011 1100',#11 reg1 reg2
        'mem to reg':'0000 1111 1011 1100',#mod reg r/m
    },
    'bsr':{#     !!!!!!! no w
        'reg to reg':'0000 1111 1011 1101',#11 reg1 reg2
        'mem to reg':'0000 1111 1011 1101',#mod reg r/m
    },
#one oprands
    'dec':{
        'reg':'1111 111',#w : 11 001 reg
        'mem':'1111 111',#w : mod 001 r_m
    },
    'inc':{
        'reg':'1111 111',#w : 11 000 reg
        'mem':'1111 111',#w : mod 000 r_m
    },
    'idiv':{
        'reg':'1111 011',#w : 11 111 reg errrror
        'mem':'1111 011',#w : mod 111 r_m
    },
    'push':{#     !!!!!!! no w
        # 'reg':'1111 1111',# : 11 110 reg
        'reg':'0101 0',# : reg
        'mem':'1111 1111',# : mod 110 r_m
        'imm':'0110 10s0',# : immediate data
    },
    'pop':{#     !!!!!!! no w
        # 'reg':'1000 1111',# : 11 000 reg
        'reg':'0101 1',# : reg
        'mem':'1000 1111',# : mod 000 r_m
    },
    'neg':{
        'reg':'1111 011',#w : 11 011 reg
        'mem':'1111 011',#w : mod 011 r_m
    },
    'not':{
        'reg':'1111 011',#w : 11 010 reg'
        'mem':'1111 011',#w : mod 010 r_,'
    },
    'jmp':{#     !!!!!!! no w
        'imm':'1110 1001',#displacement32
        'reg':'1111 1111',# : 11 100 reg
        'mem':'1111 1111',#mod 100 r_m and rex
    },
    'call':{#     !!!!!!! no w
        'imm':'1110 1000',#displacement32
        'reg':'1111 1111',# : 11 010  reg
        'mem':'1111 1111',#mod 010  r_m and rex
    },
    'jcc':{
        'imm':'0000 1111 1000',# tttn : full displacement
    },
#can be one can be two oprand
    'imul':{#            !!!!!!! sometime no w
        #one oprand
        'reg':'1111 011',#w : 11 101 reg
        'mem':'1111 011',#w : mod 101 r_m
        #two oprand
        'reg to reg':'0000 1111 1010 1111',# : 11 : reg1 reg2'
        'mem to reg':'0000 1111 1010 1111',# : mod : reg r_m'
    },
    'shl':{
        #one oprand 
        'reg':'1101 000',#w : 11 100 reg
        'mem':'1101 000',#w : mod 100 r_m
        #two oprand
        'imm to reg':'1100 000',#w : 11 100 reg : imm8 data
        'imm to mem':'1100 000',#w : mod 100 r_m : imm8 data
    },
    'shr':{
        #one oprand 
        'reg':'1101 000',#w : 11 101 reg
        'mem':'1101 000',#w : mod 101 r_m
        #two oprand
        'imm to reg':'1100 000',#w : 11 101 reg : imm8 data
        'imm to mem':'1100 000',#w : mod 101 r_m : imm8 data
    },
#no oprand
    'stc':'11111001',
    'clc':'11111000',
    'std':'11111101',
    'cld':'11111100',
    'syscall':'0000 1111 0000 0101',
# can be one oprand or zero
    'ret':'1100 0011',
}
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
no_w_list = ['bsf','bsr','pop','push','imul','jmp','call']
ax_reg_opration_list = ['add','adc','sub','sbb','and','or','xor','cmp']
conditions_dict = {
    'o':'0000','no':'0001',
    'b':'0010','nb':'0011',
    'ae':'0011','nae':'0010',
    'e':'0100','ne':'0101',
    'z':'0100','nz':'0101',
    'be':'0110','nbe':'0111',
    'a':'0111','na':'0110',
    's':'1000','ns':'10001',
    'p':'1010','pe':'1010','np':'1011','po':'1011',
    'l':'1100','nl':'1101',
    'ge':'1101','nge':'1100',
    'le':'1110','nle':'1111',
    'g':'1111', 'ng':'1110',
}



def find_base_scale_index_displacement(inp):
    all_list = []
    i = 0
    base = ''
    scale = ''
    index = ''
    disp = ''
    now = ''
    while i<len(inp):
        if inp[i] == '[':
            i += 1
            while inp[i] != ']':
                if inp[i] in '+*':
                    all_list.append(now)
                    all_list.append(inp[i])
                    now = ''
                    i += 1
                    continue
                now += inp[i]
                i += 1 
        i += 1
    if now != '':
        all_list.append(now)
    i = 0
    while i<len(all_list):
        if all_list[i] == '*':
            index = all_list[i-1]
            scale = all_list[i+1]
        if all_list[i] == '+':
            if i>2:
                if all_list[i-2] == '+':
                    disp = all_list [i+1]
                    index = all_list [i-1]
                if all_list[i-2] == '*':
                    disp = all_list [i+1]
            if len(all_list)>i+2:
                if all_list[i+2] in '*+':
                    base = all_list[i-1]
        i += 1
    if len(all_list) == 3 and all_list[1] == '+':
        base = all_list[0]
        if all_list[-1] in reg_list:
            index = all_list[-1]
        else:
            disp = all_list[-1]
    if index != '' and scale == '':
        scale = '1'
    if len(all_list) == 1:
        if all_list[0] in reg_list:
            base = all_list[0]
        else:
            disp = all_list[0]
    # print ('base:',base,' index:',index,' scale:',scale,' disp:',disp)
    return base, index, scale, disp
def find_opration_oprands_types(inp):
    operation = inp.split()[0]
    inp = ' '.join(inp.split()[1:])
    oprands_list = []
    types_list = []
    op = ''
    i = 0
    is_mem = False
    while (i<len(inp)):
        op += inp[i]
        if inp[i] == "'":
            types_list.append('imm')
            i += 1
            while (inp[i] !="'"):
                op += inp[i]
                i += 1
            op += inp[i]
            i += 1
            continue
        if inp[i] == '[':
            is_mem = True
        if inp[i] == ',':
            op = op[:-1].strip()
            oprands_list.append(op)
            if (is_mem):
                types_list.append('mem')
                is_mem = False
            elif (op in reg_list):
                types_list.append('reg')
            else :
                types_list.append('imm')
            op = ''
        i += 1
    op = op.strip()
    if op != '':
        oprands_list.append(op)
        if (is_mem):
            types_list.append('mem')
        elif (op in reg_list):
            types_list.append('reg')
        else :
            types_list.append('imm')
    return operation,oprands_list,types_list
def oprand_size(oprand,type):
    if type == 'reg':
        if (len(oprand) == 2 and oprand[-1] in 'lh') or ((len(oprand) == 3 or len(oprand) == 4) and oprand[0] == 'r' and oprand[-1] == 'b'):
            return 8
        if (len(oprand) == 2 and oprand[-1] in 'xpi') or ((len(oprand) == 3 or len(oprand) == 4) and  oprand[0] == 'r' and oprand[-1] == 'w'):
            return 16
        if (len(oprand) == 3 and  oprand[0] == 'e' and oprand[-1] in 'xpi') or ((len(oprand) == 3 or len(oprand) == 4) and  oprand[0] == 'r' and oprand[-1] == 'd'):
            return 32
        if (len(oprand) == 3 and  oprand[0] == 'r' and oprand[-1] in 'xpi') or ((len(oprand)== 2 or len(oprand)== 3) and  oprand[0] == 'r'):
            return 64    
    if type == 'mem':
        if oprand.split()[0] == 'BYTE':
            return 8
        if oprand.split()[0] == 'WORD':
            return 16
        if oprand.split()[0] == 'DWORD':
            return 32
        if oprand.split()[0] == 'QWORD':
            return 64
def immediate_size(inp):
    global max_size
    if inp == '': return 0
    elif 'x' in inp:
        # hex 
        if int(inp,16) >127:
            return max_size
        else:
            return 8
    elif 'b' in inp:
        # bin
        if int(inp,2) >127:
            return max_size
        else:
            return 8
    else:
        # decimal
        if int(inp) >127:
            return max_size
        elif int(inp) == 0:
            return 0
        else:
            return 8
def immediate_to_binary(inp,size):
    res = ''
    if inp == '':
        return '0'*size
    if 'x' in inp:
        inp = inp[2:]
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
    elif 'b' in inp: res = inp[2:]
    else: res = bin(int(inp))[2:]
    i = len(res)
    while i<size:
        res = '0'+res
        i += 1
    # now revrse it
    res2 = ''
    i = size - 8
    while i>=0:
        res2 += res[i:i+8]
        i -= 8
    return res2
def check_rex(ops,types):
    for i in range(len(ops)):
        if (types[i] == 'mem' or types[i] == 'reg'):
            if 'r8' in ops[i] or'r9' in ops[i] or'r10'in ops[i] or'r11' in ops[i] or'r12' in ops[i] or'r13' in ops[i] or'r14' in ops[i] or'r15' in ops[i] or oprand_size(ops[i],types[i]) == 64:
                return True
    return False
def calc_mem(inp):
    base, index, scale, disp = find_base_scale_index_displacement(inp)
    global X
    global B
    global mod
    global r_m
    global SS
    global Inx
    global Bas
    global displacment
    global max_size
    # X = ''
    # B = ''
    # mod = ''
    # r_m = ''
    SS = ''
    Inx = ''
    Bas = ''
    # displacment = ''
    if base != '' and base[-2:] != 'bp'  and index == '' : # base + disp 
        # print(immediate_size(disp))
        mod = displacment_dict[immediate_size(disp)]
        code = reg64_code[base]
        B = code[0]
        r_m = code[1:]
        displacment = immediate_to_binary(disp,immediate_size(disp))
    elif(base == '' and index != ''): # index * scalse + disp
        mod = '00'
        r_m = '100'
        SS = scale_dict[scale]
        code = reg64_code[index]
        X = code[0]
        Inx = code[1:]
        Bas = reg64_code['rbp'][1:]
        displacment = immediate_to_binary(disp,32)
    elif(base[-2:] == 'bp' and index != ''): # bp + index * scale + disp
        if disp == '':
            mod = '01'
            size = 8
        else:
            size = immediate_size(disp)
            mod = displacment_dict[size]
        r_m = '100'
        SS = scale_dict[scale]
        code = reg64_code[index]
        X = code[0]
        Inx = code[1:]
        Bas = reg64_code['rbp'][1:]
        displacment = immediate_to_binary(disp,size)
    elif (base[-2:] == 'bp'): # bp + disp
        if disp == '':
            mod = '01'
            size = 8
        else:
            size = immediate_size(disp)
            mod = displacment_dict[size]
        r_m = '101'
        displacment = immediate_to_binary(disp,size)
    elif base == '' and index == '': # direct addressing
        mod = '00'
        r_m = '100'
        SS = '00'
        Inx = '100'
        Bas = '101'
        displacment = immediate_to_binary(disp,max_size)
    else:
        mod = displacment_dict[immediate_size(disp)]
        r_m = '100'
        SS = scale_dict[scale] 
        code = reg64_code[base]
        B = code[0]
        Bas = code[1:]
        code = reg64_code[index]
        X = code[0]
        Inx = code[1:]
        displacment = immediate_to_binary(disp,immediate_size(disp))
def check_new_reg(op):
    if 'r8' in op or 'r9' in op or'r10'in op or'r11' in op or'r12' in op or'r13' in op or'r14' in op or'r15' in op:
        return True
    return False
def binary_to_hex(inp):
    inp = inp.replace(' ','')
    ind = 0
    ans = ''
    while(len(inp) % 8 != 0):
        inp = "0" + inp
    while(ind < len(inp)):
        now = inp[ind: ind + 4]
        if(now == '0000'): ans += '0'
        if(now == '0001'): ans += '1'
        if(now == '0010'): ans += '2'
        if(now == '0011'): ans += '3'
        if(now == '0100'): ans += '4'
        if(now == '0101'): ans += '5'
        if(now == '0110'): ans += '6'
        if(now == '0111'): ans += '7'
        if(now == '1000'): ans += '8'
        if(now == '1001'): ans += '9'
        if(now == '1010'): ans += 'a'
        if(now == '1011'): ans += 'b'
        if(now == '1100'): ans += 'c'
        if(now == '1101'): ans += 'd'
        if(now == '1110'): ans += 'e'
        if(now == '1111'): ans += 'f'
        ind += 4
    return ans



inp = input("Enter assembly instruction:\n")
opration,oprands,types=find_opration_oprands_types(inp)
need_rex = check_rex(oprands,types)
prefix_66 = False
prefix_67 = False
rex_w = '0'
R = '0'
X = '0'
B = '0'
res = ''
if len(oprands) == 2:
    opcode = opration_dict[opration][types[1]+' to '+types[0]]
    # add adc sub sbb and or xor cmp
    # if 'd' in opcode: #no need for d
    #     if types[1] == 'mem':
    #         opcode.replace('d','1')
    #         # D = '1'
    #     else:
    #         opcode.replace('d','0')
    #         # D = '0'
    if oprand_size(oprands[0],types[0]) == 64:
        max_size = 32
    else:
        max_size = oprand_size(oprands[0],types[0])
    if oprand_size(oprands[0],types[0]) == 64:
        rex_w = '1'  
    if oprand_size(oprands[0],types[0]) != 8:
        cod_w = '1'
    else:
        cod_w = '0'
    if opration in no_w_list:
        cod_w = ''
    if types[1] == 'reg':
        code = reg64_code[oprands[1]]
        if opration in ['bsf','bsr','imul']:
            code = reg64_code[oprands[0]]
        R = code[0]
        reg_op = code[1:]
        if types[0] == 'reg':                #reg reg   doneeeeeeee
            mod = '11'
            code = reg64_code[oprands[0]]
            if opration in ['bsf','bsr','imul']:
                code = reg64_code[oprands[1]]
            B = code[0]
            r_m = code[1:]
            if opration == 'xchg' and oprands[0][-2:] == 'ax':
                opcode = opration_dict[opration][types[1]+' to '+'Xax']
                mod = ''
                cod_w = ''
                r_m = ''
            res = opcode+cod_w+mod+reg_op+r_m
        else:                                #mem reg   doneeeeeeeee
            calc_mem(oprands[0])
            res = opcode+cod_w+mod+reg_op+r_m+SS+Inx+Bas+displacment
    else:
        # second op is mem so first op must be reg
        if types[1] == 'mem':               #reg mem    doneeeeeeeeee
            code = reg64_code[oprands[0]]
            R = code[0]
            reg_op = code[1:]
            calc_mem(oprands[1])
            res =' '+ opcode+' '+cod_w+' '+mod+' '+reg_op+' '+r_m+' '+SS+' '+Inx+' '+Bas+' '+displacment+' '
        # second op is imm so first op could be reg or mem
        elif types[0] == 'reg':             #reg imm    doneeeeeeeee
            if opration == 'mov':
                if oprand_size(oprands[0],types[0]) == 64:
                    opcode = opration_dict[opration][types[1]+' to '+types[0]+'64']
                else:
                    opcode = opration_dict[opration][types[1]+' to '+types[0]+'!64']
            mod = '11'
            code = reg64_code[oprands[0]]
            B = code[0]
            r_m = code[1:]
            reg_op = opcode_reg_op_dict[opration]
            im_size = max_size
            if 's' in opcode:
                size = immediate_size(oprands[1])
                if oprand_size(oprands[0],types[0]) != 8 and size == 8: 
                    opcode = opcode.replace('s','1')
                    im_size = 8
                else:
                    opcode = opcode.replace('s','0')
            if opration == 'test':
                if oprands[0][-2:] in ['ax','al'] :
                    opcode = opration_dict[opration][types[1]+' to '+'Xax']
            if opration == 'mov':
                if oprand_size(oprands[0],types[0]) == 64:
                    res = opcode+cod_w+mod+reg_op+r_m+immediate_to_binary(oprands[1],im_size)
                else:
                    res = opcode+cod_w+r_m+immediate_to_binary(oprands[1],im_size)
            else:
                res = opcode+cod_w+mod+reg_op+r_m+immediate_to_binary(oprands[1],im_size)
            if opration in ['shr','shl']:
                if int('0b'+immediate_to_binary(oprands[1],32),2) == 16777216:
                    opcode = opration_dict[opration]['reg']
                    res = opcode+' '+cod_w+' '+mod+' '+reg_op+' '+r_m
                else:
                    res = opcode+' '+cod_w+' '+mod+' '+reg_op+' '+r_m+' '+immediate_to_binary(oprands[1],8)
            if  (opration in ax_reg_opration_list) and ((oprands[0] == 'al') or (oprands[0][-2:] == 'ax' and int('0b'+immediate_to_binary(oprands[1],immediate_size(oprands[1])),2) > 127 )):
                opcode = opration_dict[opration][types[1]+' to '+'Xax']
                res = opcode+cod_w+' '+immediate_to_binary(oprands[1],immediate_size(oprands[1]))
        elif types[0] == 'mem':             #mem imm    doneeeeeeeeeee
            calc_mem(oprands[0])
            reg_op = opcode_reg_op_dict[opration]
            if opration in ['shr','shl']:
                max_size = 8
                if int('0b'+immediate_to_binary(oprands[1],max_size),2) == 1:
                    opcode = opration_dict[opration][types[0]]
                    res = opcode+cod_w+mod+reg_op+r_m+SS+Inx+Bas+displacment
                else:
                    res = opcode+cod_w+mod+reg_op+r_m+SS+Inx+Bas+displacment+immediate_to_binary(oprands[1],max_size)
            else:
                res = opcode+cod_w+mod+reg_op+r_m+SS+Inx+Bas+displacment+immediate_to_binary(oprands[1],max_size)            
if len(oprands) == 1:
    if opration[0] =='j' and opration != 'jmp':
        condition = opration[1:]
        opration = 'jcc'
    if opration == 'ret':
        opcode = '11000010'
    else:    
        opcode = opration_dict[opration][types[0]]
    if oprand_size(oprands[0],types[0]) == 64:
        rex_w = '1'  
    if oprand_size(oprands[0],types[0]) != 8 and types[0] != 'imm':
        cod_w = '1'
    else:
        cod_w = '0'
    if opration in no_w_list and opration != 'imul':
        cod_w = ''
    reg_op = opcode_reg_op_dict[opration]
    if types[0] == 'reg':
        code = reg64_code[oprands[0]]
        B = code[0]
        r_m = code[1:]
        mod = '11'
        res = opcode+cod_w+mod+reg_op+r_m
        if opration in ['jmp','call']:
            if check_new_reg(oprands[0]):
                need_rex = True
            else:
                need_rex = False
            rex_w = '0'
        if opration in ['pop','push']:
            if check_new_reg(oprands[0]):
                need_rex = True
            else:
                need_rex = False
            res = opcode+r_m
    if types[0] == 'mem':
        # if oprand_size(oprands[0],types[0]) == 64:
        max_size = 32
        # else:
            # max_size = oprand_size(oprands[0],types[0])
        calc_mem(oprands[0])
        if opration in ['jmp','call']:
            if check_new_reg(oprands[0]):
                need_rex = True
            else:
                need_rex = False
            if oprand_size(oprands[0],types[0]) == 32:
                if opration == 'jmp': reg_op = '101'
                if opration == 'call': reg_op = '011'
                prefix_66 = True
        if opration in ['pop','push']:
            if check_new_reg(oprands[0]):
                need_rex = True
            else:
                need_rex = False
        res = opcode+' '+cod_w+' '+mod+' '+reg_op+' '+r_m+' '+SS+Inx+Bas+displacment
    if types[0] == 'imm':
        if opration == 'ret':
            res = opcode + immediate_to_binary(oprands[0],16)
        if opration in ['jmp','call']:
            res = opcode + '0'*32
        if opration == 'jcc':
            res = opcode +conditions_dict[condition]+ '0'*32
if len(oprands) == 0:
    res = opration_dict[opration]
if need_rex:
    res = '0100 '+rex_w+' '+R+' '+X+' '+B+' '+res
if prefix_66 or len(types) >= 1 and oprand_size(oprands[0],types[0]) == 16: # prefix 66
    res = '01100110 ' + res
if (len(types) >= 1 and types[0] == 'mem' and any([(i in oprands[0]) for i in reg32_list])) or (len(types) == 2 and types[1] == 'mem' and any([(i in oprands[1]) for i in reg32_list])): # prefix 67
    res = '01100111 ' + res
print("Machine code in hex:\n%s"%(binary_to_hex(res)))