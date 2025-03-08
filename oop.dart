//Error Handling in Dart (try-catch, finally, custom exceptions)

void main() {
  try {
    int result = 10 ~/ 0; // Division by zero error
    print(result);
  } catch (e) {
    print('Error occurred: $e');
  }
}

// Why use on instead of catch?
// on → Catches specific exceptions
// catch → Catches all exceptions
void main() {
  try {
    int number = int.parse('abc'); // Invalid number format
    print(number);
  } on FormatException {
    print('Invalid number format!');
  }
}

// Finally Block (Always Executes)
void main() {
  try {
    int result = 10 ~/ 2;
    print(result);
  } catch (e) {
    print('Error: $e');
  } finally {
    print('Execution complete.');
  }
}

// Throwing Custom Exceptions
class InvalidAgeException implements Exception {
  String errorMessage() => 'Age cannot be negative!';
}

void checkAge(int age) {
  if (age < 0) {
    throw InvalidAgeException();
  } else {
    print('Valid age: $age');
  }
}

void main() {
  try {
    checkAge(-5);
  } catch (e) {
    print(e);
  }
}

// Asynchronous Programming in Dart (Futures, async-await, Streams)
// Dart is single-threaded, but it supports asynchronous operations like API calls and database queries using Futures and async-await.
// Futures (Delayed Execution)
// Future.delayed() → Simulates a delay (like a network request).
// .then() → Runs when the Future completes.
Future<String> fetchData() {
  return Future.delayed(Duration(seconds: 2), () => 'Data loaded!');
}

void main() {
  print('Taj Fetching data...');
  fetchData().then((data) => print(data));
}

// Async-Await (Better Handling of Futures)
// Instead of using .then(), Dart provides async and await for a cleaner way to handle asynchronous operations.
Future<String> fetchData() async {
  await Future.delayed(Duration(seconds: 2));
  return 'Data loaded!';
}

void main() async {
  print('Fetching data...');
  String data = await fetchData();
  print(data);
}
