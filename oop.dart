//Error Handling in Dart (try-catch, finally, custom exceptions)

void main() {
  try {
    int result = 10 ~/ 0; // Division by zero error
    print(result);
  } catch (e) {
    print('Error occurred: $e');
  }
}

// Why use on instead of catch?
// on → Catches specific exceptions
// catch → Catches all exceptions
void main() {
  try {
    int number = int.parse('abc'); // Invalid number format
    print(number);
  } on FormatException {
    print('Invalid number format!');
  }
}

// Finally Block (Always Executes)
void main() {
  try {
    int result = 10 ~/ 2;
    print(result);
  } catch (e) {
    print('Error: $e');
  } finally {
    print('Execution complete.');
  }
}
