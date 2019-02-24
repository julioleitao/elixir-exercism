defmodule ListOps do
  # Please don't use any external modules (especially List or Enum) in your
  # implementation. The point of this exercise is to create these basic
  # functions yourself. You may use basic Kernel functions (like `Kernel.+/2`
  # for adding numbers), but please do not use Kernel functions for Lists like
  # `++`, `--`, `hd`, `tl`, `in`, and `length`.

  @spec count(list) :: non_neg_integer
  def count(list)

  def count([]), do: 0

  def count([_ | tail]), do: 1 + count(tail)

  @spec reverse(list) :: list
  def reverse(list) do
    reduce(list, [], fn elem, acc ->
      [elem | acc]
    end)
  end

  @spec map(list, (any -> any)) :: list
  def map(list, fun)

  def map([], _), do: []

  def map([head | tail], fun) do
    [fun.(head) | map(tail, fun)]
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(list, fun)

  def filter([], _), do: []

  def filter([head | tail], fun) do
    if fun.(head) do
      [head | filter(tail, fun)]
    else
      filter(tail, fun)
    end
  end

  @type acc :: any
  @spec reduce(list, acc, (any, acc -> acc)) :: acc
  def reduce(list, acc, fun)

  def reduce([], acc, _), do: acc

  def reduce([head | tail], acc, fun) do
    reduce(tail, fun.(head, acc), fun)
  end

  @spec append(list, list) :: list
  def append(a, b) do
    a
    |> reverse
    |> reduce(b, fn elem, acc ->
      [elem | acc]
    end)
  end

  @spec concat([[any]]) :: [any]
  def concat(list)

  def concat([]), do: []

  def concat(list) do
    list
    |> reduce([], fn elem, acc ->
      add_elements_to(elem, acc)
    end)
    |> reverse
  end

  defp add_elements_to(from, to) do
    from
    |> reduce(to, fn elem, acc ->
      [elem | acc]
    end)
  end
end
