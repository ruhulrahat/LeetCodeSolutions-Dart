void mergeSort(List<int> list, int left, int right) {
  if (left >= right) return;

  int mid = (left + right) ~/ 2;
  mergeSort(list, left, mid);
  mergeSort(list, mid + 1, right);
  merge(list, left, mid, right);
}

void merge(List<int> list, int left, int mid, int right) {
  int i = left, j = mid + 1;
  List<int> temp = [];

  while (i <= mid && j <= right) {
    if (list[i] <= list[j]) {
      temp.add(list[i++]);
    } else {
      temp.add(list[j++]);
    }
  }

  while (i <= mid) temp.add(list[i++]);
  while (j <= right) temp.add(list[j++]);

  for (int k = 0; k < temp.length; k++) {
    list[left + k] = temp[k];
  }
}

void main() {
  var numbers = [34, 7, 23, 32, 5, 62, 32, 2];
  print("Unsorted: $numbers");
  mergeSort(numbers, 0, numbers.length - 1);
  print("Sorted: $numbers");
}
