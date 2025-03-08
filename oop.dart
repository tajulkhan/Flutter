//Error Handling in Dart (try-catch, finally, custom exceptions)

void main() {
  try {
    int result = 10 ~/ 0; // Division by zero error
    print(result);
  } catch (e) {
    print('Error occurred: $e');
  }
}
