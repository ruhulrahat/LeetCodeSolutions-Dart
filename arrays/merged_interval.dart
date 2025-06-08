// You are given:
// A list of possibly unsorted intervals, possibly with overlaps
// You must:
// Sort intervals
// Merge all overlapping intervals
// Return a new merged, sorted, non-overlapping list

// Example:
// Input:
// intervals = [[1,3],[2,6],[8,10],[15,18]]
// Output:
// [[1,6],[8,10],[15,18]]

// Key Concepts:
// You sort by start
// Then merge overlaps using linear scan
// Useful when intervals are already messed up

List<List<int>> mergeIntervals(List<List<int>> intervals) {
  if (intervals.isEmpty) {
    return [];
  }
  // Step 1: Sort intervals by start time
  intervals.sort((a, b) => a[0].compareTo(b[0]));

  List<List<int>> merged = [];
  merged.add(intervals[0]);

  // Step 2: Merge overlapping intervals
  for (int i = 1; i < intervals.length; i++) {
    List<int> current = intervals[i];
    List<int> last = merged.last;

    if (last[1] >= current[0]) {
      // There is overlap → merge
      last[1] = last[1] > current[1] ? last[1] : current[1];
    } else {
      // No overlap → add as is
      merged.add(current);
    }
  }

  return merged;
}

void main() {
  List<List<int>> input = [
    [1, 3],
    [2, 6],
    [8, 10],
    [15, 18]
  ];
  var result = mergeIntervals(input);
  print(result);
}
