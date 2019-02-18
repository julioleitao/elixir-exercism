# README: it is not the best solution. Should use regex and extract the prefix.
defmodule PigLatin do
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase)

  def translate(phrase) do
    phrase
    |> String.split(" ")
    |> Enum.map(fn word -> translate_word(word) end)
    |> Enum.join(" ")
  end

  def translate_word(phrase) do
    phrase
    |> String.codepoints
    |> translate_chars
    |> word_with_suffix
  end

  def word_with_suffix(_word = {prefix, phrase_remain}, suffix \\ "ay"), do: "#{prefix}#{phrase_remain}#{suffix}"

  def translate_chars(chars) do
    cond do
      y_with_consonant_cluster?(chars) or y_with_vowel_sound?(chars) ->
        {Enum.join(chars), ""}
      start_with_vowel?(chars) ->
        translate_beginning_with_vowel(chars)
      true ->
        {head, tail} = translate_beginning_with_consonant([], chars)
        {tail, head}
    end
  end

  @vowels ~w(a e i o u)
  def vowel?(char), do: char in @vowels

  def start_with_vowel?(chars), do: chars |> hd |> vowel?

  def translate_beginning_with_vowel(chars), do: Enum.split_while(chars, &vowel?/1)

  def translate_beginning_with_consonant(prefix, phrase_remain = [head | tail]) do
    cond do
      not vowel?(head) ->
        translate_beginning_with_consonant([head | prefix], tail)
      consonant_with_qu?(prefix, phrase_remain) ->
        {Enum.reverse([head | prefix]), tail}
      true ->
        {Enum.reverse(prefix), phrase_remain}
    end
  end

  def consonant_with_qu?(["q" | _], ["u" | _]), do: true
  def consonant_with_qu?(_, _), do: false

  @vowel_sound ["xr", "xb"]
  def y_with_vowel_sound?([first, second | _]), do: "#{first}#{second}" in @vowel_sound
  def y_with_vowel_sound?(_), do: false

  def y_with_consonant_cluster?(["y", second | _]), do: not vowel?(second)
  def y_with_consonant_cluster?(_), do: false
end
