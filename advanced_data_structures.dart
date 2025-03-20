// Advanced Data Structures

// 1.Lists & Advanced List Operations
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
