# Xom Data · Distinct values per group
# Problem: https://xomdata.com/practice/py-distinct-per-group
# Solved: 2026-08-17

from collections import defaultdict
def distinct_per_group(pairs):
    temp =defaultdict(set)
    for group, val in pairs:
        temp[group].add(val)
    
    res =defaultdict(int)
    for key in temp:
        res[key] = len(temp[key])
    return dict(res)
