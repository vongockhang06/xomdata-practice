# Xom Data · Voting winner
# Problem: https://xomdata.com/practice/py-vote-winner
# Solved: 2026-08-25

from collections import Counter
def vote_winner(votes):
    temp = dict(Counter(votes))
    return list(temp.keys())[0]
