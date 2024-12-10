// ignore_for_file: unused_local_variable

class ArmstrongNumbers {
  ArmstrongNumbers() {
    // TODO:
  }

  bool isArmstrongNumber(String n) {
    // keep track of number of digits
    final len = n.length;
    // keep track of sum
    BigInt sum = BigInt.zero;
    // split the string and loop through each digit
    for (var digit in n.split('')) {
      // power it to the number of digits
      final digitAsBigInt = BigInt.parse(digit);
      // add to sum
      sum += digitAsBigInt.pow(len);
    }
    // return whether sum == n, also check for large number format
    return sum == BigInt.parse(n);
  }
}
