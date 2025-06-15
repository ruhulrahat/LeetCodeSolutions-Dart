// Given a 2D grid map of '1's (land) and '0's (water), return the number of islands.
// An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically.

// Input:
// [
//   ['1','1','0','0','0'],
//   ['1','1','0','0','0'],
//   ['0','0','1','0','0'],
//   ['0','0','0','1','1']
// ]
// Output: 3

int numIslands(List<List<String>> grid) {
  int m = grid.length;
  if (m == 0) return 0;
  int n = grid[0].length;

  int islandCount = 0;

  for (int i = 0; i < m; i++) {
    for (int j = 0; j < n; j++) {
      if (grid[i][j] == '1') {
        islandCount++;
        _dfs(grid, i, j);
      }
    }
  }

  return islandCount;
}

void _dfs(List<List<String>> grid, int i, int j) {
  int m = grid.length;
  int n = grid[0].length;

  if (i < 0 || i >= m || j < 0 || j >= n || grid[i][j] == '0') {
    return;
  }

  grid[i][j] = '0'; // mark visited

  _dfs(grid, i + 1, j); // down
  _dfs(grid, i - 1, j); // up
  _dfs(grid, i, j + 1); // right
  _dfs(grid, i, j - 1); // left
}

void main() {
  List<List<String>> grid = [
    ['1', '1', '0', '0', '0'],
    ['1', '1', '0', '0', '0'],
    ['0', '0', '1', '0', '0'],
    ['0', '0', '0', '1', '1']
  ];

  int result = numIslands(grid);
  print("Number of Islands: $result"); // Output: 3
}

// Explanation
// Traverse every cell in the grid.
// When you see '1' (unvisited land):
// Count one island.
// Do DFS to "sink" the entire island (turn '1's to '0's).
// This prevents double-counting the same island.

// Time & Space Complexity
// Time	O(m * n)
// Space	O(m * n) (call stack in worst case)