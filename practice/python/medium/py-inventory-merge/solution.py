# Xom Data · Consolidate inventory across warehouses
# Problem: https://xomdata.com/practice/py-inventory-merge
# Solved: 2026-08-16

from collections import defaultdict
def merge_inventory(warehouses):
    d = defaultdict(int)
    for record in warehouses:
        for k,v in record.items():
            d[k]+=v
    return dict(d)
