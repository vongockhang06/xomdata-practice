# Xom Data · Mask phone number
# Problem: https://xomdata.com/practice/py-mask-phone
# Solved: 2026-08-15

def mask_phone(phone):
    return phone if len(phone)<=3 else (len(phone)-3)*'*'+phone[-3:]
