# Xom Data · Build a record lookup table by key
# Problem: https://xomdata.com/practice/py-index-records
# Solved: 2026-08-16

from collections import defaultdict
def index_by(rows, key):
    res = defaultdict(dict)
    for rec in rows:
        res[rec[key]]=rec
    return dict(res)
