<?php

class Car {
    private string $make;
    private string $model;
    private int $year;

    public function __construct(string $make, string $model, int $year) {
        $this->make = $make;
        $this->model = $model;
        $this->year = $year;
    }

    public function start(): void {
        echo "The {$this->year} {$this->make} {$this->model} is starting... Vroom!\n";
    }
}
