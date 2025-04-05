// ignore_for_file: unused_local_variable

class Etl {
  Etl() {
    // TODO:
  }

  Map<String, int> transform(Map<String, List<String>> legacy) {
    final Map<String, int> result = {};
    legacy.forEach((key, value) => value.forEach((char) => result[char.toLowerCase()] = int.parse(key)));
    return result;
  }
}
