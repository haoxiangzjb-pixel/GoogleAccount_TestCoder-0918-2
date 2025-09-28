<?php

class Car {
    private $model;
    private $running = false;

    public function __construct($model) {
        $this->model = $model;
    }

    public function start() {
        if (!$this->running) {
            $this->running = true;
            echo "The {$this->model} car is now running.\n";
        } else {
            echo "The {$this->model} car is already running.\n";
        }
    }

    public function getModel() {
        return $this->model;
    }

    public function isRunning() {
        return $this->running;
    }
}

?>