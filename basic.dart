//Classes and Objects
class Car {
  String brand = 'Toyota';
  
  void showBrand() {
    print('Brand: $brand');
  }
}

void main() {
  Car myCar = Car();  // Creating an object
  myCar.showBrand();  // Accessing method
}
// Constructors in Dart
class Person {
  String name;

  // Constructor
  Person() {
    name = 'Taj';
  }

  void greet() {
    print('Hello, my name is $name');
  }
}

void main() {
  Person p = Person();
  p.greet();
}

//Parameterized Constructor
class Person {
  String name;

  // Parameterized Constructor
  Person(this.name);

  void greet() {
    print('Hello, my name is $name');
  }
}

void main() {
  Person p = Person('Ali');
  p.greet(); // Output: Hello, my name is Ali
}

