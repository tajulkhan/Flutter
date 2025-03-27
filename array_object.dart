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
// C
  class User {
  String name;
  int age;

  User({required this.name, required this.age});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(name: json['name'], age: json['age']);
  }
}

void main() {
  List<Map<String, dynamic>> jsonData = [
    {"name": "Alice", "age": 30},
    {"name": "Bob", "age": 25}
  ];

  List<User> users = jsonData.map((data) => User.fromJson(data)).toList();

  for (var user in users) {
    print("${user.name}: ${user.age}");
  }
}
 // Group Objects by Property
  class Employee {
  String name;
  String department;

  Employee(this.name, this.department);
}

void main() {
  List<Employee> employees = [
    Employee("Alice", "HR"),
    Employee("Bob", "Engineering"),
    Employee("Charlie", "HR"),
    Employee("David", "Engineering"),
    Employee("Eve", "Marketing")
  ];

  Map<String, List<Employee>> groupedByDept = {};

  for (var emp in employees) {
    groupedByDept.putIfAbsent(emp.department, () => []);
    groupedByDept[emp.department]!.add(emp);
  }

  groupedByDept.forEach((dept, empList) {
    print("$dept:");
    for (var emp in empList) {
      print(" - ${emp.name}");
    }
  });
}
// Find the Most Frequent Element
  int mostFrequentElement(List<int> numbers) {
  Map<int, int> countMap = {};
  int maxCount = 0;
  int mostFrequent = numbers[0];

  for (var num in numbers) {
    countMap[num] = (countMap[num] ?? 0) + 1;
    if (countMap[num]! > maxCount) {
      maxCount = countMap[num]!;
      mostFrequent = num;
    }
  }
  
  return mostFrequent;
}

void main() {
  List<int> numbers = [4, 5, 6, 7, 5, 4, 4, 6, 7, 4, 5];
  print(mostFrequentElement(numbers)); // Output: 4
}
// Merge Two Sorted Lists
  List<int> mergeSortedLists(List<int> list1, List<int> list2) {
  List<int> merged = [...list1, ...list2]..sort();
  return merged;
}

void main() {
  List<int> list1 = [1, 3, 5, 7];
  List<int> list2 = [2, 4, 6, 8];

  print(mergeSortedLists(list1, list2)); // Output: [1, 2, 3, 4, 5, 6, 7, 8]
}


