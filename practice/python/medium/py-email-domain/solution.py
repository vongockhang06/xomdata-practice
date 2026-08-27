# Xom Data · Extract domain from email
# Problem: https://xomdata.com/practice/py-email-domain
# Solved: 2026-08-27

def get_domain(email):
    res=''
    for i in email[::-1]:
        if i=='@':
            break
        res= i+res
    return res
