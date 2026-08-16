# Xom Data · Climbing stairs
# Problem: https://xomdata.com/practice/py-climb-stairs
# Solved: 2026-08-16

def climb_stairs(n):
    if n<=1:
        return 1
    count = [0]*(n+1)
    count[0]=1
    count[1]=1
    for i in range(2,n+1):
        count[i]=count[i-1]+count[i-2]
    return count[n]
