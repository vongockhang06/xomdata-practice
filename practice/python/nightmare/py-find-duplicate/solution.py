# Xom Data · Find the duplicate number
# Problem: https://xomdata.com/practice/py-find-duplicate
# Solved: 2026-09-15

def find_duplicate(numbers):
    size=len(numbers)-1
    return int(sum(numbers)-size*(size+1)/2)
