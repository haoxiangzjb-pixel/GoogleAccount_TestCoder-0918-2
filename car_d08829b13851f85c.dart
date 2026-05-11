class Car {
  String make;
  int year;

  Car({required this.make, required this.year});

  @override
  String toString() {
    return 'Car(make: $make, year: $year)';
  }
}
