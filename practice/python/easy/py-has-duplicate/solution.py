# Xom Data · Spot a code entered twice
# Problem: https://xomdata.com/practice/py-has-duplicate
# Solved: 2026-08-15

def has_duplicate(items):
    return not len(items)==len(set(items))
