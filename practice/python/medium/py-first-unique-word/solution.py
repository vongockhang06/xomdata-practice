# Xom Data · First non-repeating word in a paragraph
# Problem: https://xomdata.com/practice/py-first-unique-word
# Solved: 2026-08-27

from collections import Counter
def first_unique(text):
    if not text.strip():
        return None
    original_list = text.split()
    count = list(dict(Counter(text.lower().split())).items())
    if count[-1][1]>1:
        return None
    word=''
    for w, c in count:
        if c==1:
            word=w
            break
    for w in original_list:
        if w.lower()==word:
            return w
