# Xom Data · Reward milestones below a cap
# Problem: https://xomdata.com/practice/py-multiples-under
# Solved: 2026-08-15

from math import ceil
def multiples_under(k, n):
    limit = ceil(n/k-1)
    return [k*i for i in range(1,limit+1)]
