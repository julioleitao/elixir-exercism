defmodule SimpleCipher do
  @doc """
  Given a `plaintext` and `key`, encode each character of the `plaintext` by
  shifting it by the corresponding letter in the alphabet shifted by the number
  of letters represented by the `key` character, repeating the `key` if it is
  shorter than the `plaintext`.

  For example, for the letter 'd', the alphabet is rotated to become:

  defghijklmnopqrstuvwxyzabc

  You would encode the `plaintext` by taking the current letter and mapping it
  to the letter in the same position in this rotated alphabet.

  abcdefghijklmnopqrstuvwxyz
  defghijklmnopqrstuvwxyzabc

  "a" becomes "d", "t" becomes "w", etc...

  Each letter in the `plaintext` will be encoded with the alphabet of the `key`
  character in the same position. If the `key` is shorter than the `plaintext`,
  repeat the `key`.

  Example:

  plaintext = "testing"
  key = "abc"

  The key should repeat to become the same length as the text, becoming
  "abcabca". If the key is longer than the text, only use as many letters of it
  as are necessary.
  """
  def encode(text, key), do: encode(text, key, &encode_char/2)

  def encode(text, key, encode_fn) do
    text
    |> to_char_list
    |> encode_charlist(key, encode_fn)
    |> List.to_string
  end

  defguard letter?(char) when char in ?a..?z

  defp encode_char(char, _) when not letter?(char), do: char

  defp encode_char(char, key), do: ?a + rem(char + key - ?a * 2, 26)

  defp encode_charlist(list, key, encode_fn), do: encode_charlist(list, to_charlist(key), key, encode_fn)

  # when the key is shorten, it is necessary to loop
  defp encode_charlist(list, [], key, encode_fn), do: encode_charlist(list, key, encode_fn)

  # if the charlist is over
  defp encode_charlist([], _, _, _), do: []

  # take the first of the charlist and the first of the key, apply the encoding
  defp encode_charlist([list_head | list_tail], [key_head | key_tail], key, encode_fn) do
    head = encode_fn.(list_head, key_head)

    [head | encode_charlist(list_tail, key_tail, key, encode_fn)]
  end

  defp decode_char(char, _) when not letter?(char), do: char

  defp decode_char(char, key) do
    ?a + rem(26 + char - key, 26)
  end

  @doc """
  Given a `ciphertext` and `key`, decode each character of the `ciphertext` by
  finding the corresponding letter in the alphabet shifted by the number of
  letters represented by the `key` character, repeating the `key` if it is
  shorter than the `ciphertext`.

  The same rules for key length and shifted alphabets apply as in `encode/2`,
  but you will go the opposite way, so "d" becomes "a", "w" becomes "t",
  etc..., depending on how much you shift the alphabet.
  """
  def decode(ciphertext, key), do: encode(ciphertext, key, &decode_char/2)
end
