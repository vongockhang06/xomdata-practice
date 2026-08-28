# Xom Data · Spiral matrix
# Problem: https://xomdata.com/practice/py-spiral-order
# Solved: 2026-08-28

def spiral_order(matrix):
    if not matrix:
        return []
    res=[]
    row = len(matrix)
    col = len(matrix[0])
    top,bot=0,row-1
    l,r=0,col-1
    while top<=bot and l<=r:
        #1: from left to right on the top row
        for i in range(l,r+1):
            res.append(matrix[top][i])
        top+=1

        #2: from top to bottom on right col
        for i in range(top,bot+1):
            res.append(matrix[i][r])
        r-=1

        if top<=bot:
        #3: from right to left on bottom row
            for i in range(r,l-1,-1):
                res.append(matrix[bot][i])
            bot-=1

        if l<=r:
        #4: from bottom to top on left col
            for i in range(bot,top-1,-1):
                res.append(matrix[i][l])
            l+=1
    return res
