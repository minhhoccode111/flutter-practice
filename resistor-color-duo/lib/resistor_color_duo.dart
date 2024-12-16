// ignore_for_file: unused_local_variable

class ResistorColorDuo {
  ResistorColorDuo() {
    // TODO:
  }

  int value(List<String> list) {
    const table = {
      'black': 0,
      'brown': 1,
      'red': 2,
      'orange': 3,
      'yellow': 4,
      'green': 5,
      'blue': 6,
      'violet': 7,
      'grey': 8,
      'white': 9,
    };

    return table[list[0]]! * 10 + table[list[1]]!;
  }
}
