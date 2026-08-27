# Xom Data · Fill in a default for a missing field
# Problem: https://xomdata.com/practice/py-fill-missing
# Solved: 2026-08-27

def fill_missing(rows, field, default):
    if not rows:
        return []

    res=[]
    for row in rows:
        if field in row:
            res.append(row)
        else:
            row[field]=default
            res.append(row)
    return res
