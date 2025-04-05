// ignore_for_file: unused_local_variable

class BeerSong {
  BeerSong() {
    // TODO:
  }

  List<String> helper(int n) {
    final result = <String>[];

    if (n == 0) {
      result
          .add('No more bottles of beer on the wall, no more bottles of beer.');
      result.add(
          'Go to the store and buy some more, 99 bottles of beer on the wall.');
    } else if (n == 1) {
      result.add('1 bottle of beer on the wall, 1 bottle of beer.');
      result.add(
          'Take it down and pass it around, no more bottles of beer on the wall.');
    } else if (n == 2) {
      result.add('2 bottles of beer on the wall, 2 bottles of beer.');
      result.add(
          'Take one down and pass it around, 1 bottle of beer on the wall.');
    } else {
      result.add('$n bottles of beer on the wall, $n bottles of beer.');
      result.add(
          'Take one down and pass it around, ${n - 1} bottles of beer on the wall.');
    }
    return result;
  }

  List<String> recite(int n, int m) {
    var result = <String>[];
    while (m > 0 && n >= 0) {
      result = [...result, ...helper(n), ''];
      n--;
      m--;
    }
    result.removeLast();
    return result;
  }
}
