defmodule Bob do
  def hey(input) do
    input
    |> bob_say
  end

  def bob_say(phrase) do
    cond do
      silence?(phrase) ->
        "Fine. Be that way!"

      shouting_question?(phrase) ->
        "Calm down, I know what I'm doing!"

      shouting?(phrase) ->
        "Whoa, chill out!"

      question?(phrase) ->
        "Sure."

      true ->
        "Whatever."
    end
  end

  defp silence?(input), do: String.strip(input) === ""

  def shouting_question?(input), do: shouting?(input) and question?(input)

  def shouting?(input) do
    String.upcase(input) == input && String.downcase(input) != input
  end

  def question?(input), do: String.ends_with?(input, "?")
end
