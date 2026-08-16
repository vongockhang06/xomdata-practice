# Xom Data · Group products by category
# Problem: https://xomdata.com/practice/py-group-category
# Solved: 2026-08-16

from collections import defaultdict
def group_by_category(items):
    res= defaultdict(list)
    for name,cat in items:
        res[cat].append(name)
    return dict(res)
