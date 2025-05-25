// Given an array nums, rotate the array to the right by k steps (non-negative).
// This means the last k elements will come to the front.

// Input: nums = [1,2,3,4,5,6,7], k = 3
// Output: [5,6,7,1,2,3,4]

// Input: nums = [-1,-100,3,99], k = 2
// Output: [3,99,-1,-100]

// Solution:
// Take this example:
// nums = [1, 2, 3, 4, 5, 6, 7]
// k = 3
// After rotating right by 3 steps, the array should look like:
// [5, 6, 7, 1, 2, 3, 4]
// What changed?
// The last 3 elements [5, 6, 7] moved to the front.

// The first 4 elements [1, 2, 3, 4] shifted to the back.

// So what if we just:
// Reverse the entire array

// Reverse the first k elements

// Reverse the remaining n - k elements

// Time Complexity: O(n) — each element is touched only 3 times.
// Space Complexity: O(1) — done in-place.

void reverse(List<int> nums, int start, int end) {
  while (start < end) {
    int temp = nums[start];
    nums[start] = nums[end];
    nums[end] = temp;
    start++;
    end--;
  }
}

void rotate(List<int> nums, int k) {
  int n = nums.length;
  k %= n; // Normalize k to avoid full cycles

  // Step 1: Reverse the entire array
  reverse(nums, 0, n - 1);

  // Step 2: Reverse first k elements
  reverse(nums, 0, k - 1);

  // Step 3: Reverse the rest
  reverse(nums, k, n - 1);
}

void main() {
  List<int> nums = [1, 2, 3, 4, 5, 6, 7];
  rotate(nums, 3);
  print(nums); // Output: [5, 6, 7, 1, 2, 3, 4]
}
