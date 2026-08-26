# Xom Data · Rename a field across every record
# Problem: https://xomdata.com/practice/py-rename-key
# Solved: 2026-08-26

def swap_key(a:dict,old,new):
    new_dict={}
    for key,val in a.items():
        if key==old:
            new_dict.update({new:val})
        else:
            new_dict.update({key:val})
    return new_dict
def rename_key(rows, old, new):
    res=[]
    if not rows:
        return []
    for row in rows:
        if old in row.keys():
            row[new]=row[old]
            row=swap_key(row,old,new)
        res.append(row)
    return res
