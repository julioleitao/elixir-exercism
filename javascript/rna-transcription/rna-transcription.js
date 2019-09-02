const MAPPING = {
  'G': 'C',
  'C': 'G',
  'T': 'A',
  'A': 'U'
};

const conversion = (dna) => MAPPING[dna];

export const toRna = (dnaStrand) => {
  return [...dnaStrand].map(conversion).join('');
};
