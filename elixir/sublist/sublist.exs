defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b)

  def compare(a, a), do: :equal

  def compare(a, b) do
    cond do
      contains?(a, b) -> :superlist
      contains?(b, a) -> :sublist
      true -> :unequal
    end
  end

  defp contains?(complete, part) do
    count = length(part)

    cond do
      count > length(complete) -> false
      Enum.take(complete, count) === part -> true
      true ->
        [_ | tail] = complete
        contains?(tail, part)
    end
  end
end
