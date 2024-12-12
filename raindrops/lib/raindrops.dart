// ignore_for_file: unused_local_variable

class Raindrops {
  Raindrops() {
    // TODO:
  }

  String convert(int n) {
    var result = '';

    if (n % 3 == 0) result += 'Pling';

    if (n % 5 == 0) result += 'Plang';

    if (n % 7 == 0) result += 'Plong';

    return result == '' ? '$n' : result;
  }
}
