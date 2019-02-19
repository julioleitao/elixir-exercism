defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    |> String.split(~r/ |-|(?=[A-Z][^A-Z])/, trim: true)
    |> Enum.map(&prefix/1)
    |> Enum.join
  end

  def prefix(word) do
    word
    |> String.first
    |> String.upcase
  end
end
