# Xom Data · First missing positive
# Problem: https://xomdata.com/practice/py-first-missing-positive
# Solved: 2026-09-15

def first_missing(nums):
    if not nums:
        return 1
    d = {}
    target=1
    for i in nums:
        if i >0:
            d[i]=1
    while d.get(target)!=None:
        target+=1
    return target
