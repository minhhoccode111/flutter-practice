// ignore_for_file: unused_field, unused_local_variable

class AtbashCipher {
  static const String _plain = 'abcdefghijklmnopqrstuvwxyz';
  static const String _cipher = 'zyxwvutsrqponmlkjihgfedcba';
  static RegExp _notAlpha = RegExp(r'([^a-zA-Z0-9]+)');

  AtbashCipher() {
    // TODO:
  }

  String encode(String word) {
    // remove punctuation, and convert to lower case
    var sanitize = '';
    for (var i = 0; i < word.length; i++) {
      final char = word[i];
      sanitize += _notAlpha.hasMatch(char) ? '' : char.toLowerCase();
    }

    // convert
    var result = '';
    for (var i = 0; i < sanitize.length; i++) {
      final char = sanitize[i];
      if (i != 0 && i % 5 == 0) result += ' ';
      final index = _plain.indexOf(char);
      result += index != -1 ? _cipher[index] : char;
    }
    return result;
  }

  String decode(String word) {
    var result = '';
    for (var i = 0; i < word.length; i++) {
      final char = word[i];
      if (char == ' ') continue;
      final index = _cipher.indexOf(char);
      result += index != -1 ? _plain[index] : char;
    }
    return result;
  }
}
