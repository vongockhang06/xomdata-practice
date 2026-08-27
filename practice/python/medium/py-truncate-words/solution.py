# Xom Data · Shorten a description by word count
# Problem: https://xomdata.com/practice/py-truncate-words
# Solved: 2026-08-27

def first_words(text, limit):
    word_list=text.split()
    size = len(word_list)
    if limit>=size:
        return text
    res=''
    for i in range(limit):
        res+=word_list[i]
        if i!=(limit-1):
            res+=' '
    res+='...'
    return res
