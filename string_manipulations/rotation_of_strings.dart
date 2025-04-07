// Check If One String is a Rotation of Another
// A string S1 is a rotation of another string S2 if S2 can be obtained by shifting S1 circularly.

// 💡 Example
// ✔ Rotation: "waterbottle" → "erbottlewat"
// ❌ Not a Rotation: "hello" → "loleh"

bool isRotationBruteForce(String s1, String s2) {
  if (s1.length != s2.length) {
    return false;
  }

  // Time Complexity: O(n 2 ) (creating n substrings, each of size n)
  // Space Complexity: O(n) (storing rotated strings)
  for (int i = 0; i < s1.length; i++) {
    String rotated = s1.substring(i) + s1.substring(0, i);
    if (s2 == rotated) {
      return true;
    }
  }
  return false;
}

// Time Complexity: O(n) (substring search is efficient)
// Space Complexity: O(n) (for doubleS1)
bool isRotation(String s1, String s2) {
  if (s1.length != s2.length) {
    return false;
  }
  String s1Double = s1 + s1;
  if (s1Double.contains(s2)) {
    return true;
  }

  return false;
}

void main() {
  print(isRotationBruteForce("waterbottle", "erbottlewat")); // true
  print(isRotationBruteForce("hello", "loleh")); // false

  print(isRotation("waterbottle", "erbottlewat")); // true
  print(isRotation("hello", "loleh")); // false
}
