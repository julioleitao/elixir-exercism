def is_valid(isbn):
    isbn = isbn.replace("-", "")

    if len(isbn) != 10 or not isbn[:9].isdigit():
      return False

    total = get_verifier_digit(isbn[-1])
    if total == -1:
      return False

    for index, digit in enumerate(isbn[:9]):
      total += int(digit) * (10 - index)
    
    return total % 11 == 0


def get_verifier_digit(digit):
  if digit == "X":
    return 10
  elif digit.isdigit():
    return int(digit)
  else:
    return -1
  
