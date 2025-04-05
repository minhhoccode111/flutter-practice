// ignore_for_file: unused_local_variable

class Pangram {
  Pangram() {
    // TODO:
  }

  bool isPangram(String s) {
    s = s.toLowerCase();

    final reg = [
      RegExp(r'a'),
      RegExp(r'b'),
      RegExp(r'c'),
      RegExp(r'd'),
      RegExp(r'e'),
      RegExp(r'f'),
      RegExp(r'g'),
      RegExp(r'h'),
      RegExp(r'i'),
      RegExp(r'j'),
      RegExp(r'k'),
      RegExp(r'l'),
      RegExp(r'm'),
      RegExp(r'n'),
      RegExp(r'o'),
      RegExp(r'p'),
      RegExp(r'q'),
      RegExp(r'r'),
      RegExp(r's'),
      RegExp(r't'),
      RegExp(r'u'),
      RegExp(r'v'),
      RegExp(r'w'),
      RegExp(r'x'),
      RegExp(r'y'),
      RegExp(r'z'),
    ];

    return reg.every((re) => re.hasMatch(s));
  }
}
