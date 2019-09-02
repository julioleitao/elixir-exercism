const fromRowToNumbers = row => row.split(' ').map(elem => Number(elem));

const transposeMatrix = matrix => matrix[0].map((_, i) => {
  return matrix.map(row => row[i]);
});


export class Matrix {
  constructor(matrix) {
    this.data = matrix.split('\n').map(fromRowToNumbers);
    this.transposed = transposeMatrix(this.data);
  }

  get rows() {
    return this.data;
  }

  get columns() {
    return this.transposed;
  }
}


