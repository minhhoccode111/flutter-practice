// ignore_for_file: unused_local_variable

class MatchingBrackets {
  MatchingBrackets() {
    // TODO:
  }

  bool isMatch(String s1, String s2) {
    return (s1 == '[' && s2 == ']') ||
        (s1 == '(' && s2 == ')') ||
        (s1 == '{' && s2 == '}');
  }

  bool isPaired(String s) {
    final stack = [];
    final openBackets = RegExp(r'\[|\(|\{');
    final closeBackets = RegExp(r'\]|\)|\}');

    for (var i = 0; i < s.length; i++) {
      final currC = s[i];
      if (openBackets.hasMatch(currC))
        stack.add(currC);
      else if (closeBackets.hasMatch(currC)) {
        if (stack.isEmpty) return false;
        final top = stack[stack.length - 1];
        if (isMatch(top, currC))
          stack.removeLast();
        else
          return false;
      }
    }

    // if there are still elements left in the stack then it's not a pair
    if (stack.isNotEmpty) return false;

    return true;
  }
}
