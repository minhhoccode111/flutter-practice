import 'dart:math';

// CLASSES
// on the surface, classes in Dart are similar to classes in JS, although JS
// classes are technically more of a wrapper around prototypes. In Dart,
// classes are a standard feature of the language. This section covers
// defining and using classes in Dart and how they differ from JS

// "this" context
// the `this` keyword in Dart is more straightforward than in JS. In Dart, you
// can't bind functions to `this`, and `this` never depends on the execution
// context (as it does in JavaScript). In Dart, `this` is only used within
// classes, and always refers to the current instance

// CONSTRUCTORS
// this section discusses how constructors differ in Dart from JS

class Point {
  final double x;
  final double y;

  // STANDARD CONSTRUCTOR
  // a standard class constructor looks very similar to a JS constructor. In
  // Dart, the `constructor` keyword is replaced by the full class name, and all
  // parameters must be explicitly typed. In Dart, the `new` keyword was once
  // required for creating class instances, but is not optional and its use is
  // no longer recommended
  Point(double x, double y)
      : this.x = x,
        this.y = y {}

  // INITIALIZER LISTS
  // use initializer lists to write your constructor. insert the initializer
  // list between constructor's parameters and body
  Point.fromJson(Map<String, double> json)
      : x = json['x']!,
        y = json['y']! {
    print('In Point.fromJson(): ($x, $y)');
  }

  // CONSTRUCTOR PARAMETERS
  // writing code to assign class fields in the constructor can feel like
  // creating boilerplate code, so Dart has some syntactic sugar, called
  // `initializing parameters` to make this easier:

  // syntactic sugar for setting x and y before the constructor body runs
  Point.constructorParameters(this.x, this.y);

  // similar to functions, constructors have the option to take positioned or
  // named parameters

  // with an optional positioned parameter
  Point.optionalPositionedParameter(this.x, [this.y = 5]);
  // with a named parameters
  Point.namedParameters({required this.y, this.x = 5});
  // with both positional and named parameters
  // Point.positionedAndNamedParameters(int x, int y, {boolean multiply}) {
  //   ...
  // }

  // NAMED CONSTRUCTORS
  // unlike JS, Dart allows classes to have multiple constructors, by allowing
  // you to name them. You can optionally have one single unnamed constructor,
  // any additional constructors must be named

  // named constructor
  Point.namedConstructor(int x, int y)
      : this.x = 0,
        this.y = 0;

  // CONSTRUCTOR REDIRECTION
  // you can call constructors from other constructors to prevent code
  // duplication or to add additional default for parameters

  // delegates to the main constructor
  Point.alongXAxis(double x) : this(x, 0);
}

// CONST CONSTRUCTOR
// to enable immutable class instances, use a `const` constructor. A class with
// a `const` constructor can have `final` instance variables only
class ImmutablePoint {
  final double x, y;

  const ImmutablePoint(this.x, this.y);
}

// FACTORY CONSTRUCTORS
// you can use a factory constructor when you don't need to create a new class
// instance. one example would be when returning a cached instance
class Logger {
  static final Map<String, Logger> _cache = <String, Logger>{};

  final String name;

  // factory constructor that returns a cached copy, or creates a new one if it
  // is not yet available
  factory Logger(String name) {
    return _cache.putIfAbsent(
      name,
      () => _cache[name] ??= Logger._internal(name),
    );
  }

  // private constructor for internal use only
  Logger._internal(this.name);
}

///// METHODS \\\\\
// in both Dart and JS, methods serve as functions that provide behaviour for
// an object
void doSomething() {
  // this is a function
  // implementation ...
}

class Example {
  void doSomething() {
    // this is a method
    // implementation ...
  }
}

///// EXTENDING CLASSES \\\\\
// dart allows classes to extend another class, in the same way that JS does
class Animal {
  int eyes;
  Animal(this.eyes);

  makeNoise() {
    print('???');
  }
}

class Cat extends Animal {
  Cat() : super(2);

  // when overriding a method from the parent class, use the `@override`
  // annotation. While this is optional it shows that the override is intentional
  // The Dart analyzer shows a warning if the method is not actually overriding
  // a superclass method

  @override
  makeNoise() {
    print('Meow');
    // the parent method that is being overridden can still be called using the
    // `super` keyword
    super.makeNoise();
  }
}

///// CLASSES AS INTERFACES \\\\\
// like JS, Dart doesn't have a separate definition for interfaces. However,
// unlike JS, all class definitions double as an interface; you can implement a
// class as an interface using the `implements` keyword

// when a class is implemented as an interface, its public API must be
// implemented by the new class. Unlike `extends`, its method and field
// implementations aren't shared with the new class. While a class can only
// extend a single clas, you can implement multiple interfaces at a time, even
// when the implementing class already extends another

