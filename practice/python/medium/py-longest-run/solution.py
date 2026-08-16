# Xom Data · Longest continuous increasing subsequence
# Problem: https://xomdata.com/practice/py-longest-run
# Solved: 2026-08-16

def longest_increasing_run(numbers):
    count=1
    m=1
    size = len(numbers)
    if size==0:
        return 0
    for i in range(1,size):
        if numbers[i]>numbers[i-1]:
            count+=1
        else:
            m=max(count,m)
            count=1
    m=max(count,m)
    return m
