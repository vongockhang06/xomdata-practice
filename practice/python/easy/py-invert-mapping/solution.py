# Xom Data · Flip a code-to-name lookup table
# Problem: https://xomdata.com/practice/py-invert-mapping
# Solved: 2026-08-15


def invert(mapping):
    return {v:k for k,v in mapping.items()}
