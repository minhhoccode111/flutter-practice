// ignore_for_file: unused_local_variable, unused_element

class SpaceAge {
  SpaceAge() {
    // TODO:
  }

  double age({String planet = '', int seconds = 0}) {
    Map<String, double> table = {
      'Mercury': 0.2408467,
      'Venus': 0.61519726,
      'Earth': 1.0,
      'Mars': 1.8808158,
      'Jupiter': 11.862615,
      'Saturn': 29.447498,
      'Uranus': 84.016846,
      'Neptune': 164.79132,
    };

    const oneYearBase = 365.25 * 24 * 60 * 60;

    final result = seconds / (oneYearBase * table[planet]!);

    return _roundTwoDecimal(result);
  }

  double _roundTwoDecimal(double n) => (n * 100.0).round() / 100.0;
}
