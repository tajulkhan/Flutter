//List (Array) Methods in Dart || Add, Remove, and Modify Elements
void main() {
  List<int> numbers = [1, 2, 3];

  numbers.add(4); // [1, 2, 3, 4]
  numbers.addAll([5, 6]); // [1, 2, 3, 4, 5, 6]
  numbers.insert(2, 10); // Insert at index 2 -> [1, 2, 10, 3, 4, 5, 6]

  numbers.remove(3); // Removes value 3 -> [1, 2, 10, 4, 5, 6]
  numbers.removeAt(0); // Removes index 0 -> [2, 10, 4, 5, 6]

  print(numbers);
}

// Looping Through a List
void main() {
  List<String> names = ["Alice", "Bob", "Charlie"];

  for (int i = 0; i < names.length; i++) {
    print(names[i]);
  }

  for (var name in names) {
    print(name);
  }

  names.forEach((name) => print(name)); // Lambda function
}

//  Why use these?
// for → When you need index access
// forEach() → Clean and readable

// Searching & Filtering ----------
void main() {
  List<int> numbers = [3, 7, 10, 14, 21];

  bool exists = numbers.contains(10); // true
  int firstEven = numbers.firstWhere((n) => n % 2 == 0); // 10
  List<int> evenNumbers = numbers.where((n) => n % 2 == 0).toList(); // [10, 14]

  print(exists);
  print(firstEven);
  print(evenNumbers);
}
// ✅ Why use these?
// contains(value) → Checks if value exists
// firstWhere(condition) → Finds first matching item
// where(condition).toList() → Filters items

//Transforming Lists --------------
void main() {
  List<int> numbers = [1, 2, 3, 4];

  List<int> doubled = numbers.map((n) => n * 2).toList(); // [2, 4, 6, 8]
  List<String> stringNumbers = numbers.map((n) => "Number: $n").toList();

  print(doubled);
  print(stringNumbers);
}

//Sorting Lists
void main() {
  List<int> numbers = [5, 2, 8, 1, 9];

  numbers.sort(); // Ascending [1, 2, 5, 8, 9]
  numbers.sort((a, b) => b.compareTo(a)); // Descending [9, 8, 5, 2, 1]

  print(numbers);
}

// Why use .sort()?
// Sorts numbers or text
// Custom sorting logic possible

//Map (Object) Methods in Dart
void main() {
  Map<String, int> ages = {"Alice": 25, "Bob": 30, "Charlie": 28};

  print(ages["Bob"]); // 30
  ages["David"] = 40; // Add new entry
  print(ages);
}

// Checking Keys & Values
void main() {
  Map<String, int> ages = {"Alice": 25, "Bob": 30, "Charlie": 28};

  print(ages.containsKey("Alice")); // true
  print(ages.containsValue(30)); // true
  print(ages.keys); // (Alice, Bob, Charlie)
  print(ages.values); // (25, 30, 28)
}

// containsKey() → Checks if a key exists
// keys and values → Get all keys or values

// Removing Elements
void main() {
  Map<String, int> ages = {"Alice": 25, "Bob": 30, "Charlie": 28};

  ages.remove("Bob"); // Removes Bob
  print(ages);
}

// ✅ Why use remove()?
// Deletes a specific key

// Looping Through a Map
void main() {
  Map<String, int> ages = {"Alice": 25, "Bob": 30, "Charlie": 28};

  ages.forEach((key, value) {
    print("$key is $value years old");
  });

  for (var entry in ages.entries) {
    print("${entry.key} is ${entry.value} years old");
  }
}

// Converting Maps to List
void main() {
  Map<String, int> ages = {"Alice": 25, "Bob": 30, "Charlie": 28};

  List<String> names = ages.keys.toList(); // ["Alice", "Bob", "Charlie"]
  List<int> ageList = ages.values.toList(); // [25, 30, 28]

  print(names);
  print(ageList);
}

// ✅ Why convert?
// To use list methods on keys/values

//  Real-World Example
void main() {
  List<Map<String, dynamic>> users = [
    {"name": "Alice", "age": 25, "isActive": true},
    {"name": "Bob", "age": 30, "isActive": false},
    {"name": "Charlie", "age": 28, "isActive": true},
  ];

  // Get only active users
  List<Map<String, dynamic>> activeUsers =
      users.where((user) => user["isActive"]).toList();

  print(activeUsers);
}

//Higher-Order Functions
void executeFunction(Function fn) {
  fn();
}

void sayHello() {
  print("Hello from Dart!");
}

void main() {
  executeFunction(sayHello); // Output: Hello from Dart!
}

