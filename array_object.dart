// Find Duplicates in a List
List<int> findDuplicates(List<int> numbers) {
  Map<int, int> countMap = {};
  List<int> duplicates = [];

  for (int num in numbers) {
    countMap[num] = (countMap[num] ?? 0) + 1;
    if (countMap[num] == 2) {
      duplicates.add(num);
    }
  }
  
  return duplicates;
}

void main() {
  List<int> numbers = [1, 2, 3, 4, 5, 2, 3, 6, 7, 8, 8, 9];
  print(findDuplicates(numbers)); // Output: [2, 3, 8]

// Remove Duplicates from a List
  List<int> removeDuplicates(List<int> numbers) {
  return numbers.toSet().toList();
}

void main() {
  List<int> numbers = [10, 20, 10, 30, 40, 30, 50];
  print(removeDuplicates(numbers)); // Output: [10, 20, 30, 40, 50]
}
  // Sort a List of Objects
  class Student {
  String name;
  int age;

  Student(this.name, this.age);
}

void main() {
  List<Student> students = [
    Student("Alice", 22),
    Student("Bob", 18),
    Student("Charlie", 25)
  ];

  students.sort((a, b) => a.age.compareTo(b.age)); // Sorting by age

  for (var student in students) {
    print("${student.name}: ${student.age}");
  }
}
// Filter Objects in a List
  class Product {
  String name;
  double price;

  Product(this.name, this.price);
}

void main() {
  List<Product> products = [
    Product("Laptop", 1000),
    Product("Mouse", 25),
    Product("Keyboard", 70),
    Product("Monitor", 200),
  ];

  List<Product> expensiveProducts = products.where((p) => p.price > 50).toList();

  for (var product in expensiveProducts) {
    print("${product.name}: \$${product.price}");
  }
}



