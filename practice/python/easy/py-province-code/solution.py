# Xom Data · Take the province code off a file reference
# Problem: https://xomdata.com/practice/py-province-code
# Solved: 2026-08-15

def province_code(code):
    return code if len(code)<=3 else code[:3]
