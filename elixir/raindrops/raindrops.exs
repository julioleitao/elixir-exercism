defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t()
  def convert(number)

  @raindrop_factors [
    {3, "Pling"},
    {5, "Plang"},
    {7, "Plong"}
  ]

  def convert(number) do
    @raindrop_factors
    |> Enum.map(fn {factor, output} ->
      factor_drop(factor, output, number)
    end)
    |> Enum.join("")
    |> accept_output(number)
  end

  def factor_drop(factor, output, number) do
    rem(number, factor) == 0 && output || ""
  end

  def accept_output("", number), do: Integer.to_string(number)

  def accept_output(output, _), do: output
end
