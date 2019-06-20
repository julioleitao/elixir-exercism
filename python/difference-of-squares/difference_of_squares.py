def n_natural_numbers(number):
  return range(1, number + 1)

def square_of_sum(number):
  return sum(n_natural_numbers(number)) ** 2

def sum_of_squares(number):
  return sum(map(lambda n: n ** 2, n_natural_numbers(number)))

def difference_of_squares(number):
  return square_of_sum(number) - sum_of_squares(number)