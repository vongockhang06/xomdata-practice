# Xom Data · String compression
# Problem: https://xomdata.com/practice/py-run-length
# Solved: 2026-08-26

def run_length_encode(text):
    size = len(text)
    if not text:
        return ''
    if size==1:
        return text+'1'
    count=1
    prev_char=text[0]
    curr_char=text[1]
    res=''
    for i in range(1,size):
        curr_char=text[i]
        if curr_char==prev_char:
            count+=1
        else:
            res=res+prev_char+str(count)
            count=1
        prev_char=curr_char
    res=res+prev_char+str(count)
    return res
