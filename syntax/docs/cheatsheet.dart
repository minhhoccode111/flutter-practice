// imports

// top level main where execution starts
void main() {
  print('Hello, World!');

  void nullableVariables() {
    // nullable variables
    // int a = null; // invalid
    int? a = null; // valid

    int? b; // initial value of b is null
  }

  void nullAwareOperators() {
    // null-aware operators
    int? a; // = null

    a ??= 3;
    print(a); // output: 3

    a ??= 5;
    print(a); // output: 3
  }

  void conditionalPropertyAccess() {
    // like in javascript
    var a;
    a?.someProperty;

    (a != null) ? a.someProperty : null; // equivalent
  }

  void collectionLiterals() {
    // List<String>
    final aListOfString = ['one', 'two', 'three'];
    // Set<String>
    final aSetOfString = {'one', 'two', 'three'};
    // Map<String, int>
    final aMapOfString = {'one': 1, 'two': 2, 'three': 3};
  }

  bool arrowSyntax = [1, 2, 3].any((n) => n > 2);

  void cascades() {
    /// to perform a sequence of operations on the same object use `..`
    var a;

    a..someMethod();
  }
}
