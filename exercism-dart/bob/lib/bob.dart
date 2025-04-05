// ignore_for_file: unused_local_variable

class Bob {
  Bob() {
    // TODO:
  }

  String response(String s) {
    s = s.trim();

    final isSilence = s.isEmpty;
    final isNotAllNumber = s != s.toLowerCase(); // or all lower case
    final isAllUpperCase = s == s.toUpperCase();
    final isYell = isAllUpperCase && isNotAllNumber;
    final isQuestion = s.endsWith('?');

    if (isSilence) return 'Fine. Be that way!';
    if (isYell && isQuestion) return "Calm down, I know what I'm doing!";
    if (isYell) return 'Whoa, chill out!';
    if (isQuestion) return 'Sure.';

    return 'Whatever.';
  }
}
