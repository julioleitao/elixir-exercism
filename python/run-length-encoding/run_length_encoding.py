import re

pattern = r'(\d+)(\D)'
def decode(encoded_text):
  return re.sub(pattern, lambda m: int(m.group(1)) * m.group(2), encoded_text)

def encode(text):
  if not text:
    return text

  result, actual, count = "", text[0], 1
  for letter in text[1:]:
    if letter == actual:
      count += 1
    else:
      result += to_text(count, actual)
      actual, count = letter, 1

  result += to_text(count, actual)

  return result

def to_text(count, letter):
  if count == 1:
    return letter

  return str(count) + letter