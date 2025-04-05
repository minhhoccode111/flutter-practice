// ignore_for_file: unused_local_variable, unused_element

class RotationalCipher {
  RotationalCipher() {
    // TODO:
  }

  static final notAlpha = RegExp('[^a-zA-Z]');

  static const table = [
    'a',
    'b',
    'c',
    'd',
    'e',
    'f',
    'g',
    'h',
    'i',
    'j',
    'k',
    'l',
    'm',
    'n',
    'o',
    'p',
    'q',
    'r',
    's',
    't',
    'u',
    'v',
    'w',
    'x',
    'y',
    'z',
  ];

  bool _isUpper(String s) => s == s.toUpperCase();

  String rotate({required String text, required int shiftKey}) {
    var result = '';

    text.split('').forEach((char) {
      if (notAlpha.hasMatch(char)) {
        result += char;
        return;
      }

      final isUpper = _isUpper(char);

      final cipher =
          table[(table.indexOf(char.toLowerCase()) + shiftKey) % table.length];

      result += isUpper ? cipher.toUpperCase() : cipher;
    });

    return result;
  }
}
