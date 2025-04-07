// Reversing a string in-place means modifying the original data structure
// without using extra space for another string. Since Dart strings are immutable,
//  we must use a mutable data structure (like List<String>).

// Two-Pointer Approach (Efficient)
// Swaps characters from both ends until the middle
// Time Complexity: O(n)
// Space Complexity: O(1) (modifies the list in-place)

String getReversedString(String input) {
  List<String> inputList = input.split("");

  int left = 0, right = inputList.length - 1;
  String temp = "";

  while (left < right) {
    temp = inputList[left];
    inputList[left] = inputList[right];
    inputList[right] = temp;
    left++;
    right--;
  }
  return inputList.join("");
}

void main() {
  print(getReversedString("hello"));
  print(getReversedWords("dart is awesome"));
}

String getReversedWords(String input) {
  List<String> inputList = input.split(" ");

  int left = 0, right = inputList.length - 1;
  String temp = "";

  while (left < right) {
    temp = inputList[left];
    inputList[left] = inputList[right];
    inputList[right] = temp;
    left++;
    right--;
  }
  return inputList.join(" ");
}


// Two-Pointer Approach: True in-place reversal (O(n), O(1)) 
//  reversed.join(''): Simple, but not in-place (O(n), O(n))