_rna_map = {
  "G": "C",
  "C": "G",
  "T": "A",
  "A": "U"
}

def to_rna(dna_strand):
  transcripted = list(map(lambda nucleotide: _rna_map[nucleotide], dna_strand))

  return ''.join(transcripted)
