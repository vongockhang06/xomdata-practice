# Xom Data · Class leaderboard
# Problem: https://xomdata.com/practice/py-sort-score-name
# Solved: 2026-08-26

def rank_students(records):
    return [x[0] for x in sorted(records,key=lambda x:(-x[1],x[0]))]
