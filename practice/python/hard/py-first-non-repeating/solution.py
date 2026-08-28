# Xom Data · First unique character
# Problem: https://xomdata.com/practice/py-first-non-repeating
# Solved: 2026-08-28

from collections import Counter
def first_non_repeating(s):
    count=list(Counter(s).items())
    for char,fre in count:
        if fre==1:
            for index,c in enumerate(s):
                if c==char:
                    return index
    return -1