Function multiplier(int n) {
  return (int x) => x * n;
}

void main() {
  var doubleIt = multiplier(2);
  print(doubleIt(5)); // Output: 10
}

// Spread Operator (...), if, and for in Collections
void main() {
  List<int> numbers = [1, 2, 3];
  List<int> moreNumbers = [4, 5, 6];

  List<int> combined = [...numbers, ...moreNumbers];

  print(combined); // [1, 2, 3, 4, 5, 6]
}
//Used for merging lists

// Conditional Lists (if)
void main() {
  bool addExtra = true;

  List<int> numbers = [1, 2, 3, if (addExtra) 4];

  print(numbers); // [1, 2, 3, 4]
}

// Using for Inside Collections
void main() {
  List<int> numbers = [1, 2, 3];

  List<int> squared = [for (var n in numbers) n * n];

  print(squared); // [1, 4, 9]
}

// Null Safety in Dart (?, !, late)
void main() {
  String? name;
  print(name); // Output: null
}

// Non-Nullable with Default (??)
void main() {
  String? username;
  print(username ?? "Guest"); // Output: Guest
}

// Force Unwrapping (!)
void main() {
  String? name = "Alice";
  print(name!.length); // Works because name is not null
}

// Late Initialization (late)
late String greeting;
void main() {
  greeting = "Hello, Dart!";
  print(greeting);
}
//Futures & Async-Await (Asynchronous Programming)
void main() {
  print("Fetching data...");

  Future.delayed(Duration(seconds: 2), () {
    print("Data received!");
  });

  print("Waiting...");
}
//Example 2: Async-Await
Future<String> fetchUserData() async {
  await Future.delayed(Duration(seconds: 2));
  return "User Data Loaded";
}

void main() async {
  print("Loading...");
  String data = await fetchUserData();
  print(data);
}
//Streams (Handling Continuous Data)
Stream<int> countStream() async* {
  for (int i = 1; i <= 5; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}

void main() async {
  await for (int value in countStream()) {
    print(value);
  }
}
// extension Methods (Custom Functions on Existing Classes)
extension StringExtension on String {
  String capitalize() {
    return this[0].toUpperCase() + substring(1);
  }
}

void main() {
  print("dart".capitalize()); // Output: Dart
}
//Isolates (Multithreading in Dart)
import 'dart:isolate';

void heavyComputation(SendPort sendPort) {
  int sum = 0;
  for (int i = 0; i < 1000000000; i++) {
    sum += i;
  }
  sendPort.send(sum);
}

void main() async {
  ReceivePort receivePort = ReceivePort();
  await Isolate.spawn(heavyComputation, receivePort.sendPort);

  receivePort.listen((message) {
    print("Result: $message");
  });
}
//Streams (Handling Continuous Data)
Stream<int> countStream() async* {
  for (int i = 1; i <= 5; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}

void main() async {
  await for (int value in countStream()) {
    print(value);
  }
}
//Extension Methods (Custom Functions on Existing Classes)
extension StringExtension on String {
  String capitalize() {
    return this[0].toUpperCase() + substring(1);
  }
}

void main() {
  print("dart".capitalize()); // Output: Dart
}
//Recursion (Understanding Recursive Logic)
int factorial(int n) {
  if (n == 0) return 1; // Base case
  return n * factorial(n - 1); // Recursive case
}

void main() {
  print(factorial(5)); // Output: 120
}
//Sorting Algorithms (Bubble Sort, Quick Sort, Merge Sort)
void bubbleSort(List<int> arr) {
  for (int i = 0; i < arr.length - 1; i++) {
    for (int j = 0; j < arr.length - i - 1; j++) {
      if (arr[j] > arr[j + 1]) {
        // Swap elements
        int temp = arr[j];
        arr[j] = arr[j + 1];
        arr[j + 1] = temp;
      }
    }
  }
}

void main() {
  List<int> numbers = [5, 3, 8, 1, 2];
  bubbleSort(numbers);
  print(numbers); // Output: [1, 2, 3, 5, 8]
}
//String Manipulation (Anagrams, Palindromes, Substrings)
bool isPalindrome(String s) {
  return s == s.split('').reversed.join('');
}

void main() {
  print(isPalindrome("racecar")); // Output: true
  print(isPalindrome("hello")); // Output: false
}
//Find Substrings
void findSubstrings(String str) {
  for (int i = 0; i < str.length; i++) {
    for (int j = i + 1; j <= str.length; j++) {
      print(str.substring(i, j));
    }
  }
}

void main() {
  findSubstrings("abc");
  // Output:
  // a, ab, abc, b, bc, c
}

