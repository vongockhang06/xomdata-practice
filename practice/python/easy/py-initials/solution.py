# Xom Data · Generate initials
# Problem: https://xomdata.com/practice/py-initials
# Solved: 2026-08-15

def get_initials(full_name):
    return "".join([x[0].upper() for x in full_name.split()])
