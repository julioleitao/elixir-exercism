defmodule FlattenArray do
  @doc """
    Accept a list and return the list flattened without nil values.

    ## Examples

      iex> FlattenArray.flatten([1, [2], 3, nil])
      [1,2,3]

      iex> FlattenArray.flatten([nil, nil])
      []

  """

  @spec flatten(list) :: list
  def flatten(list)

  def flatten([]), do: []

  def flatten([head | tail]) do
    flatten(head, tail)
  end

  def flatten([head | tail], remain_tail) do
    flatten(head, [tail | remain_tail])
  end

  def flatten([], tail), do: flatten(tail)

  def flatten(nil, tail), do: flatten(tail)

  def flatten(head, tail), do: [head | flatten(tail)]
end
