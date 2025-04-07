//NOTE
//
//
//Given a string s, determine if it has all unique characters.
//Return true if all characters are unique, otherwise return false.

// NOTE Using a Set (Easy Approach)

bool hasUniqueCharacterUsingSet(String inputString) {
  Set<String> seen = {};

  for (var character in inputString.split("")) {
    if (seen.contains(character)) {
      return false;
    }
    seen.add(character);
  }

  return true;
}

bool hasUniqueCharacterUsingSorting(String inputString) {
  List<String> sortedString = inputString.split("")..sort();

  for (int i = 0; i < sortedString.length - 1; i++) {
    if (sortedString[i] == sortedString[i + 1]) {
      return false;
    }
  }

  return true;
}

void main() {
  print(hasUniqueCharacterUsingSorting("abcdefg"));
  print(hasUniqueCharacterUsingSorting("hello"));
}
