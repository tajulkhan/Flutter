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

void main() {
  datatypes();
  operators();
}
