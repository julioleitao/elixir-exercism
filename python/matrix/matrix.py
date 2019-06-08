class Matrix(object):
    def __init__(self, matrix_string):
        self.data = list(map(__row_to_int__, matrix_string.split("\n")))
 
    def row(self, index):
        return self.data[index - 1]

    def column(self, index):
        column = []
        for row in self.data:
            column.append(row[index - 1])

        return column

def __row_to_int__(row):
    return list(map(int, row.split()))
