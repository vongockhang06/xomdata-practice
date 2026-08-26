# Xom Data · Check strong password
# Problem: https://xomdata.com/practice/py-password-strength
# Solved: 2026-08-26

def is_strong(password):
    size=len(password)
    if size<8:
        return False
    d = {'digit':0,'upper_char':0,'lower_char':0}
    for i in password:
        if 'A'<=i<='Z':
            d['upper_char']+=1
        elif 'a'<=i<='z':
            d['lower_char']+=1
        elif i.isdigit():
            d['digit']+=1
    return all(d.values())
