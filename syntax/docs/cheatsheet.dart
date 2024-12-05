// https://dart.dev/resources/dart-cheatsheet

// imports
import 'dart:html';

// top level main where execution starts
void main() {
  print('Hello, World!');

  void nullableVariables() {
    // nullable variables
    // int a = null; // invalid
    int? a = null; // valid

    int? b; // initial value of b is null
  }

  void nullAwareOperators() {
    // null-aware operators
    int? a; // = null

    a ??= 3;
    print(a); // output: 3

    a ??= 5;
    print(a); // output: 3
  }

  void conditionalPropertyAccess() {
    // like in javascript
    var a;
    a?.someProperty;

    (a != null) ? a.someProperty : null; // equivalent
  }

  void collectionLiterals() {
    // List<String>
    final aListOfString = ['one', 'two', 'three'];
    // Set<String>
    final aSetOfString = {'one', 'two', 'three'};
    // Map<String, int>
    final aMapOfString = {'one': 1, 'two': 2, 'three': 3};
  }

  bool arrowSyntax = [1, 2, 3].any((n) => n > 2);

  void cascades() {
    /// to perform a sequence of operations on the same object use `..`
    var a;

    a.someMethod(); // return result of `someMethod`
    a..someMethod(); // return ref to `a`

    // instead of this
    var button = querySelector("#confirm");
    button?.text = 'Confirm';
    button?.classes.add('important');
    button?.onClick.listen((e) => window.alert('Confirmed!'));
    button?.scrollIntoView();

    // can be replace by this, which seem better because we don't have to repeat
    // button variable every time
    querySelector("#confirm")
      ?..text = 'Confirm'
      ..classes.add('important')
      ..onClick.listen((e) => window.alert('Confirmed!'))
      ..scrollIntoView();
  }

  void optionalPositionalParameters() {
    //
  }

  void namedParameters() {
    //
  }

  void Exceptions() {
    // dart code can throw and catch exceptions
    // all of dart's exceptions are unchecked
    // methods don't declare which exceptions they might throw
    // you aren't required to catch any exceptions
    // dart provides `Exception` and `Error` type, but you're allowed to throw any non-null object

    throw Exception("Something bad happened");
    throw "Waaaaaaaaaah!";

    // use the `try`, `on`, and `catch` keywords when handling exceptions

    // try {
    //   breedMoreLlamas();
    // } on OutOfLlamasException {
    //   // A specific exception
    //   buyMoreLlamas();
    // } on Exception catch (e) {
    //   // Anything else that is an exception
    //   print('Unknown exception: $e');
    // } catch (e) {
    //   // No specified type, handles all
    //   print('Something really unknown: $e');
    // }
  }
}

class GettersAndSetters {
  int _aProp = 0;
  int get aProp => _aProp;
  void set aProp(int val) => _aProp = val;
}

class UsingThisInConstructor {
  int red;
  int green;
  int blue;

  // UsingThisInConstructor(this.red, this.green, this.blue); // ver 1
  UsingThisInConstructor(
      {required this.red, required this.green, required this.blue}); // ver 2
}

// final color = UsingThisInConstructor(90, 90, 120); // ver 1
final color = UsingThisInConstructor(red: 90, green: 90, blue: 120); // ver 2

// Sometimes when you implement a constructor, you need to do some setup before
// the constructor body executes. For example, final fields must have values
// before the constructor body executes. Do this work in an initializer list,
// which goes between the constructor's signature and its body
class initializerLists {
  int x;
  int y;
  initializerLists(this.x, this.y)
      : assert(x >= 0),
        assert(y >= 0) {
    print('I just made a non negative point: ($x, $y)');
  }
}

class NamedConstructor {
  double x, y;

  NamedConstructor(this.x, this.y);

  NamedConstructor.origin()
      : x = 0,
        y = 0;
}

// to use a named constructor, invoke it usinng its full name:
final myNamedConstructor = NamedConstructor.origin();
final myNormalNamedConstructor = NamedConstructor(1, 2);

// dart suppports factory constructors, which can return subtypes or even null
// to create a factory constructor, use the factory keyword
class Square extends Shape {}

class Circle extends Shape {}

class Shape {
  Shape();

  factory Shape.fromTypeName(String typeName) {
    if (typeName == 'square') return Square();
    if (typeName == 'circle') return Circle();

    throw ArgumentError('Unrecognized $typeName');
  }
}

// redirecting constructors
// sometimes a constructor's only purpose is to redirect to another constructor
// in the same class. A redirecting constructor's body is empty, with the
// constructor call appearing after a colon (:)

class Automobile {
  String make;
  String model;
  int mpg;

  // the main constructor for this class
  Automobile(this.make, this.model, this.mpg);

  // delegates to the main constructor
  Automobile.hybrid(String make, String model) : this(make, model, 60);

  // delegates to a named constructor
  Automobile.fancyHybrid() : this.hybrid('Futurecar', 'Mark 2');
}

// const constructor
// if your class produces objects that never change, you can make these object compile-time constants
// to do this, define a const constructor and make sure that all instance variabels are final
class ImmutablePoint {
  static const ImmutablePoint origin = ImmutablePoint(0, 0);

  final int x;
  final int y;

  const ImmutablePoint(this.x, this.y);
}
