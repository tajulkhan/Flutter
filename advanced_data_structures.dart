// Advanced Data Structures

// 1.Lists & Advanced List Operations
// Basic List Operations
void main() {
  List<int> numbers = [10, 20, 30, 40, 50];

  print(numbers.first);  // 10
  print(numbers.last);   // 50
  print(numbers.length); // 5

  numbers.add(60); // Add an element
  numbers.remove(20); // Remove an element
  numbers.sort(); // Sort the list

  print(numbers); // Output: [10, 30, 40, 50, 60]
}
// Transform List with .map()
void main() {
  List<int> numbers = [1, 2, 3, 4, 5];
  var squared = numbers.map((n) => n * n).toList();
  print(squared); // [1, 4, 9, 16, 25]
}
// Filtering with .where()
void main() {
  List<int> numbers = [10, 15, 20, 25, 30];
  var evenNumbers = numbers.where((n) => n.isEven).toList();
  print(evenNumbers); // [10, 20, 30]
}

// 2. Sets, Maps & Hashing Techniques
void main() {
  Set<int> uniqueNumbers = {1, 2, 3, 3, 4, 5};
  uniqueNumbers.add(6);
  uniqueNumbers.remove(2);
  print(uniqueNumbers); // {1, 3, 4, 5, 6}
}
// Using Maps (Dictionaries)
void main() {
  Map<String, int> scores = {
    "Alice": 90,
    "Bob": 85,
    "Charlie": 88
  };

  scores["David"] = 92; // Add a new key-value pair
  print(scores["Alice"]); // 90
  print(scores.keys); // [Alice, Bob, Charlie, David]
}

//Using Maps (Dictionaries)
void main() {
  Map<String, int> scores = {
    "Alice": 90,
    "Bob": 85,
    "Charlie": 88
  };

  scores["David"] = 92; // Add a new key-value pair
  print(scores["Alice"]); // 90
  print(scores.keys); // [Alice, Bob, Charlie, David]
}

