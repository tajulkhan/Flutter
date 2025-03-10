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

//Handling Errors in Async-Await
Future<void> fetchData() async {
  try {
    await Future.delayed(Duration(seconds: 2));
    throw Exception('Something went wrong');
  } catch (e) {
    print('Error: $e');
  }
}

void main() async {
  print('Fetching data...');
  await fetchData();
}

// Streams in Dart (Handling Continuous Data Flow)// While Futures return a single value, Streams allow continuous data flow (e.g., real-time updates, WebSockets, etc.).
// async* → Marks a function as returning a stream.
// yield → Sends values one by one.
// await for → Listens to stream values as they arrive
Stream<int> countDown() async* {
  for (int i = 5; i > 0; i--) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}

void main() async {
  await for (int number in countDown()) {
    print(number);
  }
  print('Done!');
}

// Null Safety in Dart (Avoiding Null Errors)
// Dart has null safety to prevent null errors at runtime.
// Declaring Nullable and Non-Nullable Variables

String? name; // Nullable (can be null)
String nonNullable = 'Taj'; // Non-nullable

void main() {
  print(name); // Output: null
  print(nonNullable); // Output: Taj
}

// Using the Null Check (!)
void main() {
  String? name;
  print(name!.length); // Error if name is null
}

// Using the Null Coalescing Operator (?? & ??=)
void main() {
  String? name;

  print(name ?? 'Default Name'); // If null, use 'Default Name'

  name ??= 'Ali'; // Assign if null
  print(name);
}
// Metaprogramming (Reflection & Annotations in Dart)

class Todo {
  final String message;
  const Todo(this.message);
}

@Todo('Implement login feature')
class LoginScreen {
  void display() {
    print('Login Screen');
  }
}

void main() {
  LoginScreen().display();
}

//Bank Account System (OOP, Getters/Setters, Exception Handling)
class BankAccount {
  double _balance = 0; // Private variable

  // Getter to check balance
  double get balance => _balance;

  // Deposit method
  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
      print('Deposited: $amount');
    }
  }

  // Withdraw method
  void withdraw(double amount) {
    if (amount > _balance) {
      throw Exception('Insufficient funds!');
    }
    _balance -= amount;
    print('Withdrawn: $amount');
  }
}

void main() {
  try {
    BankAccount account = BankAccount();
    account.deposit(500);
    print('New Balance: ${account.balance}');
    
    account.withdraw(200);
    print('New Balance: ${account.balance}');
    
    account.withdraw(500); // This should throw an error
  } catch (e) {
    print('Error: $e');
  }
}

