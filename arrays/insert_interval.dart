// You are given an array of non-overlapping intervals
//intervals where intervals[i] = [starti, endi] represent the start and the end of the ith interval
// and intervals is sorted in ascending order by starti.
//You are also given an interval newInterval = [start, end] that represents the start and end of another interval.

// Insert newInterval into intervals such that intervals
//is still sorted in ascending order by starti and intervals still does not have any
// overlapping intervals (merge overlapping intervals if necessary).

// Return intervals after the insertion.

// Note that you don't need to modify intervals in-place. You can make a new array and return it.

// Problem Summary
// You are given:

// A sorted list of non-overlapping intervals: intervals = [[start1, end1], [start2, end2], ...]

// A new interval: newInterval = [start, end]

// Goal:
// Insert newInterval into intervals and merge if overlapping, so the result is:

// Still sorted

// Still non-overlapping

import 'dart:math';

List<List<int>> insertInterval(
    List<List<int>> intervals, List<int> newInterval) {
  List<List<int>> result = [];

  for (var interval in intervals) {
    if (interval[1] < newInterval[0]) {
      // Case 1: Current ends before new starts → safe to add
      result.add(interval);
    } else if (interval[0] > newInterval[1]) {
      // Case 2: Current starts after new ends → add new, replace it with current
      result.add(newInterval);
      newInterval = interval;
    } else {
      // Case 3: Overlap → merge intervals
      newInterval[0] = min(newInterval[0], interval[0]);
      newInterval[1] = max(newInterval[1], interval[1]);
    }
  }

  // Add the final merged interval
  result.add(newInterval);
  return result;
}

void main() {
  print(insertInterval([
    [1, 3],
    [6, 9]
  ], [
    2,
    5
  ]));
  // Output: [[1, 5], [6, 9]]

  print(insertInterval([
    [1, 2],
    [3, 5],
    [6, 7],
    [8, 10],
    [12, 16]
  ], [
    4,
    8
  ]));
  // Output: [[1, 2], [3, 10], [12, 16]]
}
