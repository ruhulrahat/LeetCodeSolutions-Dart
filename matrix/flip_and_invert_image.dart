// Given a 2D binary matrix (values are 0 or 1):
// Flip horizontally (reverse each row).
// Invert each value: 0 becomes 1, and 1 becomes 0.
// Return the resulting image.

// Example
// Input:
// [
//  [1, 1, 0],
//  [1, 0, 1],
//  [0, 0, 0]
// ]
// Step 1 (Flip Horizontally):
// [
//  [0, 1, 1],
//  [1, 0, 1],
//  [0, 0, 0]
// ]
// Step 2 (Invert):
// [
//  [1, 0, 0],
//  [0, 1, 0],
//  [1, 1, 1]
// ]

List<List<int>> flipAndInvertImage(List<List<int>> image) {
  int rows = image.length;
  int cols = image[0].length;

  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < (cols + 1) ~/ 2; j++) {
      // Flip and invert in one step
      int temp = image[i][j] ^ 1;
      image[i][j] = image[i][cols - 1 - j] ^ 1;
      image[i][cols - 1 - j] = temp;
    }
  }

  return image;
}

void main() {
  List<List<int>> input = [
    [1, 1, 0],
    [1, 0, 1],
    [0, 0, 0]
  ];

  List<List<int>> result = flipAndInvertImage(input);
  for (var row in result) {
    print(row);
  }
}

// Explanation
// We loop halfway through each row ((cols + 1) ~/ 2) to avoid double-swap.
// ^ 1 is a smart trick: it inverts the binary value (0 ↔ 1).
// So image[i][j] ^ 1 does the invert, and swapping positions does the flip — at the same time!

// Time & Space Complexity
// Time: O(m × n)
// Space: O(1) (in-place)