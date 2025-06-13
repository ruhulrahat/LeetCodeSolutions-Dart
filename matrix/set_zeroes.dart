// If any element is 0, set its entire row and column to 0 — in-place.

// Constraints: Must do it in-place, ideally with O(1) extra space.

// Key idea: Use the first row and first column as marker flags.

// Input:
// [
//  [1,1,1],
//  [1,0,1],
//  [1,1,1]
// ]

// Output:
// [
//  [1,0,1],
//  [0,0,0],
//  [1,0,1]
// ]

void setZeroes(List<List<int>> matrix) {
  int m = matrix.length;
  int n = matrix[0].length;
  bool firstRowZero = false;
  bool firstColZero = false;

  // Step 1: Check if first row has a zero
  for (int j = 0; j < n; j++) {
    if (matrix[0][j] == 0) firstRowZero = true;
  }

  // Step 1: Check if first column has a zero
  for (int i = 0; i < m; i++) {
    if (matrix[i][0] == 0) firstColZero = true;
  }

  // Step 2: Use first row and column as markers
  for (int i = 1; i < m; i++) {
    for (int j = 1; j < n; j++) {
      if (matrix[i][j] == 0) {
        matrix[i][0] = 0; // mark row
        matrix[0][j] = 0; // mark col
      }
    }
  }

  // Step 3: Zero cells based on markers
  for (int i = 1; i < m; i++) {
    for (int j = 1; j < n; j++) {
      if (matrix[i][0] == 0 || matrix[0][j] == 0) {
        matrix[i][j] = 0;
      }
    }
  }

  // Step 4: Zero first row and column if needed
  if (firstRowZero) {
    for (int j = 0; j < n; j++) {
      matrix[0][j] = 0;
    }
  }

  if (firstColZero) {
    for (int i = 0; i < m; i++) {
      matrix[i][0] = 0;
    }
  }
}
