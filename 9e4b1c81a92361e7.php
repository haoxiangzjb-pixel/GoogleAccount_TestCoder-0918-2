<?php

class Car
{
    private $isRunning = false;

    public function start()
    {
        if ($this->isRunning) {
            echo "汽车已经在运行中。\n";
        } else {
            $this->isRunning = true;
            echo "汽车已启动。\n";
        }
    }
}

