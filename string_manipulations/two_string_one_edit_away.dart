// We need to check if two strings are at most one edit apart, where an edit is:

// Insertion of a character
// Deletion of a character
// Replacement of a character
// ✅ Allowed edits: "pale" → "ple" (deletion), "pale" → "pales" (insertion), "pale" → "bale" (replacement)

bool isOneEditAway(String s1, String s2) {
  int len1 = s1.length, len2 = s2.length;

  // More than one length difference means >1 edit
  if ((len1 - len2).abs() > 1) return false;

  // Identify shorter and longer string
  String shorter = len1 < len2 ? s1 : s2;
  String longer = len1 < len2 ? s2 : s1;

  int i = 0, j = 0;
  bool foundDifference = false;

  while (i < shorter.length && j < longer.length) {
    if (shorter[i] != longer[j]) {
      if (foundDifference) return false; // More than one edit
      foundDifference = true;

      // If lengths are different, move pointer in the longer string
      if (len1 != len2) j++;
    }

    // Move both pointers if characters match or lengths are same
    i++;
    j++;
  }

  return true;
}

void main() {
  print(isOneEditAway("pale", "ple")); // true (deletion)
  print(isOneEditAway("pales", "pale")); // true (insertion)
  print(isOneEditAway("pale", "bale")); // true (replacement)
  print(isOneEditAway("pale", "bake")); // false (two replacements)
}
