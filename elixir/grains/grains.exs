defmodule Grains do
  @doc """
  Calculate two to the power of the input minus one.
  """
  @spec square(pos_integer) :: pos_integer
  def square(number)

  def square(number) when number > 64 or number <= 0 do
    {:error, "The requested square must be between 1 and 64 (inclusive)"}
  end

  def square(number), do: {:ok, trunc(:math.pow(2, number) / 2)}

  @doc """
  Adds square of each number from 1 to 64.
  """
  @spec total :: pos_integer
  def total do
    result = Enum.reduce(1..64, 0, fn elem, acc ->
      {:ok, value} = square(elem)
      acc + value
    end)
    {:ok, result}
  end
end
