// NOTE:
// Given an array of integers nums and an integer target, return the indices of the two numbers such that
//  they add up to the target.

// You may assume that each input would have exactly one solution, and you may not use the same element twice.

// Input: nums = [2, 7, 11, 15], target = 9
// Output: [0, 1]
// Explanation: nums[0] + nums[1] == 9

// Input: nums = [3, 2, 4], target = 6
// Output: [1, 2]

// Input: nums = [3, 3], target = 6
// Output: [0, 1]

// Time Complexity: O(n²)
// Space Complexity: O(1)
List<int> twoSumBruteForce(List<int> nums, int target) {
  for (int i = 0; i < nums.length; i++) {
    for (int j = i + 1; j < nums.length; j++) {
      if (nums[i] + nums[j] == target) {
        return [i, j];
      }
    }
  }
  throw ArgumentError('No two sum solution');
}

// Time Complexity: O(n)
// Space Complexity: O(n)
List<int> twoSumOptimized(List<int> nums, int target) {
  final Map<int, int> map = {};

  for (int i = 0; i < nums.length; i++) {
    int complement = target - nums[i];
    if (map.containsKey(complement)) {
      return [map[complement]!, i];
    }
    map[nums[i]] = i;
  }

  throw ArgumentError('No two sum solution');
}

void main() {
  print(twoSumBruteForce([2, 7, 11, 15], 9)); // [0, 1]
  print(twoSumBruteForce([3, 2, 4], 6)); // [1, 2]
  print(twoSumBruteForce([3, 3], 6)); // [0, 1]

  print(twoSumOptimized([2, 7, 11, 15], 9)); // [0, 1]
  print(twoSumOptimized([3, 2, 4], 6)); // [1, 2]
  print(twoSumOptimized([3, 3], 6)); // [0, 1]
}
