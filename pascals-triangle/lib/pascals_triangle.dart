// ignore_for_file: unused_local_variable

class PascalsTriangle {
  PascalsTriangle() {
    // TODO:
  }

  List<List<int>> rows(int n) {
    // init the list to store the result
    List<List<int>> result = [];
    // loop through n rows
    for (var i = 0; i < n; i++) {
      // default value of first col is 1
      final row = <int>[1];
      // start from index 1 because first col is already has value
      for (var j = 1; j <= i; j++) {
        try {
          // access above row
          // same column
          final above = result[i - 1][j];
          // column - 1
          final aboveLeft = result[i - 1][j - 1];
          row.add(above + aboveLeft);
        } catch (e) {
          // if out of range throw, then default 1
          row.add(1);
        }
      }
      result.add(row);
    }
    return result;
  }
}
