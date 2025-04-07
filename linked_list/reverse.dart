import 'dart:io';

class Node {
  int value;
  Node? next;

  Node(this.value, {this.next});
}

Node? reverseLinkedList(Node? head) {
  Node? prev = null;
  Node? current = head;
  Node? next = null;

  while (current != null) {
    next = current.next;
    current.next = prev;
    prev = current;
    current = next;
  }
  return prev;
}

void printLinkedList(Node? head) {
  Node? temp = head;
  while (temp != null) {
    stdout.write('${temp.value} ');
    temp = temp.next;
  }
  stdout.writeln();
}

void main() {
  stdout.write("Enter number of elements in the linked list: ");
  int n = int.parse(stdin.readLineSync()!);

  stdout.write("Enter elements of linked list: ");
  List<int> values = stdin.readLineSync()!.split(' ').map(int.parse).toList();

  Node? head = null;
  Node? temp = null;

  for (int value in values) {
    if (head == null) {
      head = Node(value);
      temp = head;
    } else {
      temp!.next = Node(value);
      temp = temp.next;
    }
  }

  stdout.write("Original Linked List: ");
  printLinkedList(head);

  Node? reversedHead = reverseLinkedList(head);

  stdout.write("Reversed Linked List: ");
  printLinkedList(reversedHead);
}
