class Garden(object):
    _default_students = "Alice Bob Charlie David Eve Fred Ginny  Harriet Ileana Joseph Kincaid Larry".split()

    def __init__(self, diagram, students=[]):
        self._rows = _cast_rows(diagram)
        self.students = sorted(students) if students != [] else self._default_students
        self._flowers_per_student = {}
        
        for i in range(len(self._rows)):
            flowers = ''.join(self._rows[i])
            self._flowers_per_student[self.students[i]] = _flower_translate(flowers)

    def plants(self, student_name):
        return self._flowers_per_student[student_name]


def _cast_rows(diagram):
    rows = []

    lines = list(map(lambda row: _split_size(row, 2), diagram.split("\n")))

    for i in range(len(lines[0])):
        rows.append(lines[0][i] + lines[1][i])

    return rows


_flowers = {
        'V': 'Violets',
        'R': 'Radishes',
        'C': 'Clover',
        'G': 'Grass'
}
def _flower_translate(flowers):
    flowers_names = []

    for flower in flowers:
        flowers_names.append(_flowers[flower])

    return flowers_names


def _split_size(string, size):
    splited = []

    for index in range(0, len(string), size):
        splited.append(string[index:index + size])

    return splited
