defmodule Gigasecond do

  @doc """
  Calculate a date one billion seconds after an input date.
  """
  @spec from({{pos_integer, pos_integer, pos_integer}, {pos_integer, pos_integer, pos_integer}}) ::
  :calendar.datetime()

  @one_gigasecond_in_seconds 1_000_000_000
  def from(erl_time = {{year, month, day}, {hours, minutes, seconds}}) do
    erl_time
    |> erl_time_to_naive_date_time
    |> NaiveDateTime.add(@one_gigasecond_in_seconds)
    |> NaiveDateTime.to_erl
  end

  def erl_time_to_naive_date_time(erl_time) do
    {:ok, time} = NaiveDateTime.from_erl(erl_time)
    time
  end
end
