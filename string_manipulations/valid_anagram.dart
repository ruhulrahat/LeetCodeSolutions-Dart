// NOTE
// Given two strings s and t, return true if t is an anagram of s, and false otherwise.

// Example:
// Input: ("anagram", "nagaram")
// Output: True

// Input: ("rat", "car")
// Output: False

// Time Complexity: O(nlogn) (sorting both strings)
// Space Complexity: O(n) (storing sorted lists)


bool isAnagramUnoptimized(String s, String t) {
  if (s.length != t.length) {
    return false;
  }
  List<String> sChars = s.split("")..sort();
  List<String> tChars = t.split("")..sort();

  return sChars.join() == tChars.join();
}

// Time Complexity: O(n) (single pass over strings) 
// Space Complexity: O(1) (at most 26 keys for lowercase letters)
bool isAnagramOptimized(String s, String t) {
  if (s.length != t.length) {
    return false;
  }
  Map<String, int> charToCount = {};

  for (int i = 0; i < s.length; i++) {
    charToCount[s[i]] = (charToCount[s[i]] ?? 0) + 1;
    charToCount[t[i]] = (charToCount[t[i]] ?? 0) - 1;
  }
  return charToCount.values.every((item) => item == 0);
}

void main() {
  print(isAnagramUnoptimized("listen", "silent")); // true
  print(isAnagramUnoptimized("hello", "world")); // false

  print(isAnagramOptimized("listen", "silent")); // true
  print(isAnagramOptimized("hello", "world")); // false
}
