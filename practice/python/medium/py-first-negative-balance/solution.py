# Xom Data · First day the balance goes negative
# Problem: https://xomdata.com/practice/py-first-negative-balance
# Solved: 2026-08-27

def first_negative_day(changes):
    s=0
    for index,i in enumerate(changes):
        s+=i
        if s<0:
            return index
    return -1
