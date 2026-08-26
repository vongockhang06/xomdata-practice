# Xom Data · Order tags by length then alphabetically
# Problem: https://xomdata.com/practice/py-sort-length-alpha
# Solved: 2026-08-26

def order_tags(tags):
    return sorted(tags,key=lambda x:(len(x),x))
