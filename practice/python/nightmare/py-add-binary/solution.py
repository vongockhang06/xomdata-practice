# Xom Data · Add binary
# Problem: https://xomdata.com/practice/py-add-binary
# Solved: 2026-10-06

def add_binary(a, b):
    sizea=len(a)
    sizeb=len(b)
    pos=car=0
    a=a[::-1]
    b=b[::-1]
    res=(sizea+1)*['0'] if sizea>=sizeb else (sizeb+1)*['0']
    while pos<sizea and pos<sizeb:
        num1=int(a[pos])
        num2=int(b[pos])
        res[pos]=str((num1+num2+car)%2)
        car=1 if num1+num2+car>1 else 0
        pos+=1
    while pos<sizea:
        num1=int(a[pos])
        res[pos]=str((num1+car)%2)
        car=1 if num1+car>1 else 0
        pos+=1

    while pos<sizeb:
        num1=int(b[pos])
        res[pos]=str((num1+car)%2)
        car=1 if num1+car>1 else 0
        pos+=1
    
    if car==1:
        res[-1]='1'
        car=0
    
    return "".join(res[::-1]) if res[-1]=='1' else "".join(res[::-1][1:])
