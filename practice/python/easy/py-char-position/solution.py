# Xom Data · First position of a character
# Problem: https://xomdata.com/practice/py-char-position
# Solved: 2026-08-15

def first_position(text, ch):
    for pos,c in enumerate(text):
        if c == ch:
            return pos
    return -1
