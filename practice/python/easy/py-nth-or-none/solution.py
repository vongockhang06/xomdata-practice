# Xom Data · Take row n if it exists
# Problem: https://xomdata.com/practice/py-nth-or-none
# Solved: 2026-08-15

def nth_or_none(items, n):
    return None if n>=len(items) else items[n]
