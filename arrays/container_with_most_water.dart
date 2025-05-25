// Given an integer array height of length n, where each element represents the height of a vertical line drawn at position i,
// Find two lines such that together with the x-axis they form a container that holds the most water.

// Input:  height = [1,8,6,2,5,4,8,3,7]
// Output: 49
// Explanation: The lines at index 1 and 8 form the max container:
// Width = 8 - 1 = 7, Height = min(8,7) = 7, Area = 7 * 7 = 49

// Input: height = [1,1]
// Output: 1

int maxArea(List<int> height) {
  int left = 0;
  int right = height.length - 1;
  int maxWater = 0;

  while (left < right) {
    int h = height[left] < height[right] ? height[left] : height[right];
    int w = right - left;
    int area = h * w;

    if (area > maxWater) {
      maxWater = area;
    }

    // Move the pointer at the shorter line inward
    if (height[left] < height[right]) {
      left++;
    } else {
      right--;
    }
  }

  return maxWater;
}

void main() {
  print(maxArea([1, 8, 6, 2, 5, 4, 8, 3, 7])); // Output: 49
  print(maxArea([1, 1])); // Output: 1
  print(maxArea([4, 3, 2, 1, 4])); // Output: 16
  print(maxArea([1, 2, 1])); // Output: 2

  final result = maxAreaWithIndices([1, 8, 6, 2, 5, 4, 8, 3, 7]);
  print("Max Area: ${result['max_area']}");
  print("Indices: ${result['indices']}");
  print("Heights: ${result['heights']}");
  print("Width: ${result['width']}");
  print("Min Height: ${result['min_height']}");
}

Map<String, dynamic> maxAreaWithIndices(List<int> height) {
  int left = 0;
  int right = height.length - 1;
  int maxWater = 0;
  int maxLeft = 0;
  int maxRight = 0;

  while (left < right) {
    int h = height[left] < height[right] ? height[left] : height[right];
    int w = right - left;
    int area = h * w;

    if (area > maxWater) {
      maxWater = area;
      maxLeft = left;
      maxRight = right;
    }

    // Move the shorter line inward
    if (height[left] < height[right]) {
      left++;
    } else {
      right--;
    }
  }

  return {
    'max_area': maxWater,
    'indices': [maxLeft, maxRight],
    'heights': [height[maxLeft], height[maxRight]],
    'width': maxRight - maxLeft,
    'min_height':
        height[maxLeft] < height[maxRight] ? height[maxLeft] : height[maxRight]
  };
}
