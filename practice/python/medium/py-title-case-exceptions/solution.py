# Xom Data · Capitalise a book title the publisher's way
# Problem: https://xomdata.com/practice/py-title-case-exceptions
# Solved: 2026-08-27

def book_title(text):
    linkind_word = ['of', 'and','the','in','on']
    l = text.strip().split()
    for index,word in enumerate(l):
        if word in linkind_word and index!=0:
            continue
        l[index] = word[0].upper() + word[1:]
    return " ".join(l)
