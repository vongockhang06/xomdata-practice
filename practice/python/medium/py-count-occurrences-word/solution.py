# Xom Data · Count word occurrences
# Problem: https://xomdata.com/practice/py-count-occurrences-word
# Solved: 2026-08-17

def count_word(text, target):
    l = text.lower().split()
    target = target.lower()
    return len([x for x in l if x==target])
