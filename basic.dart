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
