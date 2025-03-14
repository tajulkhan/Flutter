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
