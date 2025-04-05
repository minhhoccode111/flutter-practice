// imports

void main(List<String> args) {
  // print('Hello, World!');

  Function func = () => print('Hello, World!');
  func();

  // to return multiple values i a function, aggregate the values in a `record`
  (String, int) foo() {
    return ('something', 5);
  }

  // GENERATORS
  // when you need to lazily produce a sequence of values, consider using a
  // generator function. Dart has builtin support for two kinds of generator
  // functions
  // - synchronous generators: returns an Iterable object
  // - asynchronous generators: returns an Stream object
  // to implement a synchronous generator function, mark the function body as
  // `sync*`, and use `yield` statements to deliver values
  Iterable<int> naturalsTo(int n) sync* {
    int k = 0;
    while (k < 0) yield k++;
  }

  // to implement an asynchronous generator function, mark the function body as
  // `async*`, and use `yield` statement to deliver values
  Stream<int> asynchronousNaturalsTo(int n) async* {
    int k = 0;
    while (k < n) yield k++;
  }

  // if your generator is recursive, you can improve its performance by using
  // `yield*`
  Iterable<int> naturalsDownFrom(int n) sync* {
    if (n > 0) {
      yield n;
      yield* naturalsDownFrom(n - 1);
    }
  }
}

// EXTERNAL FUNCTIONS
// an external function is a function whose body is implement separately from
// its declaration. Include the `external` keyword before a function
// declaration, like so:
external void someFunc(int i);
// an external function's implementation can come from another Dart library, or,
// more commonly, from another language. In iterop contextx, `external` 
// introduces type information for foreign functions or values, making them 
// usable in Dart. Implementation and usage is heavily platform specific, so 
// check out the interop docs on, for example, C or Javascript to learn more

// external functions can be top-level functions, instance methods, getters or
// setter, or non-redirecting constructors. An instance variable can be 
// `external` too, which is equivalent to an external getter and (if the 
// the variable is not `final`) an external setter

