void quickSort(List<int> list) {
  if (list.length < 2) return;

  List<int> stack = [0, list.length - 1];

  while (stack.isNotEmpty) {
    int high = stack.removeLast();
    int low = stack.removeLast();

    int pivotIndex = partition(list, low, high);

    if (pivotIndex - 1 > low) {
      stack.addAll([low, pivotIndex - 1]);
    }
    if (pivotIndex + 1 < high) {
      stack.addAll([pivotIndex + 1, high]);
    }
  }
}

int partition(List<int> list, int low, int high) {
  int pivot = list[high];
  int i = low - 1;

  for (int j = low; j < high; j++) {
    if (list[j] < pivot) {
      i++;
      swap(list, i, j);
    }
  }

  swap(list, i + 1, high);
  return i + 1;
}

void swap(List<int> list, int i, int j) {
  int temp = list[i];
  list[i] = list[j];
  list[j] = temp;
}

void main() {
  var numbers = [34, 7, 23, 32, 5, 62, 32, 2];
  print("Unsorted: $numbers");
  quickSort(numbers);
  print("Sorted: $numbers");
}

