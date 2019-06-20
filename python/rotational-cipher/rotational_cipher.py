def rotate(text, key):
  return ''.join(encrypt_list(list(text), key))


def encrypt_list(text_list, key):
  return map(lambda char: encrypt_char(char, key), text_list)


def encrypt_char(char, key):
  if not char.isalpha():
    return char

  return chr(shift_value(ord(char), key))


_LOWER_START = ord('a')
_UPPER_START = ord('A')
def begin_at(value):
  return _LOWER_START if value >= _LOWER_START else _UPPER_START


def shift_value(value, key):
  begin = begin_at(value)
  return ((value - begin + key) % 26) + begin