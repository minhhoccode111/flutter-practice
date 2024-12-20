// ignore_for_file: unused_local_variable

extension ListOps on List {
  void append<T>(List<T> other) {
    for (var item in other) this.add(item);
  }

  List<T> concat<T>() {
    List<T> result = [];

    for (var item in this) {
      for (var i in item) result.add(i);
    }

    return result;
  }

  List<T> filter<T>(bool Function(T elem) predicate) {
    List<T> result = [];
    for (var item in this) if (predicate(item)) result.add(item);
    return result;
  }

  int count() => this.length;

  List<T> myMap<T>(T Function(T elem) fn) {
    List<T> result = [];
    for (var item in this) result.add(fn(item));
    return result;
  }

  U foldl<T, U>(U initial, U Function(U acc, T elem) fn) {
    var result = initial;
    for (var item in this) result = fn(result, item);
    return result;
  }

  U foldr<T, U>(U initial, U Function(T elem, U acc) fn) {
    var result = initial;
    for (var i = this.length - 1; i >= 0; i--) {
      final item = this[i];
      result = fn(item, result);
    }
    return result;
  }

  List<T> reverse<T>() {
    final result = <T>[];
    for (var i = this.length - 1; i >= 0; i--) {
      final item = this[i];
      result.add(item);
    }
    return result;
  }
}
