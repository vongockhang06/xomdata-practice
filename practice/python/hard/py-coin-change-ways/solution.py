# Xom Data · Coin change II
# Problem: https://xomdata.com/practice/py-coin-change-ways
# Solved: 2026-08-16

def count_ways(coins, amount):
    if amount==0:
        return 1
    count = [0]*(amount+1)
    count[0]=1

    for c in coins:
        for money in range(1,amount+1):
            if money - c >=0:
                count[money]+=count[money-c]

    return count[amount]
