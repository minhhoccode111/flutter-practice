// ignore_for_file: unused_local_variable

const table = [
  'A',
  'B',
  'C',
  'D',
  'E',
  'F',
  'G',
  'H',
  'I',
  'J',
  'K',
  'L',
  'M',
  'N',
  'O',
  'P',
  'Q',
  'R',
  'S',
  'T',
  'U',
  'V',
  'W',
  'X',
  'Y',
  'Z',
];

class Diamond {
  Diamond() {
    // TODO:
  }

  List<String> rows(String s) {
    final index = table.indexOf(s);
    final size = index * 2 + 1; // always odd
    final mid = size ~/ 2;
    final result = <String>[];
    for (var i = 0; i < size; i++) {
      var row = '';
      final mirrorIndex = i <= mid ? i : size - i - 1;
      for (var j = 0; j < size; j++) {
        if (j == mid - mirrorIndex || j == mid + mirrorIndex)
          row += table[mirrorIndex];
        else
          row += ' ';
        continue;
      }
      result.add(row);
    }

    return result;
  }
}
