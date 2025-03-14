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
