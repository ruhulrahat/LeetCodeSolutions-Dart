// You are given two sorted integer arrays nums1 and nums2, and two integers m and n, representing the number of elements in nums1 and nums2 respectively.

// Merge nums2 into nums1 as one sorted array.

// The final sorted array should not be returned, but instead be stored inside nums1.
// You can assume that nums1 has enough space (size m + n) to hold additional elements from nums2.

// Input:
// nums1 = [1,2,3,0,0,0], m = 3
// nums2 = [2,5,6],       n = 3

// Output: [1,2,2,3,5,6]

// Time	O(m + n)
// Space	O(1) (in-place)

void mergeSortedArray(List<int> nums1, int m, List<int> nums2, int n) {
  int i = m - 1; // last index of actual nums1
  int j = n - 1; // last index of nums2
  int k = m + n - 1; // last index of nums1 (total size)

  while (i >= 0 && j >= 0) {
    if (nums1[i] > nums2[j]) {
      nums1[k] = nums1[i];
      i--;
    } else {
      nums1[k] = nums2[j];
      j--;
    }
    k--;
  }

  // If any elements left in nums2
  while (j >= 0) {
    nums1[k] = nums2[j];
    j--;
    k--;
  }
}

void main() {
  List<int> nums1 = [1, 2, 3, 0, 0, 0];
  List<int> nums2 = [2, 5, 6];
  int m = 3, n = 3;

  mergeSortedArray(nums1, m, nums2, n);
  print(nums1); // [1, 2, 2, 3, 5, 6]
}

List<int> mergeSortedArraysNew(List<int> nums1, List<int> nums2) {
  int i = 0, j = 0;
  List<int> merged = [];

  while (i < nums1.length && j < nums2.length) {
    if (nums1[i] <= nums2[j]) {
      merged.add(nums1[i]);
      i++;
    } else {
      merged.add(nums2[j]);
      j++;
    }
  }

  // Add remaining elements
  while (i < nums1.length) {
    merged.add(nums1[i]);
    i++;
  }

  while (j < nums2.length) {
    merged.add(nums2[j]);
    j++;
  }

  return merged;
}
