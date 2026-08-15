# Xom Data · Completion rate of a delivery team
# Problem: https://xomdata.com/practice/py-completion-rate
# Solved: 2026-08-15

def completion_rate(done, total):
    return 0.0 if total==0 else round(done/total*100,2)
