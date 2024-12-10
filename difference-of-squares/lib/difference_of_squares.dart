// ignore_for_file: unused_local_variable

import 'dart:math';

class DifferenceOfSquares {
  DifferenceOfSquares() {
    // TODO:
  }

  int squareOfSum(int n) {
    var sum = 0;
    for (var i = 1; i <= n; i++) sum += i;
    return pow(sum, 2) as int;
  }

  int sumOfSquares(int n) {
    int sum = 0;
    for (var i = 1; i <= n; i++) {
      sum += pow(i, 2) as int;
    }
    return sum;
  }

  int differenceOfSquares(int n) {
    return squareOfSum(n) - sumOfSquares(n);
  }
}
