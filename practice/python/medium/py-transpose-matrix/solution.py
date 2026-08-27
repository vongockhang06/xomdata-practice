# Xom Data · Turn a table's rows into columns
# Problem: https://xomdata.com/practice/py-transpose-matrix
# Solved: 2026-08-27

def transpose(table):
    if not table:
        return []
    return [[row[col] for row in table]  for col in range(len(table[0])) ]
