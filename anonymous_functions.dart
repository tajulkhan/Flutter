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
