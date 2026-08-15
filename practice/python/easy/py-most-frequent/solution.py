# Xom Data · Most frequent character
# Problem: https://xomdata.com/practice/py-most-frequent
# Solved: 2026-08-15

from collections import Counter
def most_frequent(text):
    return Counter(text).most_common(1)[0][0]
