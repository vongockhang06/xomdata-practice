# Xom Data · Build an order code from its parts
# Problem: https://xomdata.com/practice/py-join-parts
# Solved: 2026-08-15

def build_code(parts):
    return "-".join(parts) if parts else ''
