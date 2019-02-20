defmodule LinkedList do
  @opaque t :: tuple()

  defstruct(
    data: nil,
    tail: nil
  )

  @empty_list_error {:error, :empty_list}

  @doc """
  Construct a new LinkedList
  """
  @spec new() :: t
  def new(), do: %LinkedList{}

  @doc """
  Push an item onto a LinkedList
  """
  @spec push(t, any()) :: t
  def push(list, elem) do
    %LinkedList{data: elem, tail: list}
  end

  @doc """
  Calculate the length of a LinkedList
  """
  @spec length(t) :: non_neg_integer()
  def length(list)

  def length(%LinkedList{data: nil}), do: 0

  def length(%LinkedList{tail: tail}), do: 1 + LinkedList.length(tail)

  @doc """
  Determine if a LinkedList is empty
  """
  @spec empty?(t) :: boolean()
  def empty?(list), do: LinkedList.length(list) === 0

  @doc """
  Get the value of a head of the LinkedList
  """
  @spec peek(t) :: {:ok, any()} | {:error, :empty_list}
  def peek(list)

  def peek(%LinkedList{data: nil}), do: @empty_list_error

  def peek(list), do: {:ok, list.data}

  @doc """
  Get tail of a LinkedList
  """
  @spec tail(t) :: {:ok, t} | {:error, :empty_list}
  def tail(list)

  def tail(%LinkedList{data: nil}), do: @empty_list_error

  def tail(%LinkedList{tail: tail}), do: {:ok, tail}

  @doc """
  Remove the head from a LinkedList
  """
  @spec pop(t) :: {:ok, any(), t} | {:error, :empty_list}
  def pop(list)

  def pop(%LinkedList{data: nil}), do: @empty_list_error

  def pop(%LinkedList{} = list), do: {:ok, list.data, list.tail}

  @doc """
  Construct a LinkedList from a stdlib List
  """
  @spec from_list(list()) :: t
  def from_list(list)

  def from_list([]), do: LinkedList.new()

  def from_list(list) do
    list
    |> Enum.reverse
    |> Enum.reduce(LinkedList.new(), fn elem, acc ->
      LinkedList.push(acc, elem)
    end)
  end

  @doc """
  Construct a stdlib List LinkedList from a LinkedList
  """
  @spec to_list(t) :: list()
  def to_list(list)

  def to_list(%LinkedList{data: nil}), do: []

  def to_list(%LinkedList{data: data, tail: tail}) do
    [data | to_list(tail)]
  end

  @doc """
  Reverse a LinkedList
  """
  @spec reverse(t) :: t
  def reverse(list) do
    list
    |> to_list
    |> Enum.reverse
    |> from_list
  end
end
