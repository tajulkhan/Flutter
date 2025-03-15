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
