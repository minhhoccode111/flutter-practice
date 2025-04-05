class CollatzConjecture {
  CollatzConjecture() {
    // TODO:
  }

  // int steps(double n) {
  //   if (n < 1) throw new ArgumentError('Only positive integers are allowed');
  //   double steps = 0;
  //   while (n != 1) {
  //     steps++;
  //     if (n % 2 == 0)
  //       n = (n / 2);
  //     else
  //       n = n * 3 + 1;
  //   }
  //   return steps;
  // }

  // recursion
  int steps(double n, [int step = 0]) {
    if (n < 1) throw new ArgumentError('Only positive integers are allowed');
    if (n == 1) return step;
    if (n % 2 == 0) return steps(n / 2, step + 1);
    return steps(n * 3 + 1, step + 1);
  }
}
