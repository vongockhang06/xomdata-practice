# Xom Data · Join two columns into a lookup table
# Problem: https://xomdata.com/practice/py-zip-to-dict
# Solved: 2026-08-16

from collections import defaultdict
def to_dict(keys, values):
    d = defaultdict(int)
    for k,v in zip(keys,values):
        d[k]=v
    return dict(d)
