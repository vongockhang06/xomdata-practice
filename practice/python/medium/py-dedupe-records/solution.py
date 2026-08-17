# Xom Data · Drop duplicates, keep the newest record
# Problem: https://xomdata.com/practice/py-dedupe-records
# Solved: 2026-08-17

from collections import defaultdict
def dedupe(rows, key):
    list_key= defaultdict(int)
    res = []
    for row in rows:
        k = row[key]
        if k not in list_key:
            res.append(row)
            list_key[k] = len(res)-1
        else:
            p = list_key[k]
            res[p] = row
    return res
