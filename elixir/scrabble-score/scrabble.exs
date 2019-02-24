defmodule Scrabble do

  @letter_values %{
    ~w(A E I O U L N R S T) => 1,
    ~w(D G) => 2,
    ~w(B C M P) => 3,
    ~w(F H V W Y) => 4,
    ~w(K) => 5,
    ~w(J X) => 8,
    ~w(Q Z) =>10
  }

  @doc """
  Calculate the scrabble score for the word.
  """
  @spec score(String.t()) :: non_neg_integer
  def score(word) do
    word
    |> String.graphemes
    |> Enum.reduce(0, fn char, acc ->
      acc + char_score(String.upcase(char))
    end)
  end

  def char_score(char) do
    char
    |> key_from_char
    |> score_from_key
  end

  def score_from_key(key), do: @letter_values[key] || 0

  def key_from_char(char) do
    Map.keys(@letter_values)
    |> Enum.find(&(char in &1))
  end
end
