# Xom Data · Min cost climbing stairs
# Problem: https://xomdata.com/practice/py-min-cost-climbing
# Solved: 2026-09-16

def min_cost(cost):
    size=len(cost)
    if size<=1:
        return 0
    res=0
    dp = [0]*(size)
    dp[0],dp[1]=cost[0],cost[1]
    for i in range(2,size):
        dp[i]=min(dp[i-1],dp[i-2])+cost[i]
    return min(dp[size-1],dp[size-2])
