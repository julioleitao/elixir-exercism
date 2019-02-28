defmodule ArmstrongNumber do
  @moduledoc """
  Provides a way to validate whether or not a number is an Armstrong number
  """

  @spec is_valid?(integer) :: boolean
  def is_valid?(number) do
    size = number_size(number)

    number
    |> Integer.to_string
    |> String.codepoints
    |> Enum.reduce(0, fn elem, acc ->
      acc + :math.pow(String.to_integer(elem), size)
    end)
    |> equals?(number)
  end

  defp number_size(number) do
    number
    |> Integer.to_string
    |> String.length
  end

  defp equals?(a, b), do: a == b
end
