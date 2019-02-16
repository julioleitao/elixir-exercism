defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def keep(list, fun)

  def keep([], _), do: []

  def keep(enumerable = [head | tail], fun) do
    apply_at(enumerable, fun, fun.(head), &keep/2)
  end


  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def discard(list, fun)

  def discard([], _), do: []

  def discard(enumerable = [head | tail], fun) do
    apply_at(enumerable, fun, !fun.(head), &discard/2)
  end

  def apply_at([head | tail], fun_predicate, true, fun_callback) do
    [head | fun_callback.(tail, fun_predicate)]
  end

  def apply_at([_ | tail], fun_predicate, false, fun_callback) do
    fun_callback.(tail, fun_predicate)
  end
end
