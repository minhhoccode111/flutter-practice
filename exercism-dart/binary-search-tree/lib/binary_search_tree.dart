// ignore_for_file: unused_local_variable, unused_element

class Node {
  Node(String data) {
    this.data = data;
  }

  late final data;
  Node? left = null;
  Node? right = null;

  get value => int.parse(this.data);
}

class BinarySearchTree {
  BinarySearchTree(String s) {
    root = Node(s);
  }

  late final root;

  // can only be inserted at leaf
  Node? _insert(Node? root, Node newNode) {
    if (root == null) return newNode;

    // go right if new node is greater
    if (newNode.value > root.value) {
      root.right = _insert(root.right, newNode);
    }
    // go left if new node is less or equal
    else {
      root.left = _insert(root.left, newNode);
    }

    // else return the root for the previous root.left/right to catch
    return root;
  }

  insert(String s) {
    final root = this.root;
    final newNode = Node(s);
    _insert(root, newNode);
  }

  // in-order traversal to get the items sorted
  _sortedData(Node? root, List<String> result) {
    // if current node is null, then do nothing
    if (root == null) return;

    // else traverse
    _sortedData(root.left, result); // left
    result.add(root.data); // mid
    _sortedData(root.right, result); // right
  }

  // the test cases use like getter instead of calling it directly
  List<String> get sortedData {
    // get the root
    final root = this.root;
    // define the empty to store items
    final result = <String>[];
    // call to get items into the result array
    _sortedData(root, result);
    // return the result array
    return result;
  }
}
