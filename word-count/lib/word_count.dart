// ignore_for_file: unused_local_variable

class WordCount {
  WordCount() {
    // TODO:
  }

  Map<String, int> countWords(String s) {
    // lower case the input string
    s = s.toLowerCase();
    // a dict to return
    Map<String, int> result = {};
    // regex to check match alphabet and digits
    final alpha = RegExp(r"[a-zA-Z0-9]");
    var currWord = '';
    for (var i = 0; i < s.length; i++) {
      final char = s[i];
      // identify if is valid apostrophe (has char before and after)
      final isApo = i != 0 &&
          i != s.length - 1 &&
          char == "'" &&
          alpha.hasMatch(s[i - 1]) &&
          alpha.hasMatch(s[i + 1]);

      if (alpha.hasMatch(char) || isApo) {
        currWord += char;
        continue;
      }
      if (currWord == '') continue;
      if (result[currWord] == null) {
        result[currWord] = 1;
        currWord = '';
        continue;
      } else {
        result[currWord] = result[currWord]! + 1;
        currWord = '';
      }
    }

    if (currWord != '') {
      if (result[currWord] == null)
        result[currWord] = 1;
      else
        result[currWord] = result[currWord]! + 1;
    }
    return result;
  }
}
