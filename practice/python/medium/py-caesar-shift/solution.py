# Xom Data · Scramble a promo code with a letter shift
# Problem: https://xomdata.com/practice/py-caesar-shift
# Solved: 2026-08-16

def shift_code(text, shift):
    # alphabet ={0:'a',1:'b',2:'c',3:'d',4:'e',5:'f',6:'g',7:'h',8:'i',9:'j',10:'k',11:'l',12:'m',13:'n',14:'o',15:'p',16:'q',17:'r',18:'s',19:'t',20:'u',21:'v',22:'w',23:'x',24:'y',25:'z'}
    #a_pos = ord('a')
    z_pos = ord('z')
    res=''
    for char in text:
        if not char.isalpha():
            res=res+char
            continue
        pos_char = ord(char)
        new_pos = pos_char+shift
        while(new_pos>z_pos):
            new_pos-=26
        new_char = chr(new_pos)
        res=res+new_char
    return res
