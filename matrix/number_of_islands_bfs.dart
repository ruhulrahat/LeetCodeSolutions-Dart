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

import 'dart:collection';

int numIslands(List<List<String>> grid) {
  int m = grid.length;
  if (m == 0) return 0;
  int n = grid[0].length;

  int count = 0;

  for (int i = 0; i < m; i++) {
    for (int j = 0; j < n; j++) {
      if (grid[i][j] == '1') {
        count++;
        _bfs(grid, i, j);
      }
    }
  }

  return count;
}

void _bfs(List<List<String>> grid, int i, int j) {
  int m = grid.length;
  int n = grid[0].length;

  Queue<List<int>> queue = Queue();
  queue.add([i, j]);
  grid[i][j] = '0'; // mark as visited

  List<List<int>> directions = [
    [0, 1], // right
    [1, 0], // down
    [0, -1], // left
    [-1, 0], // up
  ];

  while (queue.isNotEmpty) {
    List<int> current = queue.removeFirst();
    int x = current[0];
    int y = current[1];

    for (List<int> dir in directions) {
      int newX = x + dir[0];
      int newY = y + dir[1];

      if (newX >= 0 &&
          newX < m &&
          newY >= 0 &&
          newY < n &&
          grid[newX][newY] == '1') {
        queue.add([newX, newY]);
        grid[newX][newY] = '0'; // mark visited
      }
    }
  }
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
// Time & Space Complexity
// Time: O(m * n) – Each cell is visited once.

// Space: O(min(m, n)) – For queue in worst-case narrow band.