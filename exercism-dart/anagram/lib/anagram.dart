// ignore_for_file: unused_local_variable

class Anagram {
  Anagram() {
    // TODO:
  }

  List<String> findAnagrams(String s, List<String> lists) {
    final tmpS = s.toLowerCase().split('');
    tmpS.sort();
    final sortedS = tmpS.join('');

    final result = <String>[];
    for (var item in lists) {
      final tmpItem = item.toLowerCase().split('');
      tmpItem.sort();
      final sortedItem = tmpItem.join('');

      // debug
      // print('sortedItem belike: $sortedItem');
      // print('sortedS belike:    $sortedS');
      // print('item belike:       $item');
      // print('s belike:          $s');

      if (sortedItem == sortedS && item.toLowerCase() != s.toLowerCase())
        result.add(item);
    }

    return result;
  }
}
