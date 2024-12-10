// ignore_for_file: unused_local_variable

class Proverb {
  Proverb() {
    // TODO:
  }

  String recite(List<String> s) {
    var result = '';

    if (s.length == 0) {
      return result;
    }

    for (var i = 0; i < s.length - 1; i++) {
      result += 'For want of a ${s[i]} the ${s[i + 1]} was lost.\n';
    }
    result += 'And all for the want of a ${s[0]}.';
    return result;
  }
}
