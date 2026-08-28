# Xom Data · Maximum subarray sum
# Problem: https://xomdata.com/practice/py-max-subarray
# Solved: 2026-08-28

def max_subarray(numbers):
    res=numbers[0]
    curr=numbers[0]
    size=len(numbers)
    for i in range(1,size):
        curr=max(numbers[i],curr+numbers[i])
        res=max(curr,res)
    return res
