// ignore_for_file: unused_local_variable

class SumOfMultiples {
  SumOfMultiples() {
    // TODO:
  }

  int sum(List<int> items, int level) {
    final Set<int> set = <int>{0}; // init value

    for (final item in items) {
      if (item == 0) continue; // infinite loop
      var tmp = item;
      while (tmp < level) {
        set.add(tmp);
        tmp += item;
      }
    }

    // sum set
    return set.reduce((value, element) => value + element);
  }
}
