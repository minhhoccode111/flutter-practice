// imports
import 'dart:async';
import 'dart:math';

main(List<String> args) {
  // prepare
  final random = Random();

  // start
  identical(2, 3);

  var rounded = 2.5.round();

  var thisIsAString = 'this is a string';

  final singleQuotes = 'i\'m learning dart'; // i'm learning dart
  final doubleQuotes = 'escaping the \" character'; // escaping the \ character
  final dollarEscape = 'the price is \$3.14.'; // the price is $3.14
  final backslashEscape =
      'the dart string escape is \\'; // the dart string escape is \
  final unicode = '\u{1F60E}'; // unicode scalar U+1F60E

  var food = 'bread';
  var str1 = 'i eat $food'; // i eat bread
  var str2 = 'i eat ${food}'; // i eat bread

  final string1 = 'string '
      'concatenation '
      'automatically';

  final string2 = '''
  multi line string
  ''';

  final string3 = """
  also multi line string
  """;

  final string4 = 'string '
      '4';

  assert(string4 == 'string 4'); // true

  var isBananaPeeled = false;

  // by convention, use var or final when the analyzer can infer the type
  // declare a variable with a specific type
  // when you don't provide an initial value
  String name1;
  // declare and initialize a variable
  // at the same time and dart infers the type
  var name2 = 'bob';

  // if you don't provide an initial value or explicit type,
  // dart infers the variable's type to be the catch-all type dynamic
  //  declare a variable without a type or assigned value and dart
  // infers the 'dynamic' type
  var name3;
  name3 = 'bob';
  name3 = 1; // allowed, as 'name' has type 'dynamic'

  // both use `const` but differ in how `const` works
  // where javascript use `const`, dart uses `final`
  // when you add `final` to a dart variable or `const` to a javascript
  // variable, you must initialize the variable before other code can read its
  // value. once initialized, you can't change these variables references
  // when dart uses `const`, it refers to special values that it creates when
  // compiling. dart uses limited expressions to create these immutable values.
  // these expressions cannot have side effects. under these conditions, the compiler can the predict the precise value of a constant variable or expression,
  // not use its static type

  // final String name4;
  // // cannot read name here, not initialized
  // if (useNickname) {
  //   name4 = 'Bob';
  // } else {
  //   name4 = "robert";
  // }
  // print(name4); // properly initialized here

  var foo = const [];
  // `foo` is not constant, but the value it points to is
  // you can reassign `foo` to a different list value
  // but its current list value cannot be altered
  const baz = []; // equivalent to `const []`

  // null safety

  // in null-safe dart, none of three can ever be null
  var i = 42; // inferred to be an int
  String name = getSomething(); //
  final b = Foo(); // Foo() invokes a constructor

  // to indicate that a variable might have the value `null`, add `?` to its
  // type declaration
  int? aNullableInt = null;
  // same goes for any other type declaration, such as a function declaration
  String? returnsNullable() {
    return random.nextDouble() < 0.5 ? 'string' : null;
  }

  String returnsNonNullable() {
    return 'never null';
  }

  // null aware operator

  // operators
  // ??=
  // ??
  // ?.
  // int? a = 5;
  // int b = a; // not allowed
  // int b = a!; // allowed
  // at runtime, if `a` turns out to be `null`, a runtime error occurs

  // like the `?.` operator, use the `!` operator when accessing properties or methods on an object
  // myObject!.someProperty;
  // myObject!.someMethod();
  // if `myObject` is null, a runtime error occurs

  // FUNCTIONS

  // while dart's functionss work much the same as their counterpart in JS, they
  // do have some additional features, and some minor syntax differences when
  // declaring them. similar to JS, you can declare functions pertty much
  // anywhere, whether at the top level, as a class field, or in the local scope
  // on the top level
  int multiply1(a, b) {
    return a * b;
  }

  // // as a class field
  // class Multiplier {
  //   multiply(a, b) {
  //     return a * b;
  //   }
  // }
  // in a local scope

  // arrow syntax
  // bool isNoble(int? atomicNumber) {
  //   return atomicNumber != null;
  // }
  bool isNoble(int? atomicNumber) => atomicNumber != null;

  // PARAMETERS
  int multiply2(a, b) => a * b;

  multiply2(1, 2); // valid, all parameters are provided
  // multiply2(1); // invalid, all parameters must be provided

  // to define optional positional parameters, enclose them in square brackets
  // following any required positional parameters, you can't follow optional
  // parameters with required parameters.
  // Due to null safety, optional positional parameters must have a default value
  // or be marked as nullable.

  // valid: `b` has a default value of 5. `c` is marked as nullable
  void multiply3(int a, [int b = 5, int? c]) => null;

  // invalid: a required positional parameter follows an optional one
  // void multiply4(int a, [int b = 5], int c) => null;

  // invalid: neither optional positional parameter has a default value or has
  // been flagged as nullable
  // void multiply4(int a, [int b, int c]) => null;

  // how to call a function with optional parameters
  multiply3(1);
  multiply3(1, 2);
  multiply3(1, 2, 3);

  // dart supports named parameters. These don't have to be provided in the order
  // they're defined, as with positional parameters. you refer to them by name
  // instead. By default, these are optional, unless they're flagged as required.
  // Named parameters are defined by surrounding them with curly braces. You can
  // combine named parameters with required positional parameters - in this
  // scenario, the named parameters are always placed after positional. When
  // calling a function with named parameters, pass values by prefixing the
  // value with the name of the parameter, separated by a colon. For example
  // f(nameParameter: 5)

  // again, with null safety, named parameters that are not flagged as required
  // either to have a default value or be flagged as nullable

  // function with named parameters
  // `a`: has been flagged as required
  // `b`: has a default value of 5
  // `c`: is marked as nullable
  // named parameters follow the positional one
  void multiply4(bool x, {required int a, int b = 5, int? c}) => null;
  // example calling that function
  multiply4(false, a: 3); // only provide required named parameter
  multiply4(false, a: 3, b: 9); // override default value of `b`
  multiply4(false, c: 9, a: 3, b: 2); // give all named parameters out of order

  // FIRST-CLASS FUNCTIONS
  // dart treats functions as any other object
  void printElement(int element) => print(element);

  var list = [1, 2, 3];

  // pass printElement as a parameter
  list.forEach(printElement);

  // ANONYMOUS FUNCTIONS
  // javascript and dart both support anonymous functions, or functions without
  // a name. just like named functions, you can pass anonymous functions like
  // any other value. for example, store anonymous functions in a variable, pass
  // them as an argument to another function, or return them from another
  // function

  // assign an anonymous function to a variable
  var blockFunc = false ??
      (int a, int b) {
        return a + b;
      };

  // for an expression with only a return statement you can use the arrow syntax
  var singleFunc = (int a, int b) => a * b;

  // pass anonymous functions to other functions
  // returns [4, 5, 6]
  [1, 2, 3].map((e) => e + 3).toList();

  // return [5, 7, 9]
  var list1 = [1, 2, 3].map((e) {
    e *= 2;
    return e + 3;
  }).toList();

  // NOTE:the `map` function in the previous examples returns an Iterable<T>,
  // rather than a List<T>.
  // the `toList` function converts the returned `Iterable` back to a `List`
  // a list literal could achieve the same goal

  // these two statement are equivalent
  print([
    for (var e in [1, 2, 3]) e + 3
  ]);
  print([1, 2, 3].map((e) => e + 3).toList());

  // GENERATOR FUNCTIONS
  // both languages support generator functions.
  // these functions return an iterable collection of items computed to avoid
  // unnecessary work

  // to write a generator function in dart, add the `sync*` keyword after the
  // function parameters, and return an `Iterable`. Add items to the final
  // iterable using the `yield` keyword, or add whole sets of items using
  // `yield*`

  Iterable<int> naturalsTo(int n) sync* {
    int k = 0;
    while (k < n) {
      yield k++;
    }
  }

  // returns an iterable with [0, 1, 2, 3, 4]
  print(naturalsTo(5).toList());

  Iterable<int> doubleNaturalsTo(int n) sync* {
    int k = 0;
    while (k < n) {
      yield* [k, k];
      k++;
    }
  }

  // returns an iterable with [0, 0, 1, 1, 2, 2, 3, 3]
  print(doubleNaturalsTo(4));

  // you can also define asynchronous generator functions, which return streams
  // instead of iterables

  // STATEMENTS

  // control flow
  // most control statements work like their javascript counterparts. some have
  // additional uses for Collections

  // while both javascript and dart have `for-in` loops, their behaviours differ
  // JS's `for-in` loop iterates over an object's properties. To iterate over a
  // JS iterable object's elements, you must use `for-of` or `Array.forEach()`
  // Dart's `for-in` loop works like JS `for-of`

  // the following example shows iterating over a collection and printing out
  // each element
  for (final element in [1, 2, 3]) {
    print(element);
  }

  // one key different with the `switch` statement in JS and Dart: when a case
  // has no `break`, `continue`, or `return` statement, JS allows execution to
  // fall through and continue with the next statement. However, Dart only allows
  // this when a case's body is empty

  // when using `continue` in a `switch` statement, you can combine it with a
  // label that is put on a case

  // switch (testEnum) {
  //   case TestEnum.A:
  //     print('A');
  //     continue b;
  //   b:
  //   case TestEnum.B:
  //     print('B');
  //     break;
  // }

  // OPERATORS
  // both Dart and JS contain predefined operators. Neither language supports
  // adding new operators. Dart supports overloading some existing operators with
  // the `operator` keyword. for example:

  // class Vector {
  //   final double x;
  //   final double y;
  //   final double z;
  //   Vector(this.x, this.y, this.z);
  //   Vector operator +(Vector other) => Vector(
  //     x + other.x,
  //     y + other.y,
  //     z + other.z,
  //   );
  //   Vector operator *(double scalar) => Vector(
  //     x + scalar,
  //     y + scalar,
  //     z + scalar,
  //   );
  // }

  // ARITHMETIC OPERATORS

  assert(5 ~/ 2 == 2); // result is an int
  assert(5 / 2 == 2.5); // result is a double

  // TYPE TEST OPERATORS
  // use the typecase operator (`as`) to ensure that a value has a particular
  // type. The compiler can use that, if you KNOW that the object will have that
  // type
  // example:
  // (person as Employee).employeeNumber = 123;

  // if you don't KNOW that the object is of type `T`, the use `is T` to check
  // the type BEFORE using the object
  // in dart, the types of local variables update within the scope of the if
  // statement. this is not the case for instance variables
  // if (person is Employee) {
  //   person.employeeNumber = 123;
  // }

  // LOGICAL OPERATORS
  // the logical operators of both languages are identical

  // bitwise and shift operators

  // conditional operators

  // final visibility = isPublic ? 'public' : 'private';

  // CASCADES (`..` OPERATOR)
  // dart allows you to chain multiple method calls, property assignments, or
  // both on a single object. Dart refers to this as cascading and uses the
  // cascade syntax (`..`) to perform this action

  // javascript lacks this syntax

  var people = new People() // sets multiple properties and methods
    ..name = 'bob'
    ..age = 11
    ..feed()
    ..walk();

  print(people.name); // bob
  print(people.age); // 11

  // the make the first cascade syntax null-aware, write it as `?..`

  // var result = maybePerson
  // ?.. employment = employer
  // .. salary = salary;
  // Dart ignores the entire cascade if the `maybePerson` if null

  // COLLECTIONS
  // this section covers some collection types in Dart and compare them to
  // similar types in JS

  // lists
  // dart writes list literals in the same ways as JS arrays. Dart encloses lists
  // in square brackets and separate values with commas

  // initialize list and specify full type
  final List<String> list2 = <String>['one', 'two', 'three'];

  // initialize list using shorthand type
  final list3 = <String>['one', 'two', 'three'];

  // dart can also infer the type
  final list4 = ['one', 'two', 'three'];

  // the following code samples give an overview of the basic actions that you
  // can perform on a Dart `List`. The following example shows how to retrieve
  // a value from a `List` using the index operator
  final fruits = <String>['apple', 'orange', 'pear'];
  final fruit = fruits[1];

  // add a vlue to the end of the `List` using the `add` method.
  // Add another `List` using the `addAll` method:
  fruits.add('peach');
  fruits.addAll(['kiwi', 'mango']);

  // insert a value at a specific position using the `insert` method. Insert
  // another `List` at a specific position using the `insertAll` method
  fruits.insert(0, 'peach');
  fruits.insertAll(0, ['kiwi', 'mango']);

  // update a value in the `List` combining the index and assignment operators
  fruits[1] = 'banana';

  // remove items from a `List` using one of the following methods
  // remove the value 'pear' from the list
  fruits.remove('pear');
  // remove the last element from the list
  fruits.removeLast();
  // removes the element at position 1 from the list
  fruits.removeAt(1);
  // remove the elements with positions greater than or equal to start (1) and
  // less than end (3) from the list
  fruits.removeRange(1, 3);
  // remove all elements from the list that match the given predicate
  fruits.removeWhere((fruit) => fruit.contains('p'));

  // use `length` to obtain the number of values in the `List`:
  assert(fruits.length == 3);

  // use `isEmpty` to check if the `List` is empty:
  assert(fruits.isEmpty); // false

  // use `isNotEmpty` to check if the `List` is not empty
  assert(fruits.isNotEmpty); // true

  // FILLED
  // dart's `List` class includes a way to create a List with each item having
  // the same value. This `filled` constructor creates a fixed-length list of
  // size `n` with one default value. The following example create a list of 3
  // items
  final list5 = List.filled(3, 'a'); // create [ 'a', 'a', 'a' ]
  // you cannot add or remove element from this list by default. To permit this
  // list to add or remove elements, add `, growable: true` to the end of the
  // parameters list
  // you can access and update elements of this list using their index value

  // GENERATE
  // the dart `List` class includes a way to create a list of incrementing values
  // this `generate`constructor creates a fixed-length list of size `n` with a
  // template to build element values. this template takes the index as a param
  // creates: [ 'a0', 'a1', 'a2' ]
  final list6 = List.generate(3, (index) => 'a$index');

  // SETS
  // unlike JS, Dart supports defining `Set`s with literals. Dart defines sets
  // in the same way as lsits but using curly braces rather than square brackets
  // Sets are unordered collections that only contain unique items.
  // dart enforces the uniqueness of these items using hash codes, meaning that
  // objects need hash values to be stored in a `Set`
  final abcSet = {'a', 'b', 'c'};
  // the syntax for creating an empty set might seem confusing at first, because
  // specifying empty curly braces (`{}`) results in creating an empty `Map`
  // to create an empty `Set`, precede the `{}` declaration with a type argument
  // or assign `{}` to a variable of type `Set`
  final emptySet = <String>{};

  // Set<String> names = {}; // this works, too
  // final names = {}; // create an empty map, not a set

  // basic actions can be performed on a `Set`
  // add a value to the `Set` using the `add` method. Use the `addAll` method
  // to add multiple values
  final fruitsSet = {'apple', 'orange', 'pear'};
  fruitsSet.add('peach');
  fruitsSet.addAll(['kiwi', 'mango']);

  // use one of the following methods in `Set` to remove content from the set
  fruitsSet.remove('pear');
  fruitsSet.removeAll(['orange', 'apple']);
  // remove all elements from the list that match the given predicate
  fruitsSet.removeWhere((fruit) => fruit.contains('p'));

  // use `length` to get the number of values in the `Set`
  assert(fruitsSet.length == 3);
  // use `isEmpty` to check if the `Set` is empty
  fruitsSet.isEmpty;
  // use `isNotEmpty` to check if the `Set` is not empty
  fruitsSet.isNotEmpty;

  // MAPS
  // the `Map` type in Dart resemble the `Map` type in JS. Both types associate
  // keys with values. A key can be any object type if all keys have the same
  // type. This rule applies to values as well. Each key occurs once at most,
  // but you can use the same value multiple times.

  // dart vases the dictionary on a hash table. This means that keys need to be
  // hashable. Every Dart object contains a hash
  // NOTE: in dart, the hash value of an object defaults to a value derived from
  // the object's identity, and being compatible with an equality where the obj
  // can only equal itself. To introduce an ewquality based on the contents of
  // the object, override `hashCode` and `operator==`

  // simple `Map` example, created using literals
  final gifts = {
    'first': 'partridge',
    'second': 'turtle doves',
    'fifth': 'golden rings'
  };

  final nobleGases = {2: 'helium', 10: 'neon', 18: 'argon'};

  // retrieve a value from a `Map` using the index operator
  final gift = gifts['third'];

  // if the map does not include the lookup key, the index operator return `null`

  // use the `containKey` method to check if the `Map` includes a key
  gifts.containsKey('fifth'); // true

  // use the index assignment operator (`[]=`) to add or update an entry in the
  // `Map`. If the `Map` doesn't yet contain the key, Dart adds the entry, if
  // the key exists, Dart updates its value
  gifts['third'] = 'turtle'; // gets added
  gifts['third'] = 'turtle doves'; // gets updated

  // use the `addAll` method to add another `Map`. Use the `addEntries` method
  // to add other entries to the `Map`
  final gifts2 = {'first': 'partridge'};

  gifts2['second'] = 'turtle doves';
  gifts2.addAll({
    'second': 'turtle doves',
    'fifth': 'golden rings',
  });

  gifts2.addEntries([
    MapEntry('second', 'turtle doves'),
    MapEntry('fifth', 'golden rings'),
  ]);

  // use the `remove` method to remove an entry from the `Map`. Use the
  // `removeWhere` method to remove all entries that satisfy a given test
  gifts.remove('first');
  gifts.removeWhere((key, value) => value == 'partridge');

  // use `length` to obtain the number of key-value pairs in the `Map`
  gifts.length == 2; // true

  // use `isEmpty` to check if the `Map` is empty
  gifts.isEmpty; // true
  // use `isNotEmpty` to check if the `Map` is not empty
  gifts.isNotEmpty; // false

  // UNMODIFIABLE
  // pure JS doesn't support immutability. Dart offers multiple ways to make
  // collections like arrays, sets, or dictionaries immutable

  // if the collection is a compile-time constant and shouldn't be modified, use
  // the `const` keyword
  const fruits3 = ['apple', 'banana', 'orange'];
  // assign the `Set` to a `final` field, meaning that the `Set` itself doesn't
  // have to be a compile-time constant. This ensures that the field can't be
  // overridden with another `Set`, but it still allows the size or the content
  // of the `Set` to be modified
  final fruits4 = {'apple', 'banana', 'orange'};
  // create a final version of your collection type using the `unmodifiable`
  // constructor (as shown in the following example). This creates a collection
  // that cannot change its size or content
  final _set = Set<String>.unmodifiable(['a', 'b', 'c']);
  final _list = List<String>.unmodifiable(['a', 'b', 'c']);
  final _map = Map<String, String>.unmodifiable({'foo': 'bar'});

  // SPREAD OPERATOR
  // as in js, dart supports embedding a list into another list using the spread
  // operator (`...`) and the null-aware spread operator (`...?`)
  var list7 = [1, 2, 3];
  var list8 = [0, ...list7]; // [0, 1, 2, 3]
  // when the list being inserted could be null
  var list9 = null;
  var list10 = [0, ...?list9]; // [0]

  // this also works for sets and maps
  // spread operator with maps
  var map1 = {'foo': 'bar', 'key': 'value'};
  var map2 = {'foo': 'bar', ...map1}; // {foo: bar, key: value}
  // spread operator with sets
  var set1 = {'foo', 'bar'};
  var set2 = {'foo', 'baz', ...set1}; // {foo, baz, bar}

  // COLLECTION IF/FOR

  // in dart, the `for` and `if` keywords have additional functionality when it
  // comes to collections
  // a collection `if` statement includes items from a list literal only when
  // the specified condition is met
  var nav = [
    'Home',
    'Furniture',
    'Plants',
    if (random.nextBool()) 'Outlet',
  ];
  // it works similarly for maps and sets
  // a collection `for` statement allows multiple items to be mapped into
  // another list
  var listOfInts = [1, 2, 3];
  var listOfString = [
    '#0',
    for (var i in listOfInts) '#$i',
  ]; // [#0, #1, #2, #3]
  // this also works in the same way for maps and sets

  // ASYNCHRONY
  // like JS, the Dart Virtual Machine (VM) runs a single event loop that
  // processes all your Dart code. This means that similar rules for asynchrony
  // apply here. All of your code runs synchronously but you can handle it in a
  // different order, depending on how you use the asynchronous tools at your
  // disposal. Here are some of these contructs and how they relate to their JS
  // counterpart

  // FUTURES
  // `Future` is Dart's version of a JS `Promise`. Both are the _result_ of an
  // asynchronous operation that resolves at a later point
  // functions in Dart or in Dart packages might return a `Future`, rather than
  // the value they represent, as the value might not be available until later
  // the following example shows that handling a future works in the same way in
  // Dart as a promise works in JS

  Future<String> func() async {
    return 'future';
  }

  Future<String> httpResponseBody = func();
  httpResponseBody.then((String value) {
    print('Future resolved to a value: $value');
  });

  // similarly, futures can fail like promises. Catching errros works the same
  // as well
  httpResponseBody.then((String value) {
    print('Future resolved to a value: $value');
  }).catchError((err) {
    print('Future encounted an error before resolving.');
  });

  // you can also create futures. To create a `Future`, define and call an
  // `async` function. When you have a value that needs to be a `Future` convert
  // the function as in the following example:
  String str = 'String Value';
  Future<String> stringFuture = Future<String>.value(str);

  // ASYNC/AWAIT
  // if you're familiar with promises in js, you're likely also familiar with
  // the `async`/`await` syntax. This syntax is identical in Dart: functions are
  // marked `async`, and `async` functions always return a `Future`. If the
  // function returns a `String` and is marked `async`, it return a
  // `Future<String>` instead. If it returns nothing, but it is `async`, it
  // return `Future<void>`

  // how to write an `async` function
  // return a future of a string as the method is async
  Future<String> fetchString() async {
    // typically some other async operations would be done here
    return 'String Value';
  }

  // call this `async` function as follows
  Future<String> stringFuture2 = fetchString();
  stringFuture.then((String value) {
    print(str); // String Value
  });

  // obtain a future's value using `await` keyword. As in JS, this remove the
  // need to call `then` on the `Future` to obtain its value, and it allows you
  // to write asynchronous code in a more synchronous-like way. As in JS,
  // awaiting futures is only possilbe within an `async` context (such as
  // another `async` function)
  // example shows how to await a future for its value

  // we can only await futures within an async context
  Future<void> asyncFunction() async {
    var str = await fetchString();
    print(str);
  }

  // STREAMS
  // another tools in Dart's async toolbox is `Stream`s. While JS has its own
  // concept of streams, Dart's are more akin to `Observable`s, as found in the
  // commonl used `rxjs` library. If you happen to be familiar with this library
  // Dart's streams should feel familiar
  // for those not familiar with these concepts: `Stream`s basically act like
  // `Future`s, but with multiple values spread out over time, like an event bus
  // Your code can listen to a stream, and it can either complete or reach a fail
  // state

  // LISTENING
  // to listen to a stream, call its `listen` method and provide a callback
  // method. Whenever the stream emits a value, Dart calls this method
  Stream<int> stream = Stream.fromIterable([1, 2, 3, 4, 5]);
  stream.listen((int value) {
    print('a value has been emitted: $value');
  });

  // the `listen` method includes optional callbacks for handling errors or for
  // when the stream completes
  stream.listen(
    (int value) {},
    onError: (err) {
      print('Stream encountered an error! $err');
    },
    onDone: () {
      print('Stream completed!');
    },
  );

  // the `listen` method returns an instance of a `StreamSubscription`, which
  // you can use to stop listening to the stream
  StreamSubscription subscription = stream.listen((int value) {
    print('there is a value: $value');
  }, onError: (err) {
    print('error occurs: $err');
  });
  subscription.cancel();
  // this is not the only way to listen to a stream. Similar to the
  // `async`/`await` syntax for `Future`, you can combine a stream with a
  // `for-in` loop in an `async` context. The `for` loop invokes the callback
  // method for each item emitted, and it ends when the stream completes or
  // errors out
  Future<int> sumStream(Stream<int> stream) async {
    var sum = 0;
    await for (final value in stream) {
      sum += value;
    }
    return sum;
  }
  // when an error occurs when listening to a stream in this way, the error is
  // rethrown at the line containing the `await` keyword. You can handle this
  // error with a `try-catch` statement

  Future<void> tryCatchStream(Stream<int> stream) async {
    try {
      await for (final value in stream) {
        //
      }
    } catch (err) {
      print('stream encountered an error! $err');
    }
  }

  // CREATING STREAMS
  // as with `Future`s, you have several different ways to create a stream. The
  // `Stream` class has utility constructors for creating streams from `Future`s
  // or `Iterable`s, or for creating streams that emit valuse at a timed interval

  // StreamController
  // The utility class `StreamController` can create and control streams. Its
  // stream property exposes the stream it controls. Its methods provides ways
  // to add events to that stream
  // for example the `add` method can emit new items and the `close` method
  // completes the stream
  // the following example shows basic usage of a stream controller
  var listeners = 0;
  StreamController<int>? controller;
  controller = StreamController<int>(onListen: () {
    // emit a new value every time the stream gets a new listener
    controller!.add(listeners++);
    // close the stream after the fifth listener
    if (listeners > 5) controller.close();
  });
  // get the stream for the stream controller
  var stream1 = controller.stream;
  // listen to the stream
  stream1.listen((int value) {
    print('$value');
  });

  // async generator functions can create streams. These functions resemble a
  // synchronous generator function but use the `async*` keyword and return a
  // `Stream`
  // in an async generator function, the `yield` keyword emits the given value
  // to the stream. The `yield*` keyword, however, works with streams instead of
  // other iterables. This allows events from other streams to be emitted to
  // this stream. In the following example, the function continues once the
  // newly yielded stream has completed
  Stream<int> asynchronousNaturalsTo(int n) async* {
    var k = 0;
    while (k < n) yield k++;
  }

  Stream<int> stream2 = asynchronousNaturalsTo(5);
  // print each of 0 1 2 3 4 in succession
  stream2.forEach(print);

  // CLASSES
  // js_to_dart_1.dart
}

String getSomething() {
  return 'string';
}

Foo() {}

class People {
  var age;
  var name;
  People();

  void feed() {
    print('nom nom');
  }

  void walk() {
    print('walking');
  }
}
