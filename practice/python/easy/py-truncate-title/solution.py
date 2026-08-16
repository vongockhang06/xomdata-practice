# Xom Data · Shorten an over-long title on an article card
# Problem: https://xomdata.com/practice/py-truncate-title
# Solved: 2026-08-16

def shorten(text, limit):
    return text if len(text)<=limit else text[:limit] + '...'
