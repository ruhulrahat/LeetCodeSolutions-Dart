// The task is to find the first character in a string that does not repeat anywhere.

// firstNonRepeatingChar("swiss");  // Output: 'w'
// firstNonRepeatingChar("racecars");  // Output: 'e'
// firstNonRepeatingChar("aabb");  // Output: ''

String firstNonRepeatingChar(String s) {
  Map<String, int> charToCount = Map<String, int>();
  for (int i = 0; i < s.length; i++) {
    charToCount[s[i]] = (charToCount[s[i]] ?? 0) + 1;
  }
  for (int i = 0; i < s.length; i++) {
    if (charToCount[s[i]] == 1) {
      return s[i];
    }
  }
  return '';
}

void main() {
  print(firstNonRepeatingChar("swiss")); // Output: 'w'
  print(firstNonRepeatingChar("racecars")); // Output: 'e'
  print(firstNonRepeatingChar("aabb")); // Output: ''
}
