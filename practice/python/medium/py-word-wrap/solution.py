# Xom Data · Wrap a description for a narrow box
# Problem: https://xomdata.com/practice/py-word-wrap
# Solved: 2026-08-27

def wrap_text(text, width):
    words = text.split()
    if not words:
        return []
    
    res = []
    current_line = []
    current_length = 0
    
    for word in words:
        # Nếu dòng hiện tại rỗng, bắt buộc thêm từ vào
        if not current_line:
            current_line.append(word)
            current_length = len(word)
        # Nếu độ dài dòng hiện tại + khoảng trắng + độ dài từ mới <= width
        elif current_length + 1 + len(word) <= width:
            current_line.append(word)
            current_length += 1 + len(word)
        # Nếu vượt quá width, ngắt dòng hiện tại và bắt đầu dòng mới
        else:
            res.append(" ".join(current_line))
            current_line = [word]
            current_length = len(word)
            
    if current_line:
        res.append(" ".join(current_line))
        
    return res
