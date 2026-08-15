# Xom Data · Remove a code from the scan list
# Problem: https://xomdata.com/practice/py-drop-value
# Solved: 2026-08-15

def drop_value(items, target):
    return [x for x in items if x!=target]
