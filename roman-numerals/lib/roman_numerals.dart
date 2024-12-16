// | M    | D   | C   | L   | X   | V   | I   |
// | ---- | --- | --- | --- | --- | --- | --- |
// | 1000 | 500 | 100 | 50  | 10  | 5   | 1   |

// ignore_for_file: unused_local_variable

const table = <int, String>{
  1000: 'M',
  900: 'CM',
  500: 'D',
  400: 'CD',
  100: 'C',
  90: 'XC',
  50: 'L',
  40: 'XL',
  10: 'X',
  9: 'IX',
  5: 'V',
  4: 'IV',
  1: 'I',
};

extension ConvertToRomanNumerals on int {
  String toRoman() {
    var n = this;
    var result = '';

    for (int key in table.keys) {
      while (n >= key) {
        result += table[key]!;
        n -= key;
      }
    }

    return result;
  }
}
