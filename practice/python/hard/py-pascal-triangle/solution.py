# Xom Data · Pascal's triangle
# Problem: https://xomdata.com/practice/py-pascal-triangle
# Solved: 2026-08-28

def helper(upper_row: list):
    size = len(upper_row)
    new_row=(size+1)*[0]
    new_row[0]=new_row[-1]=1
    pos=1
    for i in range(1,size):
        new_row[pos]=upper_row[i]+upper_row[i-1]
        pos+=1
    return new_row
def pascal(n):
    if n==0:
        return []
    elif n==1:
        return [[1]]

    res=[0]*n
    res[0]=[1]
    for i in range(1,n):
        res[i]=helper(res[i-1])
    return res
