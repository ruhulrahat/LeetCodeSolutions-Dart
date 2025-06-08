// Given a 1-indexed, sorted array of integers numbers that is non-decreasing,
//find two numbers such that they add up to a specific target number.
// Return the indices of the two numbers (1-based index) such that:
// numbers[i] + numbers[j] == target
// i < j
// You must use exactly one solution, and you may not use the same element twice.
// You must solve it using O(n) time.

// Input: numbers = [2,7,11,15], target = 9
// Output: [1,2]
// Explanation: numbers[0] + numbers[1] = 9

List<int> twoSumSorted(List<int> numbers, int target) {
  int left = 0;
  int right = numbers.length - 1;

  while (left < right) {
    int sum = numbers[left] + numbers[right];
    if (sum == target) {
      return [left + 1, right + 1]; // 1-indexed result
    } else if (sum < target) {
      left++;
    } else {
      right--;
    }
  }

  return []; // If no solution found
}

void main() {
  List<int> numbers = [2, 7, 11, 15];
  int target = 9;

  List<int> result = twoSumSorted(numbers, target);
  print(result); // Output: [1, 2]
}
