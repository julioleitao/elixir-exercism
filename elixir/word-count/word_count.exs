defmodule Words do

  @ignored ~r/[,!&*@^%:$]/

  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.replace(@ignored, "")
    |> String.downcase
    |> String.split(~r/[ _]/, trim: true)
    |> count_words
  end

  def count_words(words) do
    words
    |> Enum.reduce(%{}, fn word, acc ->
      Map.update(acc, word, 1, &(&1 + 1))
    end)
  end
end
