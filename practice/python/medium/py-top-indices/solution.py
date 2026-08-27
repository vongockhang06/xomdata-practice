# Xom Data · Positions of the highest readings
# Problem: https://xomdata.com/practice/py-top-indices
# Solved: 2026-08-27

def top_indices(values, n):
    temp=[]
    for index, element in enumerate(values):
        temp.append((element,index))
    return [x[1] for x in sorted(temp,key=lambda x:-x[0])][:n]
