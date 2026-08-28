# Xom Data · Sentence segmentation with a dictionary
# Problem: https://xomdata.com/practice/py-word-break
# Solved: 2026-08-28

def word_break(s, words):
    use_len=0
    for word in words:
        use_len+=s.count(word) * len(word)
    if use_len==len(s):
        return True
    return False
