import enum

class Category(enum.Enum):
  ONES = 1
  TWOS = 2
  THREES = 3
  FOURS = 4
  FIVES = 5
  SIXES = 6
  YACHT = 16 # ok
  FULL_HOUSE = 32
  FOUR_OF_A_KIND = 64
  LITTLE_STRAIGHT = 128
  BIG_STRAIGHT = 256
  CHOICE = 512


def score(dice, category):
  dice = sorted(dice)

  if category.value >= 1 and category.value <= 6:
    return dice.count(category.value) * category.value
  
  if category == Category.YACHT:
    return 50 if len(set(dice)) == 1 else 0

  if category == Category.CHOICE:
    return sum(dice)
  if category == Category.LITTLE_STRAIGHT:
    return 30 if dice == [1, 2, 3, 4, 5] else 0
  
  if category == Category.BIG_STRAIGHT:
    return 30 if dice == [2, 3, 4, 5, 6] else 0

  mem = group_by_values(dice)
  keys = list(mem.keys())

  if category == Category.FOUR_OF_A_KIND and len(keys) == 1:
    return sum(dice[:-1])

  if len(keys) == 2:
    values = sorted([mem[keys[0]], mem[keys[1]]], key=len)
    first_len, second_len = len(values[0]), len(values[1])

    if category == Category.FULL_HOUSE and sorted([first_len, second_len]) == [2, 3]:
      return sum(dice)

    if category == Category.FOUR_OF_A_KIND and sorted([first_len, second_len]) == [1, 4]:
      return sum(values[1])

  return 0

def group_by_values(enumerable):
  mem = {}

  for value in enumerable:
    if not value in mem:
      mem[value] = []
    mem[value].append(value)

  return mem