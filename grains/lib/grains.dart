// ignore_for_file: unused_local_variable

BigInt square(final int n) {
  if (n < 1 || n > 64) throw ArgumentError('square must be between 1 and 64');
  BigInt two = BigInt.from(2);
  return two.pow(n - 1);
}

BigInt total() {
  BigInt sum = BigInt.zero;
  for (var i = 1; i < 65; i++) sum += square(i);
  return sum;
}
