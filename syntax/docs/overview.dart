import 'dart:math' show Random;

void main() async {
  print('computer PI using the Monte Carlo method.');
  // asynchronously iterate over the first 100 PI estimates from the stream
  await for (final estimate in computePi().take(100)) {
    print('PI = $estimate');
  }
}

/// generates a stream of increasingly accurate estimates of PI
Stream<double> computePi({int batch = 100000}) async* {
  // total number of points generated
  var total = 0; // inferred to be of type int
  // number of points inside the unit circle
  var count = 0;
  while (true) {
    // generate a batch of random points
    final points = generateRandom().take(batch);
    // filter points that lie inside the unit circle
    final inside = points.where((p) => p.isInsideUnitCircle);

    // update the total and count
    total += batch;
    count += inside.length;
    // calculate the ratio of points inside the circle to the total
    final ratio = count / total;

    // area of a circle is A = PI*(r^2), therefore PI = A/(r^2)
    // so, when given random points with x in <0,1>, y in <0,1>,
    // the ratio of those inside a unit circle should approach PI / 4
    // therefore, the value of PI should be:
    yield ratio * 4;
  }
}

Iterable<Point> generateRandom([int? seed]) sync* {
  // create a random number generator with an optional seed
  final random = Random(seed);
  while (true) {
    // yield a new random point within the unit square
    yield Point(random.nextDouble(), random.nextDouble());
  }
}

class Point {
  final double x;
  final double y;

  const Point(this.x, this.y);

  // determine if the point lies inside the unit circle
  bool get isInsideUnitCircle => x * x + y * y <= 1;
}
