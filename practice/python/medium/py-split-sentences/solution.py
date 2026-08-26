# Xom Data · Split a paragraph into sentences
# Problem: https://xomdata.com/practice/py-split-sentences
# Solved: 2026-08-26

def split_sentences(text):
    text=text.strip()
    size= len(text)
    if not text:
        return []
    temp=text[0]
    for i in range(1,size):
        char = text[i]
        prev_char = text[i-1]
        if char==' ' and prev_char in '.!?':
            char='###'
        temp=temp+char
    return [x.strip() for x in temp.split('###')]
