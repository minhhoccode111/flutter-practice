// ignore_for_file: unused_local_variable

class RnaTranscription {
  RnaTranscription() {
    // TODO:
  }

  String toRna(String s) {
    const table = {
      'G': 'C',
      'C': 'G',
      'T': 'A',
      'A': 'U',
    };

    var result = '';

    s.split('').forEach((char) => result += table[char]!);

    return result;
  }
}
