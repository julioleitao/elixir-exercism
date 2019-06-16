class Student:
    def __init__(self, name, grade):
        self.name = name
        self.grade = grade

    def __lt__(self, other):
        if self.grade != other.grade:
            return self.grade < other.grade
        return self.name < other.name

class School(object):
    def __init__(self):
        self._students = []

    def add_student(self, name, grade):
        self._students.append(Student(name, grade))
        self._students.sort()

    def roster(self):
        return list(map(lambda student: student.name, self._students))

    def grade(self, grade_number):
        filtered_by_grade = filter(lambda student: student.grade == grade_number, self._students)

        return list(map(lambda student: student.name, filtered_by_grade))
