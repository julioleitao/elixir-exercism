def is_isogram(string):
  mem = {}

  for letter in string.lower():
    if not letter in " -" and letter in mem:
        return False
    mem[letter] = True

  return True