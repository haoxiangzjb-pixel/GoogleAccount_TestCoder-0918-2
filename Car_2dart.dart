class Car {
  String make;
  int year;

  Car(this.make, this.year);
}

void main() {
  Car myCar = Car("Toyota", 2020);
  print('Car: ${myCar.make}, Year: ${myCar.year}');
}