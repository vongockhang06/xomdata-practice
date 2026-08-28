# Xom Data · Move zeroes
# Problem: https://xomdata.com/practice/py-move-zeros
# Solved: 2026-08-28

def move_zeros(numbers):
    pos=0
    for index,i in enumerate(numbers):
        if i!=0:
            numbers[index]=0
            numbers[pos]=i
            pos+=1
    return numbers
