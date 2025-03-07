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

// Encapsulation (Getters and Setters)

class BankAccount {
  double _balance = 0; // Private variable (underscore `_` makes it private)

  double get balance => _balance; // Getter

  void deposit(double amount) {  // Setter
    if (amount > 0) {
      _balance += amount;
      print('Deposited: $amount');
    }
  }
}

void main() {
  BankAccount acc = BankAccount();
  acc.deposit(100);
  print('Balance: ${acc.balance}');
}

//Inheritance (Extending a Class)
class Animal {
  void makeSound() {
    print('Animal makes a sound');
  }
}

class Dog extends Animal {
  void bark() {
    print('Dog barks');
  }
}

void main() {
  Dog myDog = Dog();
  myDog.makeSound(); // Inherited method
  myDog.bark();
}

// Method Overriding (Polymorphism)
class Animal {
  void makeSound() {
    print('Some sound');
  }
}

class Dog extends Animal {
  @override
  void makeSound() {
    print('Dog barks');
  }
}

void main() {
  Dog myDog = Dog();
  myDog.makeSound(); // Output: Dog barks
}
