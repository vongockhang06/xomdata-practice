# Xom Data · Count occurrences of a code
# Problem: https://xomdata.com/practice/py-count-value
# Solved: 2026-08-15

def count_value(items, target):
    return len([x for x in items if x==target])
