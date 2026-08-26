# Xom Data · Pick the columns to export from a record table
# Problem: https://xomdata.com/practice/py-select-columns
# Solved: 2026-08-26

def select_columns(rows, columns):
    if not rows:
        return []
    res=[]
    for row in rows:
        temp={}
        for col in columns:
            if col in row:
                temp.update({col:row[col]})
        res.append(temp)
    return res
