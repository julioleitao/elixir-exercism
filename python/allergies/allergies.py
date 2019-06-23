_allergies = [("cats", 128), 
    ("pollen", 64), 
    ("chocolate", 32), 
    ("tomatoes", 16), 
    ("strawberries", 8), 
    ("shellfish", 4), 
    ("peanuts", 2), 
    ("eggs", 1)]

class Allergies(object):

    def __init__(self, score):
        self.score = score
        self.allergies = [name for name, value in _allergies if score & value]

    def allergic_to(self, item):
        return item in self.allergies

    @property
    def lst(self):
        return self.allergies
