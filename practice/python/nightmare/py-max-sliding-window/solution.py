# Xom Data · Sliding window maximum
# Problem: https://xomdata.com/practice/py-max-sliding-window
# Solved: 2026-09-15

def find_max(numbers,i,j):
    n=numbers[i]
    p=i
    for pos in range(i,j+1):
        if numbers[pos]>=n:
            n=numbers[pos]
            p=pos
    return n,p 
def max_sliding_window(numbers, k):
    if not numbers:
        return []
    size=len(numbers)
    res=[]
    p=-1
    n=numbers[0]
    for i in range(size-k+1):
        if p<i:
            n,p=find_max(numbers,i,i+k-1)
        else:
            if numbers[i+k-1]>=n:
                n=numbers[i+k-1]
                p=i+k-1
        res.append(n)
    return res
