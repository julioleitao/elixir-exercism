import re

def abbreviate(words):
  letters = []

  for word in words.replace('-', ' ').split():
    letters.append(_first_alpha(word))

  return ''.join(letters).upper()


def _first_alpha(word):
  for letter in word:
    if letter.isalpha():
      return letter
