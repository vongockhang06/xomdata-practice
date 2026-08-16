# Xom Data · Order regions by total sales
# Problem: https://xomdata.com/practice/py-group-then-sort
# Solved: 2026-08-16

from collections import defaultdict
def sorted_by_group_total(sales):
    d = defaultdict(int)
    for area, sale in sales:
        d[area] =d[area]+sale
    return sorted(d,key=lambda x: [-d[x],x])
