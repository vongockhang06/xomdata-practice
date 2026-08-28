# Xom Data · Two sum
# Problem: https://xomdata.com/practice/py-two-sum-indices
# Solved: 2026-08-28

def two_sum(numbers, target):
    if not numbers:
        return []
    d={}
    for pos,num in enumerate(numbers):
        if target-num in d:
            return [d[target-num],pos]
        d[num]=pos
    return []
