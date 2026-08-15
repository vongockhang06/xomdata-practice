# Xom Data · Find names too long for the card
# Problem: https://xomdata.com/practice/py-filter-long-names
# Solved: 2026-08-15

def long_names(names, min_len):
    return [x for x in names if len(x)>min_len]
