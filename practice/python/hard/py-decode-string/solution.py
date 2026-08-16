# Xom Data · Decode string
# Problem: https://xomdata.com/practice/py-decode-string
# Solved: 2026-08-16

def decode(s):
    stack = []
    current_num = 0
    current_str = ""

    for char in s:
        if char.isdigit():
            # Xử lý số có nhiều chữ số (vd: "10")
            current_num = current_num * 10 + int(char)
        elif char == "[":
            # Lưu lại chuỗi và số lặp hiện tại vào stack
            stack.append((current_str, current_num))
            current_str = ""
            current_num = 0
        elif char == "]":
            # Lấy chuỗi trước đó và số lần lặp ra để nhân
            prev_str, num = stack.pop()
            current_str = prev_str + current_str * num
        else:
            current_str += char

    return current_str
