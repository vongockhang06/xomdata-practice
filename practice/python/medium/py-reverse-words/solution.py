# Xom Data · Reverse words in a string
# Problem: https://xomdata.com/practice/py-reverse-words
# Solved: 2026-08-26

def reverse_words(sentence):
    if not sentence:
        return ""
    temp = sentence.split()
    temp = temp[::-1]
    return " ".join(temp)
