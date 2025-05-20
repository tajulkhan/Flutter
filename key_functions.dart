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
// forEach()
void main(){
    var name = ['taj', 'vasim', 'sulthan'];
    var capLetter = name.map((names)=>names.toUpperCase());
    capLetter.forEach(print);
}
//where()
void main() {
    // Declaring a list of tea types
    var teas = ['green', 'black', 'chamomile', 'earl grey'];
    
    // Function to check if a tea is decaffeinated
    // Chamomile is the only decaffeinated tea in this list.
    bool isDecaffeinated(String teaName) => teaName == 'chamomile';
    
    // Using any() to check if at least one tea in the list is decaffeinated.
    print(teas.any(isDecaffeinated)); // Output: true (since chamomile is present)
    
    // Using every() to check if all teas in the list are decaffeinated.
    print(!teas.every(isDecaffeinated)); // Output: true (since not all teas are chamomile)
}

// Using Getters and Setters in Dart
// Dart program to illustrate the use
// of getters and setters with null safety

class Student {  
    
    // Fields with default values to avoid null errors
    String name = '';  
    int age = 0;   
    
    // Getter for the student's name  
    String get stud_name {  
        return name;  
    }  
    
    // Setter for the student's name  
    void set stud_name(String name) {  
        this.name = name;  
    }  
    
    // Setter for the student's age with validation  
    void set stud_age(int age) {  
        
        if (age <= 5) {  
            // Age should be greater than 5
            print("Age should be greater than 5");  
        } else {  
            this.age = age;  
        }  
    }  
    
    // Getter for the student's age  
    int get stud_age {  
        return age;      
    }  
}  
  
void main() {  
    // Creating an instance of the Student class  
    Student s1 = Student();  
    
    // Setting values using setters  
    s1.stud_name = 'GFG';  
    
    // Invalid age, should print an error message 
    s1.stud_age = 0;   
    
    // Getting values using getters  
    print(s1.stud_name);  // Output: GFG  
    print(s1.stud_age);   // Output: 0 (Default value)  
}
