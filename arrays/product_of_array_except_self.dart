// Given an integer array nums, return an array answer such that answer[i] is equal to the
// product of all the elements of nums except nums[i].

// The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.

// You must write an algorithm that runs in O(n) time and without using the division operation

List<int> productExceptSelf(List<int> nums) {
  int n = nums.length;
  List<int> result = List.filled(n, 1);

  // Step 1: Left pass
  int leftProduct = 1;
  for (int i = 0; i < n; i++) {
    result[i] = leftProduct;
    leftProduct *= nums[i];
  }

  // Step 2: Right pass
  int rightProduct = 1;
  for (int i = n - 1; i >= 0; i--) {
    result[i] *= rightProduct;
    rightProduct *= nums[i];
  }

  return result;
}

void main() {
  print(productExceptSelf([1, 2, 3, 4])); // Output: [24, 12, 8, 6]
}

// Left Pass:
// result[i] = product of all nums before i

// [1,     // nothing before index 0
//  1,     // 1
//  1*2,   // 2
//  1*2*3] // 6
// => [1, 1, 2, 6]
// Right Pass:
// Multiply with product of all nums after i

// Start from right:
// i=3: result[3] *= 1 => 6 * 1 = 6
// i=2: result[2] *= 4 => 2 * 4 = 8
// i=1: result[1] *= 4*3 => 1 * 12 = 12
// i=0: result[0] *= 4*3*2 => 1 * 24 = 24

// Final output:
// [24, 12, 8, 6]
