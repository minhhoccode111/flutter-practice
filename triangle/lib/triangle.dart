// ignore_for_file: unused_local_variable

class Triangle {
  Triangle() {
    // TODO:
  }

  bool equilateral(double a, double b, double c) {
    final isValid = a + b > c && b + c > a && c + a > b;
    return (a == b && b == c && c == a) && isValid;
  }

  bool isosceles(double a, double b, double c) {
    final isValid = a + b > c && b + c > a && c + a > b;
    return (a == b || b == c || c == a) && isValid;
  }

  bool scalene(double a, double b, double c) {
    final isValid = a + b > c && b + c > a && c + a > b;
    return isValid && !equilateral(a, b, c) && !isosceles(a, b, c);
  }
}
