# Xom Data · Moving average over a window of k
# Problem: https://xomdata.com/practice/py-moving-average
# Solved: 2026-08-26

def moving_average(numbers, k):
    size=len(numbers)
    if size<k:
        return []
    prefix = [0]*size
    prefix[0]=numbers[0]
    for i in range(1,size):
        prefix[i]=prefix[i-1]+numbers[i]
    res=[]
    for i in range(k-1,size):
        if i-k>=0:
            anw = (prefix[i]-prefix[i-k])/k
        if i==k-1:
            anw = prefix[i]/k
        res.append(round(anw,2))   
    return res
