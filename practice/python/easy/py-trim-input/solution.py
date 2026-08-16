# Xom Data · Clean up stray spaces in a list of names
# Problem: https://xomdata.com/practice/py-trim-input
# Solved: 2026-08-16

def clean_names(raw_list):
    return [w.strip() for w in raw_list]
