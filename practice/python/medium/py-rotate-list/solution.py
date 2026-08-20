# Xom Data · Rotate list to the right
# Problem: https://xomdata.com/practice/py-rotate-list
# Solved: 2026-08-20

def rotate(items, k):
    size = len(items)
    new = items[size-k:]
    new.extend(items[:size-k])
    return new
