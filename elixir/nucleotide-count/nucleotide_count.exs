defmodule NucleotideCount do

  @initial_histogram %{
    ?A => 0,
    ?C => 0,
    ?G => 0,
    ?T => 0
  }

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(dna, nucleotide_target)

  def count(dna, nucleotide_target) do
    Enum.count(dna, &(&1 === nucleotide_target))
  end

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(dna)

  def histogram(dna) do
    Enum.reduce(dna, @initial_histogram, fn nucleotide, acc ->
      Map.put(acc, nucleotide, acc[nucleotide] + 1)
    end)
  end
end
