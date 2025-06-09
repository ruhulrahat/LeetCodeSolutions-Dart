// Given a 2D matrix, return all elements of the matrix in spiral order (clockwise starting from top-left).

// Initialize 4 bounds: top, bottom, left, right.

// Keep going while top ≤ bottom and left ≤ right.

// Add top row → right col ↓ bottom row ← left col ↑.

// Shrink bounds after each pass.
// [
//   [1, 2, 3],
//   [4, 5, 6],
//   [7, 8, 9]
//   ]
// // [1, 2, 3, 6, 9, 8, 7, 4, 5]

// Initialize 4 bounds: top, bottom, left, right.

// Keep going while top ≤ bottom and left ≤ right.

// Add top row → right col ↓ bottom row ← left col ↑.

// Shrink bounds after each pass.

List<int> spiralOrder(List<List<int>> matrix) {
  if (matrix.isEmpty) return [];

  int top = 0, bottom = matrix.length - 1;
  int left = 0, right = matrix[0].length - 1;
  List<int> result = [];

  while (top <= bottom && left <= right) {
    // Traverse from Left to Right
    for (int i = left; i <= right; i++) {
      result.add(matrix[top][i]);
    }
    top++;

    // Traverse from Top to Bottom
    for (int i = top; i <= bottom; i++) {
      result.add(matrix[i][right]);
    }
    right--;

    // Traverse from Right to Left
    if (top <= bottom) {
      for (int i = right; i >= left; i--) {
        result.add(matrix[bottom][i]);
      }
      bottom--;
    }

    // Traverse from Bottom to Top
    if (left <= right) {
      for (int i = bottom; i >= top; i--) {
        result.add(matrix[i][left]);
      }
      left++;
    }
  }

  return result;
}

void main() {
  print(spiralOrder([
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
  ])); // [1, 2, 3, 6, 9, 8, 7, 4, 5]
}
