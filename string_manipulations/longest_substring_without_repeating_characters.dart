// NOTE
// Problem Statement:
// Given a string s, find the length of the longest substring without repeating characters.

// Example:
// Input: "abcabcbb"
// Output: 3  # "abc"

// Input: "bbbbb"
// Output: 1  # "b"

int lengthOfLongestSubstring(String input) {
  int maxLength = 0;
  Map<String, int> charIndex = {};
  int left = 0;
  for (int right = 0; right < input.length; right++) {
    if (charIndex.containsKey(input[right]) &&
        charIndex[input[right]]! >= left) {
      left = charIndex[input[right]]! + 1;
    }

    charIndex[input[right]] = right;
    maxLength = maxLength > (right - left + 1) ? maxLength : (right - left + 1);
  }

  return maxLength;
}

int lengthOfLongestSubstringUsingSet(String input) {
  int maxLength = 0;
  Set<String> seen = {};
  int left = 0;

  for (int right = 0; right < input.length; right++) {
    while (seen.contains(input[right])) {
      seen.remove(input[left]);
      left++;
    }

    seen.add(input[right]);
    maxLength = maxLength > (right - left + 1) ? maxLength : (right - left + 1);
  }

  return maxLength;
}

void main() {
  print(lengthOfLongestSubstringUsingSet("abcabacbb"));
  print(lengthOfLongestSubstringUsingSet("bbbbb"));
}
