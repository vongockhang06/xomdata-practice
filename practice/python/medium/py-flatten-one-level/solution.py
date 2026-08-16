# Xom Data · Flatten grouped results by one level
# Problem: https://xomdata.com/practice/py-flatten-one-level
# Solved: 2026-08-16

def flatten(groups):
    res=[]
    for i in groups:
        res.extend(i)
    return res
