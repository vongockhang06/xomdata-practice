# Xom Data · Pair of items closest to the voucher limit
# Problem: https://xomdata.com/practice/py-pair-closest-target
# Solved: 2026-08-26

def closest_pair(prices, target):
    if len(prices)<2:
        return None
    prices.sort()
    l,r=0,len(prices)-1
    return_sum=prices[l]+prices[r]
    while l<r:
        current_sum=prices[l]+prices[r]
        if abs(return_sum-target) > abs(current_sum-target):
            return_sum=current_sum
        if abs(return_sum-target) == abs(current_sum-target) and return_sum!=current_sum:
            return_sum=min(current_sum,current_sum)

        if current_sum==target:
            return current_sum
        elif current_sum<target:
            l+=1
        else:
            r-=1
    return return_sum
