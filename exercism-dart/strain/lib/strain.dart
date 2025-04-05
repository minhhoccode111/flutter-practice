class Strain {
  Strain() {
    // TODO:
  }

  keep(var values, Function fn) {
    var result = [];
    for (var item in values) if (fn(item)) result.add(item);
    return result;
  }

  discard(var values, Function fn) {
    var result = [];
    for (var item in values) if (!fn(item)) result.add(item);
    return result;
  }
}
