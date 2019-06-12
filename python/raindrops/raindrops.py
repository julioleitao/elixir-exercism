factors_messages = [(3, "Pling"), (5, "Plang"), (7, "Plong")]

def convert(number):
  has_factor = lambda number, factor: number % factor == 0
  messages = []

  for factor, message in factors_messages:
    if has_factor(number, factor):
      messages.append(message)

  if not messages:
    return str(number)
  
  return "".join(messages)
