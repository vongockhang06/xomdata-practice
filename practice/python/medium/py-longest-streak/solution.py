# Xom Data · Longest run of days hitting the target
# Problem: https://xomdata.com/practice/py-longest-streak
# Solved: 2026-08-16

def longest_streak(sales, target):
    count = 0
    m = 0
    flag = 0
    size = len(sales)
    
    for i in range(size):
        if sales[i] >= target and flag==1:
            count+=1
        elif sales[i] >= target and flag==0:
            count=1
            flag=1
        elif sales[i]<target:
            m=max(m,count)
            flag=0
            count=0
    m=max(m,count)
    return m
