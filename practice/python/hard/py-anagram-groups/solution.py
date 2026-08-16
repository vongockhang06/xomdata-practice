# Xom Data · Group anagrams
# Problem: https://xomdata.com/practice/py-anagram-groups
# Solved: 2026-08-16

from collections import defaultdict
def group_anagrams(words):
    d = defaultdict(list)
    for w in words:
        key = str(sorted(w))
        d[key].append(w)
    return [i for i in d.values()]
