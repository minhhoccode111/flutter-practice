// Implement a custom InvalidNucleotideException exception

// ignore_for_file: unused_local_variable

class InvalidNucleotideException implements Exception {}

class NucleotideCount {
  NucleotideCount() {
    // TODO:
  }

  Map<String, int> count(String s) {
    Map<String, int> result = {'A': 0, 'G': 0, 'C': 0, 'T': 0};
    s.split('').forEach((char) {
      if (result[char] == null) throw InvalidNucleotideException();
      result[char] = result[char]! + 1;
    });
    return result;
  }
}
