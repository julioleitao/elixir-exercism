def find_anagrams(word, candidates):
  word = word.lower()
  word, candidates = sorted(word), _different_words(word, candidates)

  return list(filter(lambda c: _is_anagram(word, c), candidates))

def _different_words(word, candidates):
  return filter(lambda c: c.lower() != word, candidates)

def _is_anagram(word, candidate):
  return word == sorted(candidate.lower())