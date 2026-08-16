# Xom Data · Longest word in a sentence
# Problem: https://xomdata.com/practice/py-longest-word
# Solved: 2026-08-16

def longest_word(sentence):
    return sorted(sentence.split(),key=len,reverse=True)[0]
