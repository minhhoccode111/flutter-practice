// imports

/// enumsj
enum PlanetType { terrestrial, gas, ice }

// enhanced enum declaration of a class describing planets, with a defined set
// of constant instances, namely the planets of our own solar system
/// Enum that enumerates the different planets of our solar system
/// and some of their properties
enum Planet {
  mercury(planetType: PlanetType.terrestrial, moons: 0, hasRings: false),
  venus(planetType: PlanetType.terrestrial, moons: 0, hasRings: false),
  // ...
  uranus(planetType: PlanetType.ice, moons: 27, hasRings: true),
  neptune(planetType: PlanetType.ice, moons: 14, hasRings: true);

  /// a constant generating constructor
  const Planet({
    required this.planetType,
    required this.moons,
    required this.hasRings,
  });

  /// all instance variables are final
  final PlanetType planetType;
  final int moons;
  final bool hasRings;

  /// enhanced enums support getters and other methods
  bool get isGiant =>
      planetType == PlanetType.gas || planetType == PlanetType.ice;
}

/// you can create an abstract class to be extended (or implemented) by a
/// concrete class. Abstract class can contain abstract methods (with empty bodies)
abstract class Describable {
  void describe();

  void describeWithEmphasis() {
    print("==========");
    describe();
    print("==========");
  }
}

// top level main where execution starts
void main() {
  print('Hello, World!');

  // you might use the Planet enum like this:
  final yourPlanet = Planet.venus;
  if (yourPlanet.isGiant) {
    print('Your planet is giant');
  }
}
