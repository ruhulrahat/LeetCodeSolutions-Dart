// The Sort Colors problem is a classic interview question, also known as the Dutch National Flag problem.

// Given an array nums with n objects colored red, white, or blue,
// sort them in-place so that objects of the same color are adjacent, with the colors in the order
//  red (0), white (1), and blue (2).

// You must solve this problem without using the library's sort function.

// Example
// Input:  nums = [2, 0, 2, 1, 1, 0]
// Output: [0, 0, 1, 1, 2, 2]

// Core Idea
// Use three pointers to arrange:
// low: boundary for 0s (start from left)
// high: boundary for 2s (start from right)
// mid: pointer that scans the array

void sortColors(List<int> nums) {
  int low = 0;
  int mid = 0;
  int high = nums.length - 1;

  while (mid <= high) {
    if (nums[mid] == 0) {
      _swap(nums, mid, low);
      mid++;
      low++;
    } else if (nums[mid] == 1) {
      mid++;
    } else {
      _swap(nums, mid, high);
      high--;
    }
  }
}

void _swap(List<int> nums, int i, int j) {
  int temp = nums[i];
  nums[i] = nums[j];
  nums[j] = temp;
}

void main() {
  List<int> colors = [2, 0, 2, 1, 1, 0];
  sortColors(colors);
  print(colors); // Output: [0, 0, 1, 1, 2, 2]
}
