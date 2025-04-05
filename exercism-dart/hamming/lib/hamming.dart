// ignore_for_file: unused_local_variable

class Hamming {
  Hamming() {
    // TODO:
  }

  int distance(String a, String b) {
    if (a.length != b.length) {
      throw new ArgumentError('strands must be of equal length');
    }

    var count = 0;

    for (var i = 0; i < a.length; i++) {
      var charA = a[i];
      var charB = b[i];
      if (charA != charB) count++;
    }

    return count;
  }
}
