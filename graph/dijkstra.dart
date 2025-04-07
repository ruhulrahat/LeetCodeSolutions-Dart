class PriorityQueue<T> {
  List<MapEntry<T, int>> heap = [];

  void add(MapEntry<T, int> entry) {
    heap.add(entry);
    heapifyUp(heap.length - 1);
  }

  MapEntry<T, int> removeFirst() {
    if (heap.isEmpty) {
      throw Exception("Queue is empty");
    }
    var first = heap.first;
    heap[0] = heap.last;
    heap.removeLast();
    if (heap.isNotEmpty) {
      heapifyDown(0);
    }
    return first;
  }

  bool get isNotEmpty => heap.isNotEmpty;

  void heapifyUp(int index) {
    while (index > 0) {
      int parentIndex = (index - 1) ~/ 2;
      if (heap[index].value < heap[parentIndex].value) {
        _swap(index, parentIndex);
        index = parentIndex;
      } else {
        break;
      }
    }
  }

  void heapifyDown(int index) {
    int leftChild = 2 * index + 1;
    int rightChild = 2 * index + 2;
    int smallest = index;

    if (leftChild < heap.length && heap[leftChild].value < heap[smallest].value) {
      smallest = leftChild;
    }

    if (rightChild < heap.length && heap[rightChild].value < heap[smallest].value) {
      smallest = rightChild;
    }

    if (smallest != index) {
      _swap(index, smallest);
      heapifyDown(smallest);
    }
  }

  void _swap(int i, int j) {
    var temp = heap[i];
    heap[i] = heap[j];
    heap[j] = temp;
  }
}

class Graph {
  Map<int, List<MapEntry<int, int>>> adjList = {};

  void addEdge(int u, int v, int weight) {
    adjList.putIfAbsent(u, () => []).add(MapEntry(v, weight));
    adjList.putIfAbsent(v, () => []).add(MapEntry(u, weight));
  }

  void dijkstra(int start) {
    Map<int, int> distances = {};
    Map<int, bool> visited = {};
    PriorityQueue<int> pq = PriorityQueue<int>();

    for (var node in adjList.keys) {
      distances[node] = 1 << 30; // Fixed: Use a large int instead of double.infinity
    }
    distances[start] = 0;
    pq.add(MapEntry(start, 0));

    while (pq.isNotEmpty) {
      var current = pq.removeFirst();
      int node = current.key;
      int distance = current.value;

      if (visited[node] == true) continue;
      visited[node] = true;

      for (var neighbor in adjList[node] ?? []) {
        int newDist = (distance + neighbor.value).toInt();
        if (newDist < distances[neighbor.key]!) {
          distances[neighbor.key] = newDist;
          pq.add(MapEntry(neighbor.key, newDist));
        }
      }
    }

    distances.forEach((key, value) {
      print("Shortest Distance to $key: $value");
    });
  }
}

void main() {
  Graph g = Graph();
  g.addEdge(1, 2, 4);
  g.addEdge(1, 3, 1);
  g.addEdge(3, 2, 2);
  g.addEdge(2, 4, 1);
  g.addEdge(3, 4, 5);

  print("Dijkstra's Algorithm Result:");
  g.dijkstra(1);
}
