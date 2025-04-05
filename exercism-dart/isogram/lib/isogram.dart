// ignore_for_file: unused_local_variable

class Isogram {
  Isogram() {
    // TODO:
  }

  bool isIsogram(String s) {
    // remove spaces and hyphens, ignore case
    s = s.replaceAll(RegExp(r'-| '), '').toLowerCase();
    final set = s.split('').toSet();
    return set.length == s.length;
  }
}
