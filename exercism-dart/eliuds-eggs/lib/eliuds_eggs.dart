// ignore_for_file: unused_local_variable

class EggCounter {
  EggCounter() {
    // TODO:
  }

  int count(int n) {
    final binary = n.toRadixString(2);
    var count = 0;
    binary.split('').forEach((char) => char == '1' ? count++ : null);
    return count;
  }
}

