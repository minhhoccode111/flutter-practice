// ignore_for_file: unused_local_variable

class NthPrime {
  NthPrime() {
    // TODO:
  }

  int prime(int n) {
    if (n == 0) throw new ArgumentError('There is no zeroth prime');

    final primes = [];
    int pointer = 2;

    while (primes.length < n) {
      if (primes.every((prime) => pointer % prime != 0)) primes.add(pointer);
      pointer++;
    }

    return primes[n - 1];
  }
}
