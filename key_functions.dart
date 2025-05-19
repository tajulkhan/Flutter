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

// Function without parameter and return value. 
void GFG()
{
    // Creating function
    print("Welcome to GeeksForGeeks");
}

void main()
{
    // Calling the function
    GFG();
}

// Functions with Optional Parameter
void gfg1(int g1, [ var g2 ])
{
    // Creating function 1
    print("g1 is $g1");
    print("g2 is $g2");
}

void gfg2(int g1, { var g2, var g3 })
{
    // Creating function 1
    print("g1 is $g1");
    print("g2 is $g2");
    print("g3 is $g3");
}

void gfg3(int g1, { int g2 : 12 })
{
    // Creating function 1
    print("g1 is $g1");
    print("g2 is $g2");
}

void main()
{
    // Calling the function with optional parameter
    print("Calling the function with optional parameter:");
    gfg1(01);

    // Calling the function with Optional Named parameter
    print("Calling the function with Optional Named parameter:");
    gfg2(01, g3 : 12);

    // Calling function with default valued parameter
    print("Calling function with default valued parameter");
    gfg3(01);
}
// Lambda Function in Dart
void gfg() => print("Welcome to GeeksforGeeks");

void main()
{
    // Calling Lambda function
    gfg(); 
}
// Dart - Common Collection Methods
// isEmpty() or isNotEmpty
void main() {
    // Declaring an empty list of coffees
    var coffees = [];
    // Declaring a list of teas with some values
    var teas = ['green', 'black', 'chamomile', 'earl grey'];
    // Checking if the 'coffees' list is empty and printing the result
    print(coffees.isEmpty); // Output: true (since the list is empty)
    // Checking if the 'teas' list is not empty and printing the result
    print(teas.isNotEmpty); // Output: true (since the list contains elements)
}


