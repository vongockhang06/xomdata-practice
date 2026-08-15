# Xom Data · Average score by subject
# Problem: https://xomdata.com/practice/py-average
# Solved: 2026-08-15

def average_score(scores):
    if len(scores)==0:
        return 0
    return sum(scores)/len(scores)
