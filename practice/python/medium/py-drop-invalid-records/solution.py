# Xom Data · Drop records missing a required field
# Problem: https://xomdata.com/practice/py-drop-invalid-records
# Solved: 2026-08-17

def keep_valid(rows, required):
    if not required:
        return rows
    res = []
    for row in rows:
        flag = 1 
        for require in required:
            temp="hold"
            if require not in row or row[require] is None:
                flag=0
                break
            if type(row[require]) ==str:
                temp = row[require].strip()
            if not temp:
                flag=0
                break
        if flag==1:
            res.append(row)
    return res
