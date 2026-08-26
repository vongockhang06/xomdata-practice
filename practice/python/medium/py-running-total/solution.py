# Xom Data · Cumulative total by day
# Problem: https://xomdata.com/practice/py-running-total
# Solved: 2026-08-26

def running_total(numbers):
    if not numbers:
        return numbers
    size=len(numbers)
    prefix_sum=[0]*size
    prefix_sum[0]=numbers[0]
    for i in range(1,size):
        prefix_sum[i]=prefix_sum[i-1]+numbers[i]
    return prefix_sum
