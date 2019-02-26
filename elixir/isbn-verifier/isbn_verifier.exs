defmodule ISBNVerifier do
  @doc """
    Checks if a string is a valid ISBN-10 identifier

    ## Examples

      iex> ISBNVerifier.isbn?("3-598-21507-X")
      true

      iex> ISBNVerifier.isbn?("3-598-2K507-0")
      false

  """
  @spec isbn?(String.t()) :: boolean
  def isbn?(isbn)

  @valid_format_isbn ~r/\d-*\d\d\d-*\d\d\d\d\d-*[\d|X]$/
  def isbn?(isbn) do
    isbn =~ @valid_format_isbn and valid?(isbn)
  end

  def apply_formula(isbn) do
    isbn
    |> to_number_list
    |> Enum.reduce({0, 10}, fn elem, {acc, index} ->
      {acc + elem * index, index - 1}
    end)
  end

  def valid?(isbn) do
    {number, _} = apply_formula(isbn)

    rem(number, 11) === 0
  end

  def to_number_list(isbn) do
    isbn
    |> String.replace("-", "")
    |> String.codepoints()
    |> Enum.map(&code_to_integer/1)
  end

  def code_to_integer("X"), do: 10

  def code_to_integer(code), do: String.to_integer(code)
end
