class Car {
  String make;
  int year;

  Car({required this.make, required this.year});

  @override
  String toString() {
    return '$year $make';
  }
}
