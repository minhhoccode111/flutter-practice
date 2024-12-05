// https://dart.dev/resources/dart-cheatsheet

// imports
import 'dart:html';

// top level main where execution starts
// void main() {
void Main() {
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

/// Doing examples

// // string interpolation
// String stringify(int x, int y) {
//   return '${x} ${y}';
// }
// // Tests your solution (Don't edit!):
// void main() {
//   assert(stringify(2, 3) == '2 3',
//       "Your stringify method returned '${stringify(2, 3)}' instead of '2 3'");
//   print('Success!');
// }

// nullable variables
// String? name = 'Jane';
// String? address;
// // Tests your solution (Don't edit!):
// void main() {
//   try {
//     if (name == 'Jane' && address == null) {
//       // verify that "name" is nullable
//       name = null;
//       print('Success!');
//     } else {
//       print('Not quite right, try again!');
//     }
//   } catch (e) {
//     print('Exception: ${e.runtimeType}');
//   }
// }

// null-aware operators
// String? foo = 'a string';
// String? bar; // = null
// // Substitute an operator that makes 'a string' be assigned to baz.
// String? baz = foo ?? bar;
// void updateSomeVars() {
//   // Substitute an operator that makes 'a string' be assigned to bar.
//   bar ??= 'a string';
// }
//
// // Tests your solution (Don't edit!):
// void main() {
//   try {
//     updateSomeVars();
//
//     if (foo != 'a string') {
//       print('Looks like foo somehow ended up with the wrong value.');
//     } else if (bar != 'a string') {
//       print('Looks like bar ended up with the wrong value.');
//     } else if (baz != 'a string') {
//       print('Looks like baz ended up with the wrong value.');
//     } else {
//       print('Success!');
//     }
//   } catch (e) {
//     print('Exception: ${e.runtimeType}.');
//   }
// }

// // conditional property access
// String? upperCaseIt(String? str) {
//   return str?.toUpperCase();
// }
//
// // Tests your solution (Don't edit!):
// void main() {
//   try {
//     String? one = upperCaseIt(null);
//     if (one != null) {
//       print('Looks like you\'re not returning null for null inputs.');
//     } else {
//       print('Success when str is null!');
//     }
//   } catch (e) {
//     print(
//         'Tried calling upperCaseIt(null) and got an exception: \n ${e.runtimeType}.');
//   }
//
//   try {
//     String? two = upperCaseIt('a string');
//     if (two == null) {
//       print('Looks like you\'re returning null even when str has a value.');
//     } else if (two != 'A STRING') {
//       print(
//           'Tried upperCaseIt(\'a string\'), but didn\'t get \'A STRING\' in response.');
//     } else {
//       print('Success when str is not null!');
//     }
//   } catch (e) {
//     print(
//         'Tried calling upperCaseIt(\'a string\') and got an exception: \n ${e.runtimeType}.');
//   }
// }

// // collection literals
// // Assign this a list containing 'a', 'b', and 'c' in that order:
// final aListOfStrings = ['a', 'b', 'c'];
//
// // Assign this a set containing 3, 4, and 5:
// final aSetOfInts = {3, 4, 5};
//
// // Assign this a map of String to int so that aMapOfStringsToInts['myKey'] returns 12:
// final aMapOfStringsToInts = {'myKey': 12};
//
// // Assign this an empty List<double>:
// final anEmptyListOfDouble = <double>[];
//
// // Assign this an empty Set<String>:
// final anEmptySetOfString = <String>{};
//
// // Assign this an empty Map of double to int:
// final anEmptyMapOfDoublesToInts = <double, int>{};
//
// // Tests your solution (Don't edit!):
// void main() {
//   final errs = <String>[];
//
//   if (aListOfStrings is! List<String>) {
//     errs.add('aListOfStrings should have the type List<String>.');
//   } else if (aListOfStrings.length != 3) {
//     errs.add(
//         'aListOfStrings has ${aListOfStrings.length} items in it, \n rather than the expected 3.');
//   } else if (aListOfStrings[0] != 'a' ||
//       aListOfStrings[1] != 'b' ||
//       aListOfStrings[2] != 'c') {
//     errs.add(
//         'aListOfStrings doesn\'t contain the correct values (\'a\', \'b\', \'c\').');
//   }
//
//   if (aSetOfInts is! Set<int>) {
//     errs.add('aSetOfInts should have the type Set<int>.');
//   } else if (aSetOfInts.length != 3) {
//     errs.add(
//         'aSetOfInts has ${aSetOfInts.length} items in it, \n rather than the expected 3.');
//   } else if (!aSetOfInts.contains(3) ||
//       !aSetOfInts.contains(4) ||
//       !aSetOfInts.contains(5)) {
//     errs.add('aSetOfInts doesn\'t contain the correct values (3, 4, 5).');
//   }
//
//   if (aMapOfStringsToInts is! Map<String, int>) {
//     errs.add('aMapOfStringsToInts should have the type Map<String, int>.');
//   } else if (aMapOfStringsToInts['myKey'] != 12) {
//     errs.add(
//         'aMapOfStringsToInts doesn\'t contain the correct values (\'myKey\': 12).');
//   }
//
//   if (anEmptyListOfDouble is! List<double>) {
//     errs.add('anEmptyListOfDouble should have the type List<double>.');
//   } else if (anEmptyListOfDouble.isNotEmpty) {
//     errs.add('anEmptyListOfDouble should be empty.');
//   }
//
//   if (anEmptySetOfString is! Set<String>) {
//     errs.add('anEmptySetOfString should have the type Set<String>.');
//   } else if (anEmptySetOfString.isNotEmpty) {
//     errs.add('anEmptySetOfString should be empty.');
//   }
//
//   if (anEmptyMapOfDoublesToInts is! Map<double, int>) {
//     errs.add(
//         'anEmptyMapOfDoublesToInts should have the type Map<double, int>.');
//   } else if (anEmptyMapOfDoublesToInts.isNotEmpty) {
//     errs.add('anEmptyMapOfDoublesToInts should be empty.');
//   }
//
//   if (errs.isEmpty) {
//     print('Success!');
//   } else {
//     errs.forEach(print);
//   }
//
//   // ignore_for_file: unnecessary_type_check
// }

// // arrow syntax
// class MyClass {
//   int value1 = 2;
//   int value2 = 3;
//   int value3 = 5;
//
//   // Returns the product of the above values:
//   int get product => value1 * value2 * value3;
//
//   // Adds 1 to value1:
//   void incrementValue1() => value1++;
//
//   // Returns a string containing each item in the
//   // list, separated by commas (e.g. 'a,b,c'):
//   String joinWithCommas(List<String> strings) => strings.join(',');
// }
//
// // Tests your solution (Don't edit!):
// void main() {
//   final obj = MyClass();
//   final errs = <String>[];
//
//   try {
//     final product = obj.product;
//
//     if (product != 30) {
//       errs.add(
//           'The product property returned $product \n instead of the expected value (30).');
//     }
//   } catch (e) {
//     print(
//         'Tried to use MyClass.product, but encountered an exception: \n ${e.runtimeType}.');
//     return;
//   }
//
//   try {
//     obj.incrementValue1();
//
//     if (obj.value1 != 3) {
//       errs.add(
//           'After calling incrementValue, value1 was ${obj.value1} \n instead of the expected value (3).');
//     }
//   } catch (e) {
//     print(
//         'Tried to use MyClass.incrementValue1, but encountered an exception: \n ${e.runtimeType}.');
//     return;
//   }
//
//   try {
//     final joined = obj.joinWithCommas(['one', 'two', 'three']);
//
//     if (joined != 'one,two,three') {
//       errs.add(
//           'Tried calling joinWithCommas([\'one\', \'two\', \'three\']) \n and received $joined instead of the expected value (\'one,two,three\').');
//     }
//   } catch (e) {
//     print(
//         'Tried to use MyClass.joinWithCommas, but encountered an exception: \n ${e.runtimeType}.');
//     return;
//   }
//
//   if (errs.isEmpty) {
//     print('Success!');
//   } else {
//     errs.forEach(print);
//   }
// }

// // cascades
// class BigObject {
//   int anInt = 0;
//   String aString = '';
//   List<double> aList = [];
//   bool _done = false;
//   void allDone() {
//     _done = true;
//   }
// }
//
// BigObject fillBigObject(BigObject obj) {
//   // Create a single statement that will update and return obj:
//   return obj
//     ..anInt = 1
//     ..aString = 'String!'
//     ..aList.add(3.0)
//     ..allDone();
// }
//
// // Tests your solution (Don't edit!):
// void main() {
//   BigObject obj;
//   try {
//     obj = fillBigObject(BigObject());
//   } catch (e) {
//     print(
//         'Caught an exception of type ${e.runtimeType} \n while running fillBigObject');
//     return;
//   }
//   final errs = <String>[];
//   if (obj.anInt != 1) {
//     errs.add(
//         'The value of anInt was ${obj.anInt} \n rather than the expected (1).');
//   }
//   if (obj.aString != 'String!') {
//     errs.add(
//         'The value of aString was \'${obj.aString}\' \n rather than the expected (\'String!\').');
//   }
//   if (obj.aList.length != 1) {
//     errs.add(
//         'The length of aList was ${obj.aList.length} \n rather than the expected value (1).');
//   } else {
//     if (obj.aList[0] != 3.0) {
//       errs.add(
//           'The value found in aList was ${obj.aList[0]} \n rather than the expected (3.0).');
//     }
//   }
//   if (!obj._done) {
//     errs.add('It looks like allDone() wasn\'t called.');
//   }
//   if (errs.isEmpty) {
//     print('Success!');
//   } else {
//     errs.forEach(print);
//   }
// }

// // getters and setters
// class InvalidPriceException {}
//
// class ShoppingCart {
//   List<double> _prices = [];
//
//   // double get total => _prices.reduce((a, b) => a + b);
//   double get total => _prices.fold(0, (a, b) => a + b);
//
//   void set prices(List<double> values) {
//     if (values.any((p) => p < 0)) {
//       throw InvalidPriceException();
//     }
//
//     _prices = values;
//   }
// }
//
// // Tests your solution (Don't edit!):
// void main() {
//   var foundException = false;
//
//   try {
//     final cart = ShoppingCart();
//     cart.prices = [12.0, 12.0, -23.0];
//   } on InvalidPriceException {
//     foundException = true;
//   } catch (e) {
//     print(
//         'Tried setting a negative price and received a ${e.runtimeType} \n instead of an InvalidPriceException.');
//     return;
//   }
//
//   if (!foundException) {
//     print(
//         'Tried setting a negative price \n and didn\'t get an InvalidPriceException.');
//     return;
//   }
//
//   final secondCart = ShoppingCart();
//
//   try {
//     secondCart.prices = [1.0, 2.0, 3.0];
//   } catch (e) {
//     print(
//         'Tried setting prices with a valid list, \n but received an exception: ${e.runtimeType}.');
//     return;
//   }
//
//   if (secondCart._prices.length != 3) {
//     print(
//         'Tried setting prices with a list of three values, \n but _prices ended up having length ${secondCart._prices.length}.');
//     return;
//   }
//
//   if (secondCart._prices[0] != 1.0 ||
//       secondCart._prices[1] != 2.0 ||
//       secondCart._prices[2] != 3.0) {
//     final vals = secondCart._prices.map((p) => p.toString()).join(', ');
//     print(
//         'Tried setting prices with a list of three values (1, 2, 3), \n but incorrect ones ended up in the price list ($vals) .');
//     return;
//   }
//
//   var sum = 0.0;
//
//   try {
//     sum = secondCart.total;
//   } catch (e) {
//     print('Tried to get total, but received an exception: ${e.runtimeType}.');
//     return;
//   }
//
//   if (sum != 6.0) {
//     print(
//         'After setting prices to (1, 2, 3), total returned $sum instead of 6.');
//     return;
//   }
//
//   print('Success!');
// }

// // optional positional parameters
// String joinWithCommas(int a, [int? b, int? c, int? d, int? e]) {
//   List<int> sum = <int>[a];
//   if (b != null) sum.add(b);
//   if (c != null) sum.add(c);
//   if (d != null) sum.add(d);
//   if (e != null) sum.add(e);
//   return sum.join(',');
// }
//
// // Tests your solution (Don't edit!):
// void main() {
//   final errs = <String>[];
//   try {
//     final value = joinWithCommas(1);
//     if (value != '1') {
//       errs.add(
//           'Tried calling joinWithCommas(1) \n and got $value instead of the expected (\'1\').');
//     }
//   } on UnimplementedError {
//     print(
//         'Tried to call joinWithCommas but failed. \n Did you implement the method?');
//     return;
//   } catch (e) {
//     print(
//         'Tried calling joinWithCommas(1), \n but encountered an exception: ${e.runtimeType}.');
//     return;
//   }
//   try {
//     final value = joinWithCommas(1, 2, 3);
//     if (value != '1,2,3') {
//       errs.add(
//           'Tried calling joinWithCommas(1, 2, 3) \n and got $value instead of the expected (\'1,2,3\').');
//     }
//   } on UnimplementedError {
//     print(
//         'Tried to call joinWithCommas but failed. \n Did you implement the method?');
//     return;
//   } catch (e) {
//     print(
//         'Tried calling joinWithCommas(1, 2 ,3), \n but encountered an exception: ${e.runtimeType}.');
//     return;
//   }
//   try {
//     final value = joinWithCommas(1, 2, 3, 4, 5);
//     if (value != '1,2,3,4,5') {
//       errs.add(
//           'Tried calling joinWithCommas(1, 2, 3, 4, 5) \n and got $value instead of the expected (\'1,2,3,4,5\').');
//     }
//   } on UnimplementedError {
//     print(
//         'Tried to call joinWithCommas but failed. \n Did you implement the method?');
//     return;
//   } catch (e) {
//     print(
//         'Tried calling stringify(1, 2, 3, 4 ,5), \n but encountered an exception: ${e.runtimeType}.');
//     return;
//   }
//   if (errs.isEmpty) {
//     print('Success!');
//   } else {
//     errs.forEach(print);
//   }
// }

// // named parameters
// class MyDataObject {
//   final int anInt;
//   final String aString;
//   final double aDouble;
//   MyDataObject({
//     this.anInt = 1,
//     this.aString = 'Old!',
//     this.aDouble = 2.0,
//   });
//   MyDataObject copyWith({int? newInt, String? newString, double? newDouble}) {
//     return MyDataObject(
//         anInt: newInt ?? this.anInt,
//         aString: newString ?? this.aString,
//         aDouble: newDouble ?? this.aDouble);
//   }
// }
//
// // Tests your solution (Don't edit!):
// void main() {
//   final source = MyDataObject();
//   final errs = <String>[];
//   try {
//     final copy = source.copyWith(newInt: 12, newString: 'New!', newDouble: 3.0);
//     if (copy.anInt != 12) {
//       errs.add(
//           'Called copyWith(newInt: 12, newString: \'New!\', newDouble: 3.0), \n and the new object\'s anInt was ${copy.anInt} rather than the expected value (12).');
//     }
//     if (copy.aString != 'New!') {
//       errs.add(
//           'Called copyWith(newInt: 12, newString: \'New!\', newDouble: 3.0), \n and the new object\'s aString was ${copy.aString} rather than the expected value (\'New!\').');
//     }
//     if (copy.aDouble != 3) {
//       errs.add(
//           'Called copyWith(newInt: 12, newString: \'New!\', newDouble: 3.0), \n and the new object\'s aDouble was ${copy.aDouble} rather than the expected value (3).');
//     }
//   } catch (e) {
//     print(
//         'Called copyWith(newInt: 12, newString: \'New!\', newDouble: 3.0) \n and got an exception: ${e.runtimeType}');
//   }
//   try {
//     final copy = source.copyWith();
//     if (copy.anInt != 1) {
//       errs.add(
//           'Called copyWith(), and the new object\'s anInt was ${copy.anInt} \n rather than the expected value (1).');
//     }
//     if (copy.aString != 'Old!') {
//       errs.add(
//           'Called copyWith(), and the new object\'s aString was ${copy.aString} \n rather than the expected value (\'Old!\').');
//     }
//     if (copy.aDouble != 2) {
//       errs.add(
//           'Called copyWith(), and the new object\'s aDouble was ${copy.aDouble} \n rather than the expected value (2).');
//     }
//   } catch (e) {
//     print('Called copyWith() and got an exception: ${e.runtimeType}');
//   }
//   if (errs.isEmpty) {
//     print('Success!');
//   } else {
//     errs.forEach(print);
//   }
// }

// exceptions
// typedef VoidFunction = void Function();
//
// class ExceptionWithMessage {
//   final String message;
//   const ExceptionWithMessage(this.message);
// }
//
// // Call logException to log an exception, and doneLogging when finished.
// abstract class Logger {
//   void logException(Type t, [String? msg]);
//   void doneLogging();
// }
//
// void tryFunction(VoidFunction untrustworthy, Logger logger) {
//   try {
//     untrustworthy();
//   } on ExceptionWithMessage catch (e) {
//     logger.logException(e.runtimeType, e.message);
//   } on Exception catch (e) {
//     logger.logException(e.runtimeType);
//   } finally {
//     logger.doneLogging();
//   }
// }
//
// // Tests your solution (Don't edit!):
// class MyLogger extends Logger {
//   Type? lastType;
//   String lastMessage = '';
//   bool done = false;
//
//   void logException(Type t, [String? message]) {
//     lastType = t;
//     lastMessage = message ?? lastMessage;
//   }
//
//   void doneLogging() => done = true;
// }
//
// void main() {
//   final errs = <String>[];
//   var logger = MyLogger();
//
//   try {
//     tryFunction(() => throw Exception(), logger);
//
//     if ('${logger.lastType}' != 'Exception' &&
//         '${logger.lastType}' != '_Exception') {
//       errs.add(
//           'Untrustworthy threw an Exception, but a different type was logged: \n ${logger.lastType}.');
//     }
//
//     if (logger.lastMessage != '') {
//       errs.add(
//           'Untrustworthy threw an Exception with no message, but a message \n was logged anyway: \'${logger.lastMessage}\'.');
//     }
//
//     if (!logger.done) {
//       errs.add(
//           'Untrustworthy threw an Exception, \n and doneLogging() wasn\'t called afterward.');
//     }
//   } catch (e) {
//     print(
//         'Untrustworthy threw an exception, and an exception of type \n ${e.runtimeType} was unhandled by tryFunction.');
//   }
//
//   logger = MyLogger();
//
//   try {
//     tryFunction(() => throw ExceptionWithMessage('Hey!'), logger);
//
//     if (logger.lastType != ExceptionWithMessage) {
//       errs.add(
//           'Untrustworthy threw an ExceptionWithMessage(\'Hey!\'), but a \n different type was logged: ${logger.lastType}.');
//     }
//
//     if (logger.lastMessage != 'Hey!') {
//       errs.add(
//           'Untrustworthy threw an ExceptionWithMessage(\'Hey!\'), but a \n different message was logged: \'${logger.lastMessage}\'.');
//     }
//
//     if (!logger.done) {
//       errs.add(
//           'Untrustworthy threw an ExceptionWithMessage(\'Hey!\'), \n and doneLogging() wasn\'t called afterward.');
//     }
//   } catch (e) {
//     print(
//         'Untrustworthy threw an ExceptionWithMessage(\'Hey!\'), \n and an exception of type ${e.runtimeType} was unhandled by tryFunction.');
//   }
//
//   logger = MyLogger();
//   bool caughtStringException = false;
//
//   try {
//     tryFunction(() => throw 'A String', logger);
//   } on String {
//     caughtStringException = true;
//   }
//
//   if (!caughtStringException) {
//     errs.add(
//         'Untrustworthy threw a string, and it was incorrectly handled inside tryFunction().');
//   }
//
//   logger = MyLogger();
//
//   try {
//     tryFunction(() {}, logger);
//
//     if (logger.lastType != null) {
//       errs.add(
//           'Untrustworthy didn\'t throw an Exception, \n but one was logged anyway: ${logger.lastType}.');
//     }
//
//     if (logger.lastMessage != '') {
//       errs.add(
//           'Untrustworthy didn\'t throw an Exception with no message, \n but a message was logged anyway: \'${logger.lastMessage}\'.');
//     }
//
//     if (!logger.done) {
//       errs.add(
//           'Untrustworthy didn\'t throw an Exception, \n but doneLogging() wasn\'t called afterward.');
//     }
//   } catch (e) {
//     print(
//         'Untrustworthy didn\'t throw an exception, \n but an exception of type ${e.runtimeType} was unhandled by tryFunction anyway.');
//   }
//
//   if (errs.isEmpty) {
//     print('Success!');
//   } else {
//     errs.forEach(print);
//   }
// }

// // using this in a constructor
// class MyClass {
//   final int anInt;
//   final String aString;
//   final double aDouble;
//   MyClass(this.anInt, this.aString, this.aDouble);
// }
//
// // Tests your solution (Don't edit!):
// void main() {
//   final errs = <String>[];
//   try {
//     final obj = MyClass(1, 'two', 3);
//     if (obj.anInt != 1) {
//       errs.add(
//           'Called MyClass(1, \'two\', 3) and got an object with anInt of ${obj.anInt} \n instead of the expected value (1).');
//     }
//     if (obj.anInt != 1) {
//       errs.add(
//           'Called MyClass(1, \'two\', 3) and got an object with aString of \'${obj.aString}\' \n instead of the expected value (\'two\').');
//     }
//     if (obj.anInt != 1) {
//       errs.add(
//           'Called MyClass(1, \'two\', 3) and got an object with aDouble of ${obj.aDouble} \n instead of the expected value (3).');
//     }
//   } catch (e) {
//     print(
//         'Called MyClass(1, \'two\', 3) and got an exception \n of type ${e.runtimeType}.');
//   }
//   if (errs.isEmpty) {
//     print('Success!');
//   } else {
//     errs.forEach(print);
//   }
// }

// // initializer lists
// class FirstTwoLetters {
//   final String letterOne;
//   final String letterTwo;
//   // TODO: Create a constructor with an initializer list here:
//   FirstTwoLetters(String word)
//       : assert(word.length >= 2),
//         this.letterOne = word[0],
//         this.letterTwo = word[1];
// }
//
// // Tests your solution (Don't edit!):
// void main() {
//   final errs = <String>[];
//   try {
//     final result = FirstTwoLetters('My String');
//     if (result.letterOne != 'M') {
//       errs.add(
//           'Called FirstTwoLetters(\'My String\') and got an object with \n letterOne equal to \'${result.letterOne}\' instead of the expected value (\'M\').');
//     }
//     if (result.letterTwo != 'y') {
//       errs.add(
//           'Called FirstTwoLetters(\'My String\') and got an object with \n letterTwo equal to \'${result.letterTwo}\' instead of the expected value (\'y\').');
//     }
//   } catch (e) {
//     errs.add(
//         'Called FirstTwoLetters(\'My String\') and got an exception \n of type ${e.runtimeType}.');
//   }
//   bool caughtException = false;
//   try {
//     FirstTwoLetters('');
//   } catch (e) {
//     caughtException = true;
//   }
//   if (!caughtException) {
//     errs.add(
//         'Called FirstTwoLetters(\'\') and didn\'t get an exception \n from the failed assertion.');
//   }
//   if (errs.isEmpty) {
//     print('Success!');
//   } else {
//     errs.forEach(print);
//   }
// }

// // named constructor
// class Color {
//   int red;
//   int green;
//   int blue;
//   Color(this.red, this.green, this.blue);
//   // TODO: Create a named constructor called "Color.black" here:
//   Color.black()
//       : this.red = 0,
//         this.green = 0,
//         this.blue = 0;
// }
//
// // Tests your solution (Don't edit!):
// void main() {
//   final errs = <String>[];
//   try {
//     final result = Color.black();
//     if (result.red != 0) {
//       errs.add(
//           'Called Color.black() and got a Color with red equal to \n ${result.red} instead of the expected value (0).');
//     }
//     if (result.green != 0) {
//       errs.add(
//           'Called Color.black() and got a Color with green equal to \n ${result.green} instead of the expected value (0).');
//     }
//     if (result.blue != 0) {
//       errs.add(
//           'Called Color.black() and got a Color with blue equal to \n ${result.blue} instead of the expected value (0).');
//     }
//   } catch (e) {
//     print(
//         'Called Color.black() and got an exception of type \n ${e.runtimeType}.');
//     return;
//   }
//   if (errs.isEmpty) {
//     print('Success!');
//   } else {
//     errs.forEach(print);
//   }
// }

// // factory constructors
// class IntegerHolder {
//   IntegerHolder();
//   // Implement this factory constructor.
//   factory IntegerHolder.fromList(List<int> list) {
//     if (list.length == 1) return IntegerSingle(list[0]);
//     if (list.length == 2) return IntegerDouble(list[0], list[1]);
//     if (list.length == 3) return IntegerTriple(list[0], list[1], list[2]);
//     throw ArgumentError('Only supports 1, 2, or 3 values');
//   }
// }
//
// class IntegerSingle extends IntegerHolder {
//   final int a;
//   IntegerSingle(this.a);
// }
//
// class IntegerDouble extends IntegerHolder {
//   final int a;
//   final int b;
//   IntegerDouble(this.a, this.b);
// }
//
// class IntegerTriple extends IntegerHolder {
//   final int a;
//   final int b;
//   final int c;
//   IntegerTriple(this.a, this.b, this.c);
// }
//
// // Tests your solution (Don't edit from this point to end of file):
// void main() {
//   final errs = <String>[];
//   // Run 5 tests to see which values have valid integer holders
//   for (var tests = 0; tests < 5; tests++) {
//     if (!testNumberOfArgs(errs, tests)) return;
//   }
//   // The goal is no errors with values 1 to 3,
//   // but have errors with values 0 and 4.
//   // The testNumberOfArgs method adds to the errs array if
//   // the values 1 to 3 have an error and
//   // the values 0 and 4 don't have an error
//   if (errs.isEmpty) {
//     print('Success!');
//   } else {
//     errs.forEach(print);
//   }
// }
//
// bool testNumberOfArgs(List<String> errs, int count) {
//   bool _threw = false;
//   final ex = List.generate(count, (index) => index + 1);
//   final callTxt = "IntegerHolder.fromList(${ex})";
//   try {
//     final obj = IntegerHolder.fromList(ex);
//     final String vals = count == 1 ? "value" : "values";
//     // Uncomment the next line if you want to see the results realtime
//     // print("Testing with ${count} ${vals} using ${obj.runtimeType}.");
//     testValues(errs, ex, obj, callTxt);
//   } on Error {
//     _threw = true;
//   } catch (e) {
//     switch (count) {
//       case (< 1 && > 3):
//         if (!_threw) {
//           errs.add('Called ${callTxt} and it didn\'t throw an Error.');
//         }
//       default:
//         errs.add('Called $callTxt and received an Error.');
//     }
//   }
//   return true;
// }
//
// void testValues(List<String> errs, List<int> expectedValues, IntegerHolder obj,
//     String callText) {
//   for (var i = 0; i < expectedValues.length; i++) {
//     int found;
//     if (obj is IntegerSingle) {
//       found = obj.a;
//     } else if (obj is IntegerDouble) {
//       found = i == 0 ? obj.a : obj.b;
//     } else if (obj is IntegerTriple) {
//       found = i == 0
//           ? obj.a
//           : i == 1
//               ? obj.b
//               : obj.c;
//     } else {
//       throw ArgumentError(
//           "This IntegerHolder type (${obj.runtimeType}) is unsupported.");
//     }
//     if (found != expectedValues[i]) {
//       errs.add("Called $callText and got a ${obj.runtimeType} " +
//           "with a property at index $i value of $found " +
//           "instead of the expected (${expectedValues[i]}).");
//     }
//   }
// }

// // redirecting constructors
// class Color {
//   int red;
//   int green;
//   int blue;
//   Color(this.red, this.green, this.blue);
//   // TODO: Create a named constructor called "black" here
//   // and redirect it to call the existing constructor
//   Color.black() : this(0, 0, 0);
// }
//
// // Tests your solution (Don't edit!):
// void main() {
//   final errs = <String>[];
//   try {
//     final result = Color.black();
//     if (result.red != 0) {
//       errs.add(
//           'Called Color.black() and got a Color with red equal to \n ${result.red} instead of the expected value (0).');
//     }
//     if (result.green != 0) {
//       errs.add(
//           'Called Color.black() and got a Color with green equal to \n ${result.green} instead of the expected value (0).');
//     }
//     if (result.blue != 0) {
//       errs.add(
//           'Called Color.black() and got a Color with blue equal to \n ${result.blue} instead of the expected value (0).');
//     }
//   } catch (e) {
//     print(
//         'Called Color.black() and got an exception of type ${e.runtimeType}.');
//     return;
//   }
//   if (errs.isEmpty) {
//     print('Success!');
//   } else {
//     errs.forEach(print);
//   }
// }

// // const constructors
// class Recipe {
//   final List<String> ingredients;
//   final int calories;
//   final double milligramsOfSodium;
//   // TODO: Create a const constructor here"
//   const Recipe(this.ingredients, this.calories, this.milligramsOfSodium);
// }
//
// // Tests your solution (Don't edit!):
// void main() {
//   final errs = <String>[];
//   try {
//     const obj = Recipe(['1 egg', 'Pat of butter', 'Pinch salt'], 120, 200);
//     if (obj.ingredients.length != 3) {
//       errs.add(
//           'Called Recipe([\'1 egg\', \'Pat of butter\', \'Pinch salt\'], 120, 200) \n and got an object with ingredient list of length ${obj.ingredients.length} rather than the expected length (3).');
//     }
//     if (obj.calories != 120) {
//       errs.add(
//           'Called Recipe([\'1 egg\', \'Pat of butter\', \'Pinch salt\'], 120, 200) \n and got an object with a calorie value of ${obj.calories} rather than the expected value (120).');
//     }
//     if (obj.milligramsOfSodium != 200) {
//       errs.add(
//           'Called Recipe([\'1 egg\', \'Pat of butter\', \'Pinch salt\'], 120, 200) \n and got an object with a milligramsOfSodium value of ${obj.milligramsOfSodium} rather than the expected value (200).');
//     }
//   } catch (e) {
//     print(
//         'Tried calling Recipe([\'1 egg\', \'Pat of butter\', \'Pinch salt\'], 120, 200) \n and received a null.');
//   }
//   if (errs.isEmpty) {
//     print('Success!');
//   } else {
//     errs.forEach(print);
//   }
// }
