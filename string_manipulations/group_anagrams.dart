// Two words are anagrams if they contain the same characters but in a different order.
// Example:

// Anagrams: "eat", "tea", "ate"
// Not Anagrams: "bat", "tab", "cat"

// Time Complexity: O(n⋅klogk)
// O(klogk) for sorting each word (k is word length).
// O(n) for iterating over n words.
// Space Complexity: O(n⋅k)

List<List<String>> groupAnagrams(List<String> inputList) {
  Map<String, List<String>> charMap = {};

  for (int i = 0; i < inputList.length; i++) {
    String sortedWord =
        String.fromCharCodes(inputList[i].runes.toList()..sort());
    charMap.putIfAbsent(sortedWord, () => []);
    charMap[sortedWord]!.add(inputList[i]);
  }
  return charMap.values.toList();
}



// Time Complexity:  O(nk) (where n = words, k = max word length) 
// O(k) for counting frequencies (instead of O(k log k) sorting) 
// O(n) for iterating over words
//  Space Complexity: O(nk) (storing grouped words in HashMap)

List<List<String>> groupAnagramsOptimized(List<String> inputList) {
  Map<String, List<String>> anagramGroups = {};
  for (String word in inputList) {
    String key = _generateKey(word);
    anagramGroups.putIfAbsent(key, () => []).add(word);
  }
  return anagramGroups.values.toList();
}

String _generateKey(String word) {
  List<int> charCount = List.filled(26, 0);

  for (int i = 0; i < word.length; i++) {
    charCount[word.codeUnitAt(i) - 'a'.codeUnitAt(0)]++;
  }
  return charCount.join('');
}

void main() {
  print(groupAnagrams(["eat", "tea", "tan", "ate", "nat", "bat"]));
  // Output: [["eat", "tea", "ate"], ["tan", "nat"], ["bat"]]

  print(groupAnagramsOptimized(["eat", "tea", "tan", "ate", "nat", "bat"]));
  // Output: [["eat", "tea", "ate"], ["tan", "nat"], ["bat"]]
}
