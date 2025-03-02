void datatypes() {
  String name = 'Taj'; // Explicitly typed
  var age = 25; // Dart infers the type (int)
  dynamic anything = "Hello"; // Can hold any type of value

  print(name);
  print(age);
  print(anything);
}

void operators() {
  int a = 10, b = 3;
  print(a + b); // Addition
  print(a - b); // Subtraction
  print(a * b); // Multiplication
  print(a / b); // Division (double result)
  print(a ~/ b); // Integer division
  print(a % b); // Modulus (remainder)
}

void comparison() {
  int x = 10, y = 5;

  print(x > y); // true
  print(x == y); // false
  print(x != y); // true

  bool a = true, b = false;
  print(a && b); // false (Logical AND)
  print(a || b); // true  (Logical OR)
  print(!a); // false (Logical NOT)
}

void main() {
  datatypes();
  operators();
  comparison();
}
