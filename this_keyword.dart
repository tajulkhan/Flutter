// Dart - this keyword
// Dart program to illustrate
// this keyword
void main() {
    Student s1 = new Student('S001');
}

class Student {
    // defining local st_id variable
    var st_id;
    Student(var st_id) {
        // using this keyword
        this.st_id = st_id;
        print("GFG - Dart THIS Example");
        print("The Student ID is : ${st_id}");
    }
}
// Returning the Current Class Instance
// Dart program to illustrate
// this keyword
void main() {
    mob m1 = new mob();
    m1.Car("M101");
}
class mob {
    String mobile = "";
    Car(String mobile) {
        // use of this keyword
        this.mobile = mobile;
        print("The mobile is : ${mobile}");
    }
}
