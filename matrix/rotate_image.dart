// Given an n x n matrix, rotate the image by 90 degrees (clockwise) in place.

// Input:
// [
//  [1, 2, 3],
//  [4, 5, 6],
//  [7, 8, 9]
// ]

// Output:
// [
//  [7, 4, 1],
//  [8, 5, 2],
//  [9, 6, 3]
// ]

// Original:         After Transpose:    After Row Reverse:
// 1 2 3             1 4 7               7 4 1
// 4 5 6     →       2 5 8       →       8 5 2
// 7 8 9             3 6 9               9 6 3
// Transpose the matrix
// Swap elements across the diagonal.

// Manually reverse each row
// Use two-pointer technique: swap left and right until you meet in the middle.

void rotate(List<List<int>> matrix) {
  int n = matrix.length;

  // Step 1: Transpose (i.e., flip over the diagonal)
  for (int i = 0; i < n; i++) {
    for (int j = i + 1; j < n; j++) {
      int temp = matrix[i][j];
      matrix[i][j] = matrix[j][i];
      matrix[j][i] = temp;
    }
  }

  // Step 2: Reverse each row manually
  for (int i = 0; i < n; i++) {
    int left = 0;
    int right = n - 1;
    while (left < right) {
      int temp = matrix[i][left];
      matrix[i][left] = matrix[i][right];
      matrix[i][right] = temp;
      left++;
      right--;
    }
  }
}

void main() {
  List<List<int>> matrix = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
  ];

  rotate(matrix);

  for (var row in matrix) {
    print(row);
  }
  // Output:
  // [7, 4, 1]
  // [8, 5, 2]
  // [9, 6, 3]
}
