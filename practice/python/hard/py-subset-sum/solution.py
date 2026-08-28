# Xom Data · Subset sum exists
# Problem: https://xomdata.com/practice/py-subset-sum
# Solved: 2026-08-28

def can_sum(numbers, target):
    if target==0:
        return True
    if not numbers:
        return False
    
    dp = (target+1)*[False]
    dp[0]=True
    for num in numbers:
        for i in range(target,num-1,-1):
            if dp[i-num]:
                dp[i]=True
        if dp[target]:
            return True
    return dp[target]
