# Xom Data · Assign ranks with ties to runners
# Problem: https://xomdata.com/practice/py-competition-rank
# Solved: 2026-08-17

def ranks(scores):
    if not scores:
        return []
    size = len(scores)
    temp = [(x,index) for index, x in enumerate(scores)]
    temp.sort(key=lambda x:x[0],reverse=True)
    rank = 1
    res=[0]*size
    for i in range(size):
        if temp[i][0] == temp[i-1][0] and i!=0:
            rank = rank
        else:
            rank = i+1
        original_pos = temp[i][1]
        res[original_pos] = rank

    return res
