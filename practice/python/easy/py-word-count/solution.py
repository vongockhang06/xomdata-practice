# Xom Data · Count words in a paragraph
# Problem: https://xomdata.com/practice/py-word-count
# Solved: 2026-08-16

def count_words(sentence):
    return len(sentence.split()) if sentence else 0
