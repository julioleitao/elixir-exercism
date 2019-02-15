defmodule SecretHandshake do

  require Bitwise

  @reverse 0b10000

  @mem %{
    @reverse => :reverse,
    0b1000   => "jump",
    0b100    => "close your eyes",
    0b10     => "double blink",
    0b1      => "wink"
  }

  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code)

  def commands(code) do
    code
    |> handshake_action
    |> reverse(Bitwise.&&&(code, @reverse) !== @reverse)
  end

  def reverse(enumerable, true), do: Enum.reverse(enumerable)

  def reverse([_ | tail], false), do: tail

  def handshake_action(_, 0), do: []

  def handshake_action(code, base \\ 16) when Bitwise.&&&(code, base) === base do
      [@mem[base] | next_handshake(code, base)]
  end

  def handshake_action(code, base), do: next_handshake(code, base)

  defp next_handshake(code, base), do: handshake_action(code, div(base, 2))
end
