// ignore_for_file: unused_local_variable

class Allergies {
  static const table = {
    1: 'eggs',
    2: 'peanuts',
    4: 'shellfish',
    8: 'strawberries',
    16: 'tomatoes',
    32: 'chocolate',
    64: 'pollen',
    128: 'cats',
  };

  // Check if a person is allergic to a specific allergen
  bool allergicTo(String s, int score) {
    final allergens = list(score);
    return allergens.contains(s);
  }

  // Get the list of all allergens for a given score
  List<String> list(int score) {
    final result = <String>[];
    table.forEach((value, allergen) {
      // bitwise operator, more on bitwise below

      /*
      for allergy detection:
      - to check if a person is allergic to a specific allergy, we use the allergen's
      binary value and perform `score & value`
        - if the result is non-zero, the allergen is part of the score
        - if the result is zero, the allergen is not included

      example
      1/ checking for eggs(1) in a score of 34
      score 34: 00100010
      eggs 1  : 00000001
      34 & 1  : 00000000
      --> result = 0, not allergic to eggs

      2/ checking for chocolate(32) in a score of 34
      score 34    : 00100010
      chocolate 32: 00100000
      34 & 1      : 00100000
      --> result = 32, allergic to chocolate

      */

      if (score & value != 0) result.add(allergen);
    });

    return result;
  }
}
/*

Bit-wise and operator.

The bitwise AND operation compares two binary numbers bit by bit.
If both bits in a position are 1, the result at that position is 1.
Otherwise, it is 0

print((2 & 1).toRadixString(2)); // 0010 & 0001 -> 0000
print((3 & 1).toRadixString(2)); // 0011 & 0001 -> 0001
print((10 & 2).toRadixString(2)); // 1010 & 0010 -> 0010

*/
