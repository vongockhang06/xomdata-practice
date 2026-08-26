# Xom Data · Normalize phone numbers
# Problem: https://xomdata.com/practice/py-normalize-phone
# Solved: 2026-08-26

def normalize(phone):
    return "".join([x for x in phone if x in '0123456789'])
