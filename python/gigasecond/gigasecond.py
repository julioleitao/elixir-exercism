from datetime import datetime

GIGA_SECOND = 10 ** 9

def add(moment):
  time = GIGA_SECOND + moment.timestamp()
  return datetime.fromtimestamp(time)

