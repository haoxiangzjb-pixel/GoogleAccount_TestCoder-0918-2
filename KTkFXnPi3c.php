<?php

class Car {
    private $brand;
    private $model;
    private $isRunning;
    
    public function __construct($brand, $model) {
        $this->brand = $brand;
        $this->model = $model;
        $this->isRunning = false;
    }
    
    public function start() {
        if ($this->isRunning) {
            return $this->brand . " " . $this->model . " is already running.";
        } else {
            $this->isRunning = true;
            return $this->brand . " " . $this->model . " has started.";
        }
    }
    
    public function stop() {
        if (!$this->isRunning) {
            return $this->brand . " " . $this->model . " is already stopped.";
        } else {
            $this->isRunning = false;
            return $this->brand . " " . $this->model . " has stopped.";
        }
    }
    
    public function getBrand() {
        return $this->brand;
    }
    
    public function getModel() {
        return $this->model;
    }
    
    public function isRunning() {
        return $this->isRunning;
    }
}

?>