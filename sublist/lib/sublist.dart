// ignore_for_file: unused_local_variable, unused_element

// TODO: refactor or enhance?

enum Classification {
  equal,
  sublist,
  superlist,
  unequal,
}

class Sublist {
  Sublist() {
    //
  }

  bool _sublist(List<int> l1, List<int> l2) {
    // return true if list1 is empty
    if (l1.length == 0) return true;
    var index1 = 0;
    // first item in list 1, will be used to find the starting point in list 2
    var firstInL1 = l1[0];
    // starting point in list 2
    var index2 = l2.indexOf(firstInL1);

    // check if there are still another starting point of first item of list 1
    // in list 2
    var nextIndex2 = l2.indexWhere((digit) => digit == firstInL1,
        2); // the second one, we already check the first one

    while (index1 < l1.length && index2 < l2.length && index2 != -1) {
      if (l1[index1] != l2[index2]) {
        // print('next index 2: $nextIndex2');
        // if there are still another starting point of first item of list 1
        // in list 2 then return a recursive call with a sub list of list 2
        if (nextIndex2 != -1) return _sublist(l1, l2.sublist(nextIndex2));
        // else return false
        return false;
      }
      index1++;
      index2++;
    }

    // l1 not go all the way through
    if (index1 != l1.length) return false;

    // else return true
    return true;
  }

  Classification sublist(List<int> l1, List<int> l2) {
    var isL1SublistL2 = _sublist(l1, l2);
    var isL2SublistL1 = _sublist(l2, l1);

    // equal if they are both sublist of each other
    if (isL1SublistL2 && isL2SublistL1) return Classification.equal;
    // else if only one is a sublist
    if (isL1SublistL2) return Classification.sublist;
    if (isL2SublistL1) return Classification.superlist;
    // else they are not equal
    return Classification.unequal;
  }
}
