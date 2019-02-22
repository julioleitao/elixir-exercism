defmodule BinarySearch do
  @doc """
    Searches for a element in the tuple using the binary search algorithm.
    It returns :not_found if the element is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """
  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search(numbers, elem) do
    search(numbers, elem, from: 0, to: tuple_size(numbers) - 1)
  end

  def search(numbers, elem, interval) do
    search(numbers, elem, interval, index_from(interval))
  end

  def search(numbers, elem, _, index)
      when elem(numbers, index) === elem,
      do: {:ok, index}

  def search(_, _, [from: from, to: to], _)
      when to <= from,
      do: :not_found

  def search(numbers, elem, [from: _, to: to], index)
      when elem(numbers, index) < elem,
      do: search(numbers, elem, from: index + 1, to: to)

  def search(numbers, elem, [from: from, to: _], index) do
    search(numbers, elem, from: from, to: index - 1)
  end

  defp index_from(from: from, to: to), do: from + div(to - from, 2)
end
