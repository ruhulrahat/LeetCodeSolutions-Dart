// You’re given a 2D matrix mat with m rows and n columns, and two integers r and c.
// Return the matrix reshaped into shape [r][c].
// If it's not possible (i.e., element count mismatches), return the original matrix.
// 📌 Example
// Input:
// mat = [
//   [1, 2],
//   [3, 4]
// ], r = 1, c = 4
// Output:
// [
//  [1, 2, 3, 4]
// ]

List<List<int>> matrixReshape(List<List<int>> mat, int r, int c) {
  int m = mat.length;
  int n = mat[0].length;

  // Check if reshape is possible
  if (m * n != r * c) return mat;

  List<List<int>> result = List.generate(r, (_) => List.filled(c, 0));
  int row = 0, col = 0;

  for (int i = 0; i < m; i++) {
    for (int j = 0; j < n; j++) {
      result[row][col] = mat[i][j];
      col++;
      if (col == c) {
        col = 0;
        row++;
      }
    }
  }

  return result;
}

void main() {
  List<List<int>> mat = [
    [1, 2],
    [3, 4]
  ];
  int r = 1, c = 4;

  List<List<int>> reshaped = matrixReshape(mat, r, c);
  for (var row in reshaped) {
    print(row);
  }
}

// Time & Space Complexity
// Time	O(m * n)
// Space	O(r * c)

List<List<int>> matrixReshapeUsingFlatIndexMapping(
    List<List<int>> mat, int r, int c) {
  int m = mat.length;
  int n = mat[0].length;

  // Total elements must match
  if (m * n != r * c) return mat;

  List<List<int>> result = List.generate(r, (_) => List.filled(c, 0));

  for (int i = 0; i < m * n; i++) {
    int originalRow = i ~/ n;
    int originalCol = i % n;

    int newRow = i ~/ c;
    int newCol = i % c;

    result[newRow][newCol] = mat[originalRow][originalCol];
  }

  return result;
}
// Time: O(m * n)
// Space: O(r * c) (new matrix)