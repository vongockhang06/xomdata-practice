# Xom Data · Remove duplicate names from the invite list
# Problem: https://xomdata.com/practice/py-unique-order
# Solved: 2026-08-16

def unique(items):
    res=[]
    for i in items:
        if i not in res:
            res.append(i)
    return res
