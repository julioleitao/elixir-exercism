defmodule RotationalCipher do

  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift_length)

  def rotate(text, 0), do: text

  def rotate(text, shift_length) do
    text
    |> String.to_char_list
    |> Enum.map(&(rotate_just_letter(&1, shift_length)))
    |> to_string
  end

  defguard upcase?(char) when char >= ?A and char <= ?Z

  defguard downcase?(char) when char >= ?a and char <= ?z

  defguard letter?(char) when upcase?(char) or downcase?(char)

  def rotate_just_letter(char, shift_length) when letter?(char) do
    rotate_with_limit(char, shift_length)
  end

  def rotate_just_letter(char, _), do: char

  def begin_at(char) when downcase?(char), do: ?a

  def begin_at(char) when upcase?(char), do: ?A

  @alphabet_limit 26
  def rotate_with_limit(char, shift_length) do
    begin = begin_at(char)
    rem(char - begin + shift_length, @alphabet_limit) + begin
  end
end
