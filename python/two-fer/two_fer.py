def two_fer(name = None):
  if not name:
    return "One for you, one for me."
  
  return "One for {}, one for me.".format(name)

