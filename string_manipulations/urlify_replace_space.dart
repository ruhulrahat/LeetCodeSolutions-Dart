void main() {
  print(urlifyOptimizedForPerformance(" Mr John Smith "));
}

String urlifySimplest(String input) {
  return input.replaceAll(" ", "%20");
}

String urlifyOptimizedForPerformance(String input) {
  String trimmedInput = input.trim();
  StringBuffer result = StringBuffer();

  for (int i = 0; i < trimmedInput.length; i++) {
    if (trimmedInput[i] == " ") {
      result.write("%20");
    } else {
      result.write(trimmedInput[i]);
    }
  }
  return result.toString().trim();
}
