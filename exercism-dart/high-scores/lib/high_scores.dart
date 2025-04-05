// ignore_for_file: unused_field, unused_local_variable

class HighScores {
  late final _scores;

  HighScores(List<int> scores) {
    _scores = scores;
  }

  get scores => _scores;

  int latest() {
    return _scores.last;
  }

  int personalBest() {
    var max = 0;
    _scores.forEach((score) => max = score > max ? score : max);
    return max;
  }

  List<int> personalTopThree() {
    // clone to avoid modifying the original with `.sort()` method
    List<int> clone = [..._scores];
    // sort the clone
    clone.sort();
    // reverse the sort to take 3 largest
    clone = clone.reversed.take(3).toList();
    return clone;
  }
}
