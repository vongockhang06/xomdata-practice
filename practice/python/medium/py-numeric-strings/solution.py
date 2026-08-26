# Xom Data · Turn a text column into usable numbers
# Problem: https://xomdata.com/practice/py-numeric-strings
# Solved: 2026-08-26

def to_numbers(values):
    res=[]
    for i in values:
        temp = i.strip().replace(',','')
        if temp:
            negative = temp[0]
        temp=temp.replace('-','')
        if not temp or not temp.isdigit():
            temp='0'
            negative=''
        temp=int(temp)
        if negative=='-':
            temp=-temp
        res.append(temp)
    return res
