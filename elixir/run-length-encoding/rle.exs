defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """
  @spec encode(String.t()) :: String.t()
  def encode(text)

  def encode(""), do: ""

  def encode(text) do
    text
    |> String.codepoints
    |> Enum.reduce([{0, nil}], &reducer_encode/2)
    |> Enum.reverse
    |> Enum.map(&count_to_string/1)
    |> Enum.join
  end

  def reducer_encode(char, [{count, previous} | tail])
  when previous == nil or previous == char do
    [{count + 1, char} | tail]
  end

  def reducer_encode(char, [{count, previous} | tail]) do
    [{1, char} | [{count, previous} | tail]]
  end

  def count_to_string({1, char}), do: char

  def count_to_string({count, char}), do: "#{count}#{char}"

  @spec decode(String.t()) :: String.t()
  def decode(text)

  def decode(""), do: ""

  def decode(text) do
    ~r/\d* |[\d]*[A-Z]?/i
    |> Regex.scan(text)
    |> List.flatten
    |> Enum.map(&decode_char/1)
    |> Enum.join
  end

  def decode_char(char) do
    char
    |> String.split_at(-1)
    |> repeat_char
  end

  def repeat_char({"", char}), do: char

  def repeat_char({count, char}) do
    count = String.to_integer(count)
    String.duplicate(char, count)
  end
end
