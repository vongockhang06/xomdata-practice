# Xom Data · Did the whole team clear the first round
# Problem: https://xomdata.com/practice/py-all-passed
# Solved: 2026-08-16

def all_passed(scores, pass_mark):
    return len(scores)==len([x for x in scores if x>=pass_mark])
