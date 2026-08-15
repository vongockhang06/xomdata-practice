# Xom Data · Boxes needed to pack the goods
# Problem: https://xomdata.com/practice/py-boxes-needed
# Solved: 2026-08-15

from math import ceil
def boxes_needed(items, capacity):
    return ceil(items/capacity)
