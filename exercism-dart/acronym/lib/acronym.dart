// ignore_for_file: unused_local_variable

class Acronym {
  Acronym() {
    // TODO:
  }

  String abbreviate(String s) {
    final re = RegExp(r' - | |-');
    final arr = s.replaceAll(RegExp(r'_'), '').toUpperCase().split(re);
    var result = '';
    arr.forEach((word) => result += word[0]);
    return result;
  }
}
