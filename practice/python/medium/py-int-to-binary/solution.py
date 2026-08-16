# Xom Data · Convert a number to binary
# Problem: https://xomdata.com/practice/py-int-to-binary
# Solved: 2026-08-16

def to_binary(number):
    if not number:
        return '0'
    res=''
    while number!=0:
        res= str(number%2)+res
        number=number//2
    return res
