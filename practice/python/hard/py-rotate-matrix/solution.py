# Xom Data · Rotate image
# Problem: https://xomdata.com/practice/py-rotate-matrix
# Solved: 2026-08-28

def rotate_90(matrix):
    #rotate_90 clockwise = transpose+reverse
    #transpose matrix
    if not matrix:
        return []
    matrix = [ [row[col] for row in matrix]  for col in range(len(matrix[0]))]
    #reverse each row
    matrix =[row[::-1] for row in matrix]
    return matrix
