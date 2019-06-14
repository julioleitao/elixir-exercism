import re

_ignored = r'[.:_,!@$%^&]'

def count_words(sentence):
  count = {}

  for word in _sentence_words(sentence):
    if not word in count:
      count[word] = 0
    count[word] += 1

  return count

def _sentence_words(sentence):
  words = re.sub(_ignored, " ", sentence).lower().split()

  quote = "'"
  _double_quoted = (lambda word: word[1:-1] if word.startswith(quote) and word.endswith(quote) else word)

  return list(map(_double_quoted, words))
