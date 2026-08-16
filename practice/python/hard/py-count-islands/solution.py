# Xom Data · Number of islands
# Problem: https://xomdata.com/practice/py-count-islands
# Solved: 2026-08-16

def helper(grid,row,col):
    
    if 0<=row<len(grid) and 0<=col<len(grid[0]) and grid[row][col]==1:
        grid[row][col]=0
    else:
        return
    helper(grid,row-1,col)
    helper(grid,row+1,col)
    helper(grid,row,col-1)
    helper(grid,row,col+1)
def count_islands(grid):
    count=0
    for i in range(len(grid)):
        for j in range(len(grid[0])):
            if grid[i][j]==1:
                helper(grid,i,j)
                count+=1
    return count
