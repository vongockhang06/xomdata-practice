# Xom Data · Pull a sensor reading back into range
# Problem: https://xomdata.com/practice/py-clamp-value
# Solved: 2026-08-15

def clamp(value, low, high):
    if value<low:
        value=low
    elif value>high:
        value=high
    return value
