// Given an integer array nums, move all 0's to the end of it while maintaining
// the relative order of the non-zero elements.
// You must do this in-place without making a copy of the array.

void main() {
  List<int> nums = [0, 1, 0, 3, 12];
  moveZeroes(nums);
  print(nums); // [1, 3, 12, 0, 0]
}

void moveZeroes(List<int> nums) {
  int insertPos = 0;

  // First pass: move all non-zeroes to the front
  for (int i = 0; i < nums.length; i++) {
    if (nums[i] != 0) {
      nums[insertPos] = nums[i];
      insertPos++;
    }
  }

  // Second pass: fill the rest with zeroes
  for (int i = insertPos; i < nums.length; i++) {
    nums[i] = 0;
  }
}

// Same logic, but avoids unnecessary assignments if elements are already in place.

void moveZeroesSwap(List<int> nums) {
  int insertPos = 0;

  for (int i = 0; i < nums.length; i++) {
    if (nums[i] != 0) {
      int temp = nums[i];
      nums[i] = nums[insertPos];
      nums[insertPos] = temp;
      insertPos++;
    }
  }
}
