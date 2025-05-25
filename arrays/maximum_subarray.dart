// Given an integer array nums, find the subarray with the largest sum, and return its sum.

// Example 1:

// Input: nums = [-2,1,-3,4,-1,2,1,-5,4]
// Output: 6
// Explanation: The subarray [4,-1,2,1] has the largest sum 6.
// Example 2:

// Input: nums = [1]
// Output: 1
// Explanation: The subarray [1] has the largest sum 1.
// Example 3:

// Input: nums = [5,4,-1,7,8]
// Output: 23
// Explanation: The subarray [5,4,-1,7,8] has the largest sum 23.

int maxSubArray(List<int> nums) {
  int maxSum = nums[0];
  int currentSum = nums[0];

  for (int i = 1; i < nums.length; i++) {
    currentSum =
        nums[i] > (currentSum + nums[i]) ? nums[i] : (currentSum + nums[i]);
    maxSum = currentSum > maxSum ? currentSum : maxSum;
  }

  return maxSum;
}

void main() {
  print(maxSubArray([-2, 1, -3, 4, -1, 2, 1, -5, 4])); // Output: 6
  print(maxSubArray([1])); // Output: 1
  print(maxSubArray([5, 4, -1, 7, 8])); // Output: 23

  final result1 = maxSubArrayWithElements([-2, 1, -3, 4, -1, 2, 1, -5, 4]);
  final result2 = maxSubArrayWithElements([1]);
  final result3 = maxSubArrayWithElements([5, 4, -1, 7, 8]);

  print(
      "Example 1 -> Max Sum: ${result1['max_sum']}, Subarray: ${result1['subarray']}");
  print(
      "Example 2 -> Max Sum: ${result2['max_sum']}, Subarray: ${result2['subarray']}");
  print(
      "Example 3 -> Max Sum: ${result3['max_sum']}, Subarray: ${result3['subarray']}");
}

Map<String, dynamic> maxSubArrayWithElements(List<int> nums) {
  int maxSum = nums[0];
  int currentSum = nums[0];
  int start = 0, end = 0, tempStart = 0;

  for (int i = 1; i < nums.length; i++) {
    if (nums[i] > currentSum + nums[i]) {
      currentSum = nums[i];
      tempStart = i;
    } else {
      currentSum += nums[i];
    }

    if (currentSum > maxSum) {
      maxSum = currentSum;
      start = tempStart;
      end = i;
    }
  }

  return {
    'max_sum': maxSum,
    'subarray': nums.sublist(start, end + 1),
    'start_index': start,
    'end_index': end
  };
}
