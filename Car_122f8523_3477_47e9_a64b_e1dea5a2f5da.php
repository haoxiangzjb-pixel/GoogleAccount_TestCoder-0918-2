<?php

class Car {
    private $make;
    private $model;
    private $year;
    private $isRunning = false;

    public function __construct($make, $model, $year) {
        $this->make = $make;
        $this->model = $model;
        $this->year = $year;
    }

    public function start() {
        if (!$this->isRunning) {
            $this->isRunning = true;
            echo "The {$this->year} {$this->make} {$this->model} is now running.\n";
        } else {
            echo "The car is already running.\n";
        }
    }

    // Optional: A method to stop the car
    public function stop() {
        if ($this->isRunning) {
            $this->isRunning = false;
            echo "The {$this->year} {$this->make} {$this->model} has been stopped.\n";
        } else {
            echo "The car is already off.\n";
        }
    }

    // Optional: A method to check if the car is running
    public function isRunning() {
        return $this->isRunning;
    }
}

// Example usage:
// $myCar = new Car("Toyota", "Camry", 2020);
// $myCar->start(); // Output: The 2020 Toyota Camry is now running.
// $myCar->start(); // Output: The car is already running.
// echo $myCar->isRunning() ? "Yes" : "No"; // Output: Yes
// $myCar->stop(); // Output: The 2020 Toyota Camry has been stopped.
// $myCar->stop(); // Output: The car is already off.
// echo $myCar->isRunning() ? "Yes" : "No"; // Output: No

?>