// Anonymous Functions
// Dartprogram to illustrate 
// Anonymous functions in Dart
void main()
{
    var list = ["Shubham","Nick","Adil","Puthal"];
    print("GeeksforGeeks - Anonymous function in Dart");
    list.forEach((item) {
        print('${list.indexOf(item)} : $item');
    });
}
// Assigning an anonymous function to a variable
void main() {
    var multiply = (int a, int b) {
        return a * b;
    };
    print(multiply(5, 3)); // Output: 15
}
// Using an Anonymous Function as a Callback
void performOperation(int a, int b, Function operation) {
    print('Result: ${operation(a, b)}');
}
void main() {
    // Passing an anonymous function
    performOperation(4, 2, (a, b) => a + b); 
}

 // Complete function in Dart 

int add(int a, int b)
{
    // Creating function
    int result = a + b;
    
    // returning value result
    return result;
}

void main()
{
    // Calling the function
    var output = add(10, 20);

    // Printing output
    print(output);
}
