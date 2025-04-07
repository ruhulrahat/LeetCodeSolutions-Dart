class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;

  TreeNode(this.val, {this.left, this.right});
}

void inOrder(TreeNode? node) {
  if (node == null) {
    return;
  }
  inOrder(node.left);
  print(node.val);
  inOrder(node.right);
}

void main() {
  // Example Tree:
  //       4
  //      / \
  //     2   7
  //    / \ / \
  //   1  3 6  9

  TreeNode root = TreeNode(4,
      left: TreeNode(2, left: TreeNode(1), right: TreeNode(3)),
      right: TreeNode(7, left: TreeNode(6), right: TreeNode(9)));
  print("Original Tree:");
  inOrder(root);
}
