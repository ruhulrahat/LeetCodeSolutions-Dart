// You are given an m x n integer matrix matrix with the following properties:
// Each row is sorted in ascending order.
// The first integer of each row is greater than the last integer of the previous row.
// Given an integer target, return true if it exists in the matrix and false otherwise.
// Example 1:
// Input: matrix = [
//   [1, 3, 5, 7],
//   [10, 11, 16, 20],
//   [23, 30, 34, 60]
// ], target = 3
// Output: true

// Key Insight
// Because of the matrix properties:
// You can treat the entire matrix as a flattened 1D sorted array.
// Perform binary search on this 1D space.
// You map 1D index i to 2D coordinates:

// row = i ~/ cols
// col = i % cols

bool searchMatrix(List<List<int>> matrix, int target) {
  int rows = matrix.length;
  int cols = matrix[0].length;

  int left = 0;
  int right = rows * cols - 1;

  while (left <= right) {
    int mid = (left + right) ~/ 2;
    int midVal = matrix[mid ~/ cols][mid % cols];

    if (midVal == target) {
      return true;
    } else if (midVal < target) {
      left = mid + 1;
    } else {
      right = mid - 1;
    }
  }

  return false;
}

void main() {
  List<List<int>> matrix = [
    [1, 3, 5, 7],
    [10, 11, 16, 20],
    [23, 30, 34, 60]
  ];

  print(searchMatrix(matrix, 3)); // true
  print(searchMatrix(matrix, 13)); // false
  print(searchMatrix(matrix, 34)); // true
  print(searchMatrix(matrix, 61)); // false
}

// Time Complexity: O(log(m * n)) → classic binary search
// Space Complexity: O(1) → no extra space

// Time Complexity: O(m + n)
// Space Complexity: O(1)

// When to Use Staircase Search
// Matrix is sorted row-wise and column-wise
// Easier to implement and explain than binary search
// Good when matrix size is not too large (not optimal for millions of rows/cols)

// matrix = [
//   [1,  3,  5,  7],
//   [10, 11, 16, 20],
//   [23, 30, 34, 60]
// ], target = 16

// Start at matrix[0][3] = 7:
// 7 < 16 → move down
// matrix[1][3] = 20 → 20 > 16 → move left
// matrix[1][2] = 16 → found!

bool searchMatrixStaircase(List<List<int>> matrix, int target) {
  int m = matrix.length;
  int n = matrix[0].length;

  int row = 0;
  int col = n - 1;

  while (row < m && col >= 0) {
    int val = matrix[row][col];
    if (val == target) {
      return true;
    } else if (val < target) {
      row++; // move down
    } else {
      col--; // move left
    }
  }

  return false;
}
