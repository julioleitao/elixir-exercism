defmodule BinarySearchTree do
  @type bst_node :: %{data: any, left: bst_node | nil, right: bst_node | nil}

  defstruct(
    data: nil,
    left: nil,
    right: nil
  )

  @doc """
  Create a new Binary Search Tree with root's value as the given 'data'
  """
  @spec new(any) :: bst_node
  def new(data), do: %BinarySearchTree{data: data}

  @doc """
  Creates and inserts a node with its value as 'data' into the tree.
  """
  @spec insert(bst_node, any) :: bst_node
  def insert(nil, elem), do: new(elem)

  def insert(tree = %{data: data, left: left}, elem) when elem <= data do
    %{tree | left: insert(left, elem)}
  end

  def insert(tree = %{data: data, right: right} = node, elem) do
    %{tree | right: insert(right, elem)}
  end

  @doc """
  Traverses the Binary Search Tree in order and returns a list of each node's data.
  """
  @spec in_order(bst_node) :: [any]
  def in_order(tree)

  def in_order(nil), do: []

  def in_order(%BinarySearchTree{data: data, left: left, right: right}) do
    in_order(left) ++ [data] ++ in_order(right)
  end


end
