points = """
A, E, I, O, U, L, N, R, S, T       :1
D, G                               :2
B, C, M, P                         :3
F, H, V, W, Y                      :4
K                                  :5
J, X                               :8
Q, Z                               :10
"""
"""
mem = {}

for line in points.split("\n"):
  if not line:
    continue

  line = line.split(":")
  value = int(line[1])

  for letter in line[0].split(","):
    mem[letter.strip()] = value
"""
# see the code bellow
mem = {'A': 1, 'C': 3, 'B': 3, 'E': 1, 'D': 2, 'G': 2, 'F': 4, 'I': 1, 'H': 4, 'K': 5, 'J': 8, 'M': 3, 'L': 1, 'O': 1, 'N': 1, 'Q': 10, 'P': 3, 'S': 1, 'R': 1, 'U': 1, 'T': 1, 'W': 4, 'V': 4, 'Y': 4, 'X': 8, 'Z': 10}

def score(word):
  count = 0
  for letter in word:
    count += mem[letter.upper()]

  return count

