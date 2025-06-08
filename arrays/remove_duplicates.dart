//Given an unsorted array nums, remove duplicates so that each element
//appears only once, and return the new length.
//You may return the result in any order, but must not use extra space for another array
//(if strict in-place is required).

void main() {
  List<int> unsorted = [4, 5, 2, 4, 2, 3];
  List<int> copy1 = List.from(unsorted);
  List<int> copy2 = List.from(unsorted);
  List<int> copy3 = List.from(unsorted);

  print("Original array: $unsorted\n");

  //  Using Set (Not in-place)
  List<int> uniqueSetResult = removeDuplicatesUsingSet(copy1);
  print("Using Set (not in-place): $uniqueSetResult");

  //  In-place with sorting (order changes)
  int kSorted = removeDuplicatesInPlaceSorted(copy2);
  print("In-place with sorting: ${copy2.sublist(0, kSorted)}");

  // 3️⃣ Strictly in-place, preserve order (O(n²))
  int kPreserved = removeDuplicatesInPlacePreserveOrder(copy3);
  print("In-place preserve order (O(n²)): ${copy3.sublist(0, kPreserved)}");
}

//
// Using Set (not in-place, keeps first appearance order)
//
List<int> removeDuplicatesUsingSet(List<int> nums) {
  Set<int> seen = {};
  List<int> result = [];

  for (int num in nums) {
    if (!seen.contains(num)) {
      seen.add(num);
      result.add(num);
    }
  }

  return result;
}

//
// In-place with sorting (order changes)
//
int removeDuplicatesInPlaceSorted(List<int> nums) {
  nums.sort(); // May change order
  int writeIndex = 1;

  for (int i = 1; i < nums.length; i++) {
    if (nums[i] != nums[i - 1]) {
      nums[writeIndex] = nums[i];
      writeIndex++;
    }
  }

  return writeIndex;
}

//
// Strictly in-place, preserve order, no Set
//
int removeDuplicatesInPlacePreserveOrder(List<int> nums) {
  int writeIndex = 0;

  for (int i = 0; i < nums.length; i++) {
    bool isDuplicate = false;

    for (int j = 0; j < writeIndex; j++) {
      if (nums[i] == nums[j]) {
        isDuplicate = true;
        break;
      }
    }

    if (!isDuplicate) {
      nums[writeIndex] = nums[i];
      writeIndex++;
    }
  }

  return writeIndex;
}
