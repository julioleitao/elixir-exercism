def response(message_bob):
    message_bob = message_bob.strip()

    if message_bob.isupper() and message_bob.endswith("?"):
      return "Calm down, I know what I'm doing!"
    if message_bob.isupper():
      return "Whoa, chill out!"
    if message_bob.endswith("?"):
      return "Sure."
    if not message_bob:
      return "Fine. Be that way!"
    return "Whatever."
