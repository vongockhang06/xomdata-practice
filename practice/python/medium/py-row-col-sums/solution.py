# Xom Data · Row totals and column totals of a table
# Problem: https://xomdata.com/practice/py-row-col-sums
# Solved: 2026-08-26

def row_col_sums(table):
    if not table:
        return ([],[])
    by_branch=[]
    by_month=[]
    for i in table:
        by_branch.append(sum(i))
    
    by_month_table = [ [row[col] for row in table]  for col in range(len(table[0]))]
    for i in by_month_table:
        by_month.append(sum(i))
    return (by_branch,by_month)
