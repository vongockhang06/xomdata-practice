# Xom Data · Longest common prefix
# Problem: https://xomdata.com/practice/py-longest-common-prefix
# Solved: 2026-08-28

def find_common_prefix(a:str,b:str)->str:
    prefix=''
    apointer=bpointer=0
    while apointer<len(a) and bpointer<len(b) and a[apointer]==b[bpointer]:
        prefix+=a[apointer]
        apointer+=1
        bpointer+=1
    return prefix
def longest_common_prefix(words):
    if not words:
        return ''
    size = len(words)
    if size==1:
        return words[0]
    common_prefix=find_common_prefix(words[0],words[1])
    print(common_prefix)
    for i in range(2,size):
        common_prefix=find_common_prefix(common_prefix,words[i])
    return common_prefix
