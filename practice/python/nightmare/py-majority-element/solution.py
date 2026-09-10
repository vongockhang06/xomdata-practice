# Xom Data · Majority element
# Problem: https://xomdata.com/practice/py-majority-element
# Solved: 2026-09-10

from collections import Counter
def majority(numbers):
    d = dict(Counter(numbers))
    size=len(numbers)
    freq=size//2
    for value,f in d.items():
        if f>freq:
            return value
    return None
