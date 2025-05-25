// Given an integer array nums, return all triplets [nums[i], nums[j], nums[k]] such that:
// i != j, j != k, i != k
// nums[i] + nums[j] + nums[k] == 0
// No duplicate triplets in result

// Optimal Strategy
// Sort the array
// Fix one element (nums[i])
// Use two pointers to find nums[j] + nums[k] = -nums[i]
// Skip duplicates

// Time: O(n²) — nested loop with two pointers
// Space: O(log n) for sorting or O(n) total if output stored

List<List<int>> threeSum(List<int> nums) {
  nums.sort(); // Sort array first
  List<List<int>> result = [];

  for (int i = 0; i < nums.length - 2; i++) {
    if (i > 0 && nums[i] == nums[i - 1]) continue; // Skip duplicate i

    int left = i + 1;
    int right = nums.length - 1;

    while (left < right) {
      int sum = nums[i] + nums[left] + nums[right];

      if (sum == 0) {
        result.add([nums[i], nums[left], nums[right]]);

        // Skip duplicate left/right values
        while (left < right && nums[left] == nums[left + 1]) left++;
        while (left < right && nums[right] == nums[right - 1]) right--;

        left++;
        right--;
      } else if (sum < 0) {
        left++; // Need bigger sum
      } else {
        right--; // Need smaller sum
      }
    }
  }

  return result;
}

void main() {
  List<int> nums1 = [-1, 0, 1, 2, -1, -4];
  print(threeSum(nums1));
  // Output: [[-1, -1, 2], [-1, 0, 1]]

  List<int> nums2 = [0, 1, 1];
  print(threeSum(nums2));
  // Output: []

  List<int> nums3 = [0, 0, 0];
  print(threeSum(nums3));
  // Output: [[0, 0, 0]]

  print("Indices version:");
  print(
      threeSumIndices([-1, 0, 1, 2, -1, -4])); // Might return [[0, 1, 2], ...]
}

List<List<int>> threeSumIndices(List<int> nums) {
  List<int> sortedIndices = List.generate(nums.length, (i) => i);
  sortedIndices.sort((a, b) => nums[a].compareTo(nums[b]));
  nums.sort(); // Sort values for two-pointer

  List<List<int>> result = [];

  for (int i = 0; i < nums.length - 2; i++) {
    if (i > 0 && nums[i] == nums[i - 1]) continue;

    int left = i + 1;
    int right = nums.length - 1;

    while (left < right) {
      int sum = nums[i] + nums[left] + nums[right];
      if (sum == 0) {
        // Map back to original indices
        List<int> triplet = [
          sortedIndices[i],
          sortedIndices[left],
          sortedIndices[right]
        ]..sort(); // sorted to avoid duplicate orders
        if (!result.any((r) =>
            r[0] == triplet[0] && r[1] == triplet[1] && r[2] == triplet[2])) {
          result.add(triplet);
        }

        left++;
        right--;
        while (left < right && nums[left] == nums[left - 1]) left++;
        while (left < right && nums[right] == nums[right + 1]) right--;
      } else if (sum < 0) {
        left++;
      } else {
        right--;
      }
    }
  }

  return result;
}