mixin Consumer {
  consume() {
    print('Eating food...');
  }
}

class Dog implements Consumer {
  consume() {
    print('eating dog food');
  }

  // // when implementing an interface, the `super` method can't be called as the
  // // method bodies are not inherited
  // @override
  // consume() {
  //   print('eating dog food');
  //   super.consume(); // invalid. the superclass `Object` has no `consume` method
  // }
}

///// ABSTRACT CLASSES AND METHODS \\\\\
// to ensure that a class can only be extended or have its interface implemented
// but to disallow the construction of any instances, mark it as `abstract`
abstract class Vehicle {
  consume();
}

// extending the full class
class ToyCar extends Vehicle {
  @override
  consume() {
    print('toy car go bruh bruh');
  }
}

// just implementing the interface
class ToyTruck implements Vehicle {
  @override
  consume() {
    print('toy truck go bruh bruh');
  }
}

///// MIXINS \\\\\
// mixins are used to share functionality between classes. You can use the
// mixin's fields and methods in the class, using their functionality as if it
// were part of the class. A class can use multiple mixins. This helps when
// multiple classes share the same functionality, without needing to inherit
// from each other or share a common ancestor

// use the `with` keyword to add one or more comman-separated mixins to a class
// JS has no keyword equivalent. JS can use `Object.assign` to merge additional
// objects into an existing object, after instantiating

abstract class Animal0 {}

// defining the mixins
// you should replace the `class` keyword with `mixin` to prevent the mixin
// from being used as a regular class
mixin Flyer {
  fly() => print('Flaps wings');
}

mixin Walker {
  walk() => print('Walks on legs');
}

class Bat extends Animal0 with Flyer {}

class Goose extends Animal0 with Flyer, Walker {}

class Tiger extends Animal0 with Walker {}

// since you can use multiple mixins, they can have overlapping methods or fields
// with each other when used on the same class. They can even overlap with the
// class that uses them, or that class's superclass. The order in which they are
// added to a class matters
// example:
class Bird extends Animal0 with Consumer, Walker, Flyer {}
// when a method is called on an instance of `Bird`, Dart starts with its own
// class, `Bird`, which takes precedence over other implementations. If `Bird`
// has no implementation, then `Flyer` is checked, followed by `Consumer` until
// an implementation is found. The parent class, `Animal0`, is checked last

///// EXTENSIONS \\\\\
// extending classes, implementing interfaces, or using mixins all work when
// the affected class is editable. However, sometimes it's useful to extend a
// class that already exists or is part of another library or the Dart SDK

// in these cases, Dart offers the ability to write extensions for existing
// classes

// as an example, the following extension on the `String` class from the Dart
// SDK allows parsing of integers
extension NumberParsing on String {
  int parseInt() => int.parse(this);
}

// for the extension to become available, it has to be present in the same file
// or its file must be imported

// use it as follows
// import 'string_apis.dart'; // import the file extension is in
// var age = '42'.parseInt(); // use the extension method

///// GETTERS AND SETTERS \\\\\
// getters and setters in Dart work exactly like their JS counterparts

class Person {
  var _age = 0;

  int get age => _age;

  void set age(value) {
    if (value < 0) {
      throw ArgumentError('age connot be negative');
    }
    _age = value;
  }
}

///// PUBLIC AND PRIVATE MEMBERS \\\\\
// like JS, dart has no access modifier keywords; all class members are public
// by default
// JS will include private class members in the next practical revision of the
// EcmaScript standard. As such, implementations for this have been available in
// various browsers and runtimes for some time
// to make a class member private in Dart, prefix its name with an Underscore
// (`_`)
class Animal2 {
  // dart's compiler enforeces use of the underscore for this feature
  late int eyes; // public field
  late int _paws; // private field

  void _printEyes() {
    // private method
    print(this.eyes);
  }

  void printPaws() {
    // public method
    print(this._paws);
  }
}
// dart makes private members private to the library, not the class. This mean
// that you can access private members from code in the same library. By default
// Dart limits access to private class members to code in the same file. To
// expand the scope of a library beyond one file, add the `part` directive. When
// possible, _avoid using `part`_. Reverse using `part` for code generators

///// LATE VARIABLES \\\\\
// to indicate that Dart initializes class fields at a later point, assign the
// `late` keyword to those class fields. Those class fields remain non-nullable
// Do this when a variable doesn't need to observed or accessed immediately and
// can be initialized later. This differs from labeling the field as nullable
// - (non-nullable): late fields cannot have null assigned at a later point
// - (non-nullable): late fields throw a runtime error when accessed before they
// initialize. This should be avoided

class Pet {
  final String name;
  final PetOwner owner;
  Pet(this.name, this.owner);
}

