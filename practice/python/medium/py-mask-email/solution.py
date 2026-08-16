# Xom Data · Mask emails in the log
# Problem: https://xomdata.com/practice/py-mask-email
# Solved: 2026-08-16

def mask_email(email):
    size=len(email)
    pos=email.find('@')
    if pos <=2:
        return email
    return email[0:2] + '*'*(size-2-(size-pos)) +email[pos::]
