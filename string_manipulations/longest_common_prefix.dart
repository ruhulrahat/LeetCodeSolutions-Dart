// The Longest Common Prefix (LCP) is the longest starting sequence
// of characters shared by all strings in an array.
// ["flower", "flow", "flight"] → "fl"
// ["dog", "racecar", "car"] → ""

// Sorting + Comparing First & Last (O(m log n))
//  Faster for large datasets
//  Compares only first & last string after sorting

String longestCommonPrefixBySortAndCompareFirstAndLast(List<String> input) {
  if (input.isEmpty) return "";
  input.sort();

  String first = input.first;
  String last = input.last;

  int i = 0;
  while (i < first.length && first[i] == last[i]) {
    i++;
  }
  return first.substring(0, i);
}

void main() {
  print(longestCommonPrefixBySortAndCompareFirstAndLast(
      ["flower", "flow", "flight"])); // "fl"
  print(longestCommonPrefixBySortAndCompareFirstAndLast(
      ["dog", "racecar", "car"])); // ""
}
