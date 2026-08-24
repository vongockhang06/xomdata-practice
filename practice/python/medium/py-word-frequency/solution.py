# Xom Data · Word frequency count in text
# Problem: https://xomdata.com/practice/py-word-frequency
# Solved: 2026-08-24

from collections import defaultdict
def word_frequency(text):
    if not text:
        return {}
    d = defaultdict(int)
    for i in text.strip().split():
        d[i]=d[i]+1
    return dict(d)
