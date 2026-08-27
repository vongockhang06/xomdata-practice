# Xom Data · Best k-day window by total
# Problem: https://xomdata.com/practice/py-window-max-sum
# Solved: 2026-08-27

def best_window(values, k):
    size= len(values)
    if size<k:
        return None
    res = sum(values[:k])
    curr_sum=res
    l=1
    r=k
    while r<size:
        new_sum = curr_sum + values[r] - values[l-1]
        res = max(new_sum,curr_sum)
        l+=1
        r+=1
        curr_sum=new_sum
    return res
