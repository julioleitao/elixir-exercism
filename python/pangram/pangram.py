begin = ord("a")
end = ord("z")

def is_pangram(sentence):
  mem = {}

  for letter in sentence.lower():
    ascii_value = ord(letter)
    if not ascii_value in mem and (ascii_value >= begin and ascii_value <= end):
      mem[ascii_value] = True
  
  return len(mem) == end - begin + 1
