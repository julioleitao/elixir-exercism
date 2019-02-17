defmodule ProteinTranslation do

  @codon_mem %{
    "UGU" => "Cysteine",
    "UGC" => "Cysteine",
    "UUA" => "Leucine",
    "UUG" => "Leucine",
    "AUG" => "Methionine",
    "UUU" => "Phenylalanine",
    "UUC" => "Phenylalanine",
    "UCU" => "Serine",
    "UCC" => "Serine",
    "UCA" => "Serine",
    "UCG" => "Serine",
    "UGG" => "Tryptophan",
    "UAU" => "Tyrosine",
    "UAC" => "Tyrosine",
    "UAA" => "STOP",
    "UAG" => "STOP",
    "UGA" => "STOP"
  }

  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: {atom, list(String.t())}
  def of_rna(rna) do
    proteins = [head | tail] = rna_to_proteins(rna)

    if head === :error or tail === [:error] do
     {:error, "invalid RNA"}
    else
      {:ok, proteins}
    end
  end

  def rna_to_proteins(""), do: []

  def rna_to_proteins(rna) do
    {codon, rna_tail} = next_codon(rna)

    codon
    |> of_codon
    |> rna_to_proteins(rna_tail)
  end

  def rna_to_proteins({:ok, "STOP"}, _), do: []

  def rna_to_proteins({:error, _}, _), do: [:error]

  def rna_to_proteins({:ok, protein}, rna_tail), do: [protein | rna_to_proteins(rna_tail)]

  def next_codon(rna) do
    String.split_at(rna, 3)
  end

  @doc """
  Given a codon, return the corresponding protein

  UGU -> Cysteine
  UGC -> Cysteine
  UUA -> Leucine
  UUG -> Leucine
  AUG -> Methionine
  UUU -> Phenylalanine
  UUC -> Phenylalanine
  UCU -> Serine
  UCC -> Serine
  UCA -> Serine
  UCG -> Serine
  UGG -> Tryptophan
  UAU -> Tyrosine
  UAC -> Tyrosine
  UAA -> STOP
  UAG -> STOP
  UGA -> STOP
  """
  @spec of_codon(String.t()) :: {atom, String.t()}
  def of_codon(codon) do
    case @codon_mem[codon] do
      nil -> {:error, "invalid codon"}
      value -> {:ok, value}
    end
  end
end
