// Given a square matrix (n × n), return the sum of its primary diagonal and secondary diagonal.
// If a cell belongs to both diagonals (i.e., the center in odd-sized matrix), count it only once.

// Example

// Input:
// [
//   [1, 2, 3],
//   [4, 5, 6],
//   [7, 8, 9]
// ]
// Output: 25
// Explanation:
// Primary diagonal = 1 + 5 + 9 = 15
// Secondary diagonal = 3 + 5 + 7 = 15
// But 5 is center (counted once): 15 + 15 − 5 = 25

// Primary Diagonal: Top-left to bottom-right
// Elements: matrix[0][0], matrix[1][1], matrix[2][2] → 1 + 5 + 9 = 15
// Secondary Diagonal: Top-right to bottom-left
// Elements: matrix[0][2], matrix[1][1], matrix[2][0] → 3 + 5 + 7 = 15
// Notice:
// matrix[1][1] = 5 appears in both diagonals → counted twice.
// So we subtract it once at the end if the matrix is odd-sized.

int diagonalSum(List<List<int>> matrix) {
  int n = matrix.length;
  int sum = 0;

  for (int i = 0; i < n; i++) {
    sum += matrix[i][i]; // Primary diagonal
    sum += matrix[i][n - i - 1]; // Secondary diagonal
  }

  // If odd size, subtract center element once
  if (n % 2 == 1) {
    sum -= matrix[n ~/ 2][n ~/ 2];
  }

  return sum;
}

void main() {
  List<List<int>> matrix = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
  ];

  int result = diagonalSum(matrix);
  print('Diagonal Sum = $result'); // Output: Diagonal Sum = 25
}

// You are scanning each row once: O(n)
// Using only one variable for sum: O(1)
// Handling edge case (odd size) elegantly
