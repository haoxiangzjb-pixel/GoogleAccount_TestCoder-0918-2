<?php

class Car {
    private string $make;
    private string $model;

    public function __construct(string $make, string $model) {
        $this->make = $make;
        $this->model = $model;
    }

    public function start(): void {
        echo "The {$this->make} {$this->model} is starting...\n";
    }
}

// Example usage:
// $myCar = new Car("Toyota", "Camry");
// $myCar->start();