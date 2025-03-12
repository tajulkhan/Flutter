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

//Fetch Data from a Fake API (Async-Await, Future, Error Handling)
Future<String> fetchUserData(int id) async {
  if (id < 1) {
    throw Exception('Invalid user ID');
  }
  
  await Future.delayed(Duration(seconds: 3)); // Simulating API delay
  return 'Name: Ali, Age: 25';
}

void main() async {
  print('Fetching user data...');
  
  try {
    String data = await fetchUserData(1);
    print('User Data: $data');
  } catch (e) {
    print('Error: $e');
  }
}

//Stream of Numbers (Streams, Async-Await, Yield)

Stream<int> generateNumbers() async* {
  for (int i = 1; i <= 5; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}

void main() async {
  await for (int num in generateNumbers()) {
    print(num);
  }
  print('Done!');
}

//Parallel Processing with Isolates (Heavy Computation)
import 'dart:isolate';

void calculateSum(SendPort sendPort) {
  int sum = 0;
  for (int i = 1; i <= 1000000000; i++) {
    sum += i;
  }
  sendPort.send(sum);
}

void main() async {
  print('Calculating sum...');
  
  ReceivePort receivePort = ReceivePort();
  await Isolate.spawn(calculateSum, receivePort.sendPort);
  
  receivePort.listen((message) {
    print('Sum: $message');
    receivePort.close();
  });
}
//Encapsulation (Data Hiding)
class BankAccount {
  String owner;
  double _balance; // Private variable

  BankAccount(this.owner, this._balance);

  // Getter for balance
  double get balance => _balance;

  // Setter with validation
  set deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
      print('Deposited: $amount');
    } else {
      print('Invalid deposit amount');
    }
  }

  void withdraw(double amount) {
    if (amount > _balance) {
      print('Insufficient funds!');
    } else {
      _balance -= amount;
      print('Withdrawn: $amount');
    }
  }
}

void main() {
  var account = BankAccount('Taj', 500);
  account.deposit = 200; // Using setter
  print('Balance: ${account.balance}'); // Using getter
  account.withdraw(100);
}

//Inheritance (Code Reusability)
// Parent class
class Employee {
  String name;
  double salary;

  Employee(this.name, this.salary);

  void work() {
    print('$name is working...');
  }
}

// Child class inherits from Employee
class Manager extends Employee {
  String department;

  Manager(String name, double salary, this.department) : super(name, salary);

  void manage() {
    print('$name is managing $department department');
  }
}

void main() {
  var manager = Manager('Taj', 5000, 'IT');
  manager.work(); // Inherited from Employee
  manager.manage();
}

//Polymorphism (Method Overriding)
// Base class
class Shape {
  double getArea() {
    return 0;
  }
}

// Circle class overriding getArea()
class Circle extends Shape {
  double radius;
  Circle(this.radius);

  @override
  double getArea() {
    return 3.14 * radius * radius;
  }
}

// Rectangle class overriding getArea()
class Rectangle extends Shape {
  double width, height;
  Rectangle(this.width, this.height);

  @override
  double getArea() {
    return width * height;
  }
}

void main() {
  Shape shape1 = Circle(5);
  Shape shape2 = Rectangle(4, 6);

  print('Circle Area: ${shape1.getArea()}');
  print('Rectangle Area: ${shape2.getArea()}');
}

//Abstract Classes (Enforce Implementation)
abstract class Payment {
  void processPayment(double amount); // Abstract method
}

class CreditCardPayment extends Payment {
  @override
  void processPayment(double amount) {
    print('Processing Credit Card Payment: \$${amount}');
  }
}

class PayPalPayment extends Payment {
  @override
  void processPayment(double amount) {
    print('Processing PayPal Payment: \$${amount}');
  }
}

void main() {
  Payment payment1 = CreditCardPayment();
  payment1.processPayment(100);

  Payment payment2 = PayPalPayment();
  payment2.processPayment(200);
}
//  Mixins (Reusable Code Without Inheritance)
mixin CanBark {
  void bark() => print('Woof Woof!');
}

mixin CanMeow {
  void meow() => print('Meow Meow!');
}

class Dog with CanBark {}
class Cat with CanMeow {}

void main() {
  Dog dog = Dog();
  dog.bark(); // Woof Woof!

  Cat cat = Cat();
  cat.meow(); // Meow Meow!
}

class Database {
  static Database? _instance;

  // Private constructor
  Database._internal();

  // Factory constructor ensures only ONE instance
  factory Database() {
    if (_instance == null) {
      _instance = Database._internal();
      print('Database Created!');
    }
    return _instance!;
  }

  void query(String sql) {
    print('Executing query: $sql');
  }
}

void main() {
  var db1 = Database();
  var db2 = Database();

  db1.query('SELECT * FROM users');

  print(db1 == db2); // True (same instance)
}

// String Methods (Daily Use)
void main() {
  String text = "  Hello Dart!  ";

  print(text.trim()); // Removes spaces -> "Hello Dart!"
  print(text.toUpperCase()); // "HELLO DART!"
  print(text.toLowerCase()); // "hello dart!"
  print(text.contains("Dart")); // true
  print(text.replaceAll("Dart", "Flutter")); // "Hello Flutter!"
  print(text.split(" ")); // ["", "", "Hello", "Dart!", "", ""]
  print(text.startsWith("Hello")); // false (because of spaces)
  print(text.trim().startsWith("Hello")); // true
}

//  List Methods (Daily Use)
void main() {
  List<int> numbers = [3, 1, 4, 1, 5, 9];

  print(numbers.length); // 6
  print(numbers.first); // 3
  print(numbers.last); // 9
  print(numbers.reversed.toList()); // [9, 5, 1, 4, 1, 3]
  print(numbers.contains(4)); // true
  numbers.sort(); // Sorts list
  print(numbers); // [1, 1, 3, 4, 5, 9]
  
  // Functional methods
  List<int> doubled = numbers.map((n) => n * 2).toList();
  print(doubled); // [2, 2, 6, 8, 10, 18]

  List<int> filtered = numbers.where((n) => n > 3).toList();
  print(filtered); // [4, 5, 9]
}
