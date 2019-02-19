defmodule StringSeries do
  @doc """
  Given a string `s` and a positive integer `size`, return all substrings
  of that size. If `size` is greater than the length of `s`, or less than 1,
  return an empty list.
  """
  @spec slices(s :: String.t(), size :: integer) :: list(String.t())
  def slices(text, size)

  def slices(text, n) when n <= 0, do: []

  def slices(text, size) do
    text
    |> String.codepoints
    |> to_chunk(size - 1)
  end

  def to_chunk([], _), do: []

  def to_chunk([_ | tail], size)
    when length(tail) < size, do: []

  def to_chunk([head | tail], size) do
    part = Enum.take(tail, size)

    ["#{head}#{Enum.join(part)}" | to_chunk(tail, size)]
  end
end