class PetOwner {
  final String name;
  late final Pet _pet;
  PetOwner(this.name, String petName) {
    // cyclic object graph, cannot set _pet before owner exists
    _pet = Pet(petName, this);
  }
  Pet get pet => _pet;
}
// in the preceding exapmle, the compiler does not know to assign `captures` if
// `capture` is true. Using `late` delays the normal `assigned` checks until
// time

///// GENERICS \\\\\
// GENERIC CLASSES
// generics can also be applied to classes. You can include the type to use when
// calling a constructor. This allows you to tailor reusable classes to specific
// type
// example, the `Cache` class caches specific types
class Cache<T> {
  T getByKey(String key) {
    return 'something' as T;
  }

  void setByKey(String key, T value) {}
}

// RESTRICTING GENERICS
// you can use generics to restrict your code to a family of types using
// `extends`. This ensures that your class is instantiated with a generic type
// that extends a specific type
class NumberManager<T extends num> {
  //
}

// valid
var managerInt = NumberManager<int>();
var managerDouble = NumberManager<double>();
// invalid, String nor its parent classes extend num
// var managerString = NumberManager<String>();

// GENERICS IN LITERALS
// `Map`, `Set`, and `List` literals can accepts type arguments. This helps when
// when Dart cannot infer the type or infer the type correctly

// for example, the `List` class has a generic definition: `class List<E>`. the
// type parameter `E` refers to the type of the list's contents. Normally, this
// type is automatically inferred, which is used in some `List` class's member
// types. (For example, its first getter returns a value of type `E`). When
// defining a `List` literal, you can explicitly define the generic type as
// follow

// automatic type inference
var objListNum = [5, 2.0]; // type: List<num>
// explicit type definition
var objListObject = <Object>[5, 2.0]; // type: List<Object>
// sets work identically
var objSet = <Object>[5, 2.0];

// this is also true for `Map`s, which also define their key and value types
// using generics (`class Map<K,V>`)

// automatic type inference
var mapString = {'foo': 'bar'}; // type: Map<String, String>
// explicit type definition
var mapObject = <String, Object>{'foo': 'bar'}; // Type: Map<String, Object>

///// DOC COMMENTS \\\\\
// regular comments work the same in Dart as they do in JS. Using `//` comments
// out everything beyond it for the remaining line, and you can use `/* ... */`
// to block comments spanning multiple lines

// in addition to regular comments, Dart also has `doc comments` that work in
// tandem with `dart doc`: a first party tool that generates HTML documentation
// for Dart packages. It's considered best practice to place doc comments above
// all declarations for public members

// define a doc comment by using three forward slashes instead of two `///`
// example:

/// The number of characters in this chunk when unsplit.
int get length => 0;

void main(List<String> args) {
  final random = Random();

  // create a new instance of the Point class
  Point p = Point(3, 5);

  // extending classes example and override
  Animal animal = Cat();
  print(animal.eyes); // 2
  animal.makeNoise(); // Meow

  // classes as interfaces example
  Consumer dog = Dog();
  dog.consume(); // eating dog food

  // abstract classes and methods example
  Vehicle consumer;
  consumer = ToyCar();
  consumer.consume(); // toy car go bruh bruh
  consumer = ToyTruck();
  consumer.consume(); // toy truck go bruh bruh

  // mixins example
  // correct calls
  Bat().fly();
  Goose().fly();
  Goose().walk();
  Tiger().walk();

  // // incorrect calls
  // Bat().walk();
  // Tiger.fly();

  // getters and setters example
  final person = new Person();
  person.age = 10;
  print(person.age);

  ///// GENERICS \\\\\
  // while JS doesn't offer generics, Dart does to improve type safety and
  // reduce code duplication

  // GENERIC METHODS
  // you can apply generics to methods. To define a generic type parameter,
  // place it between angle bracket `<` `>` after the method name. You can then
  // use this type within the method as the return type or within the method's
  // parameters
  Map<Object?, Object?> _cache = {};
  T cache<T>(T value) => (_cache[value] ??= value) as T;

  // define multiple generic types by separating them with a comma
  // defining a method with multiple generics
  T transform<T, Q>(T param1, Q param2) {
    // ...
    return 0 as T;
  }

  // calling the method with explicitly defined types
  transform<int, String>(5, 'string value');
  // types are optional when the analyzer can infer them
  transform(5, 'string value');

  // generic classes example
  var stringCache = Cache<String>(); // stringCache has type Cache<String>
  stringCache.setByKey('foo', 'bar'); // valid, setting a string value
  // stringCache.setByKey('baz', 5); // invalid, in type does not match generic
  // if you omit the type declaration, the runtime type becomes Cache<dynamic>
  // and both calls to `setByKey` are valid
}
