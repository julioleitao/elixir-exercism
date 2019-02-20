defmodule Binary do
  @doc """
  Convert a string containing a binary number to an integer.

  On errors returns 0.
  """
  @spec to_decimal(String.t()) :: non_neg_integer
  def to_decimal(string) do
    if string =~ ~r/[^01]/ do
      0
    else
      string
      |> String.codepoints
      |> convert(String.length(string) - 1)
    end
  end

  def convert(["0"], _), do: 0

  def convert(["1"], _), do: 1

  def convert(["1" | tail], expo) do
    :math.pow(2, expo) + convert(tail, expo - 1)
  end

  def convert(["0" | tail], expo) do
    convert(tail, expo - 1)
  end
end
