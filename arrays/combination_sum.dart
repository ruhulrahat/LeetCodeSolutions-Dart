// Given an array of distinct integers candidates and a target integer target, return a list of all unique combinations of candidates where the chosen numbers sum to target. You may return the combinations in any order.

// The same number may be chosen from candidates an unlimited number of times. Two combinations are unique if the frequency of at least one of the chosen numbers is different.

// The test cases are generated such that the number of unique combinations that sum up to target is less than 150 combinations for the given input.

// Example 1:

// Input: candidates = [2,3,6,7], target = 7
// Output: [[2,2,3],[7]]
// Explanation:
// 2 and 3 are candidates, and 2 + 2 + 3 = 7. Note that 2 can be used multiple times.
// 7 is a candidate, and 7 = 7.
// These are the only two combinations.
// Example 2:

// Input: candidates = [2,3,5], target = 8
// Output: [[2,2,2,2],[2,3,3],[3,5]]
// Example 3:

// Input: candidates = [2], target = 1
// Output: []

// Strategy: Backtracking
// At each step, we choose a candidate and recurse with remaining target

// If we overshoot the target → backtrack

// If we hit the target → add to result

// Time Complexity: Exponential in nature: O(2^T) (T = target), as we explore many combinations.
// Space Complexity: O(T) for recursion stack + result storage.

List<List<int>> combinationSum(List<int> candidates, int target) {
  List<List<int>> result = [];

  void backtrack(int start, int remaining, List<int> path) {
    if (remaining == 0) {
      result.add(List.from(path));
      return;
    }

    for (int i = start; i < candidates.length; i++) {
      int current = candidates[i];
      if (current > remaining) continue;

      path.add(current);
      // not i+1 because we can reuse the same element
      backtrack(i, remaining - current, path);
      path.removeLast(); // backtrack
    }
  }

  backtrack(0, target, []);
  return result;
}

// Time Complexity: Exponential in nature: O(2^T) (T = target), as we explore many combinations.
// Space Complexity: O(T) for recursion stack + result storage.
void main() {
  print(combinationSum([2, 3, 6, 7], 7)); // Output: [[2, 2, 3], [7]]
  print(combinationSum(
      [2, 3, 5], 8)); // Output: [[2, 2, 2, 2], [2, 3, 3], [3, 5]]
  print(combinationSum([2], 1)); // Output: []

  print(combinationSumMemo([2, 3, 5], 8));
  // Output: [[2, 2, 2, 2], [2, 3, 3], [3, 5]]
}

// Without memoization: Recomputes same subproblems over and over
// With memoization: Each (start, remaining) pair computed only once
// Improves performance significantly for large inputs (e.g., [2,3,6,7], target = 100)

List<List<int>> combinationSumMemo(List<int> candidates, int target) {
  Map<String, List<List<int>>> memo = {};

  List<List<int>> backtrack(int start, int remaining) {
    String key = "$start-$remaining";
    if (memo.containsKey(key)) return memo[key]!;

    List<List<int>> result = [];

    if (remaining == 0) return [[]];
    if (remaining < 0) return [];

    for (int i = start; i < candidates.length; i++) {
      int current = candidates[i];
      if (current > remaining) continue;

      List<List<int>> subCombos = backtrack(i, remaining - current);
      for (var combo in subCombos) {
        result.add([current, ...combo]);
      }
    }

    memo[key] = result;
    return result;
  }

  candidates.sort(); // Optional optimization
  return backtrack(0, target);
}
