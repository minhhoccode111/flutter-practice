// ignore_for_file: unused_field, unused_local_variable

import 'package:binary_search/value_not_found_exception.dart';

class BinarySearch {
  final list;

  BinarySearch(this.list);

  int _find(int n, int left, int right) {
    if (left > right) throw ValueNotFoundException('');
    final mid = (left + right) ~/ 2; // round down to possibly achieve 0
    if (n == list[mid]) return mid;
    if (n > list[mid]) return _find(n, mid + 1, right);
    return _find(n, left, mid - 1);
  }

  find(int n) => _find(n, 0, list.length - 1);
}
