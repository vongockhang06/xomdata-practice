# Xom Data · Keep the branches that beat the target
# Problem: https://xomdata.com/practice/py-filter-dict-threshold
# Solved: 2026-08-15

def over_target(sales, target):
    return {k:v for k,v in sales.items() if v>target}
