// ignore_for_file: unused_local_variable

class PrimeFactors {
  List<int> factors(int n) {
    final result = <int>[];

    var pointer = 2;

    while (n != 1) {
      if (n % pointer == 0) {
        n ~/= pointer;
        result.add(pointer);
      } else
        pointer++;
    }

    return result;
  }
}
