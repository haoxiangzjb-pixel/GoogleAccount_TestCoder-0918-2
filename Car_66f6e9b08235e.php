<?php

class Car {
    private $isRunning = false;

    public function start() {
        if (!$this->isRunning) {
            $this->isRunning = true;
            echo "The car is starting...\n";
        } else {
            echo "The car is already running.\n";
        }
    }

    public function stop() {
        if ($this->isRunning) {
            $this->isRunning = false;
            echo "The car is stopping...\n";
        } else {
            echo "The car is already stopped.\n";
        }
    }

    public function isRunning() {
        return $this->isRunning;
    }
}

// Example usage:
// $myCar = new Car();
// $myCar->start(); // The car is starting...
// $myCar->start(); // The car is already running.
// $myCar->stop();  // The car is stopping...