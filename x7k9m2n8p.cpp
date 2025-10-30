#include <iostream>
#include <string>

// Base class
class Animal {
protected:
    std::string name;
    int age;

public:
    // Constructor
    Animal(std::string n, int a) : name(n), age(a) {
        std::cout << "Animal constructor called for " << name << std::endl;
    }

    // Virtual function to be overridden
    virtual void makeSound() {
        std::cout << name << " makes a sound." << std::endl;
    }

    // Function to display info
    void displayInfo() {
        std::cout << "Name: " << name << ", Age: " << age << std::endl;
    }

    // Virtual destructor
    virtual ~Animal() {
        std::cout << "Animal destructor called for " << name << std::endl;
    }
};

// Derived class
class Dog : public Animal {
private:
    std::string breed;

public:
    // Constructor for derived class
    Dog(std::string n, int a, std::string b) : Animal(n, a), breed(b) {
        std::cout << "Dog constructor called for " << name << std::endl;
    }

    // Override the virtual function from base class
    void makeSound() override {
        std::cout << name << " barks: Woof! Woof!" << std::endl;
    }

    // Additional method specific to Dog
    void showBreed() {
        std::cout << name << " is a " << breed << std::endl;
    }

    // Destructor
    ~Dog() {
        std::cout << "Dog destructor called for " << name << std::endl;
    }
};

// Another derived class to demonstrate inheritance
class Cat : public Animal {
private:
    bool isIndoor;

public:
    // Constructor for derived class
    Cat(std::string n, int a, bool indoor) : Animal(n, a), isIndoor(indoor) {
        std::cout << "Cat constructor called for " << name << std::endl;
    }

    // Override the virtual function from base class
    void makeSound() override {
        std::cout << name << " meows: Meow! Meow!" << std::endl;
    }

    // Additional method specific to Cat
    void showIndoorStatus() {
        std::cout << name << " is " << (isIndoor ? "an indoor" : "an outdoor") << " cat." << std::endl;
    }

    // Destructor
    ~Cat() {
        std::cout << "Cat destructor called for " << name << std::endl;
    }
};

int main() {
    std::cout << "Creating a Dog object:" << std::endl;
    Dog myDog("Buddy", 3, "Golden Retriever");
    myDog.displayInfo();
    myDog.makeSound();
    myDog.showBreed();
    std::cout << std::endl;

    std::cout << "Creating a Cat object:" << std::endl;
    Cat myCat("Whiskers", 2, true);
    myCat.displayInfo();
    myCat.makeSound();
    myCat.showIndoorStatus();
    std::cout << std::endl;

    // Demonstrating polymorphism with base class pointers
    std::cout << "Demonstrating polymorphism:" << std::endl;
    Animal* animalPtr;

    animalPtr = &myDog;
    animalPtr->makeSound(); // Calls Dog's makeSound

    animalPtr = &myCat;
    animalPtr->makeSound(); // Calls Cat's makeSound

    return 0;
}