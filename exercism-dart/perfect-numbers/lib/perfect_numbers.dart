// define the Classification enum

// ignore_for_file: unused_local_variable

enum Classification { perfect, abundant, deficient }

class PerfectNumbers {
  PerfectNumbers() {
    // TODO:
  }

  Classification classify(int n) {
    // create an array from 1 to n-1
    final arr = List.generate(n - 1, (index) => index + 1);
    final result = [];
    for (var i = 0; i < arr.length; i++) {
      if (n % arr[i] == 0) result.add(arr[i]);
    }

    // work like array.reduce in js
    int sum = result.fold(0, (prev, curr) {
      return prev + curr as int;
    });

    if (sum == n) return Classification.perfect;
    if (sum > n) return Classification.abundant;
    return Classification.deficient;
  }
}
