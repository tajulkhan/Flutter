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
