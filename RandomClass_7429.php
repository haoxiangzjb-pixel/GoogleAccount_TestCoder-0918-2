<?php

class MagicClass {
    private $properties = [];

    // Magic method to set property values
    public function __set($name, $value) {
        echo "Setting property: $name to $value\n";
        $this->properties[$name] = $value;
    }

    // Magic method to get property values
    public function __get($name) {
        echo "Getting property: $name\n";
        if (array_key_exists($name, $this->properties)) {
            return $this->properties[$name];
        }
        return null;
    }

    // Magic method to check if property exists
    public function __isset($name) {
        echo "Checking if property exists: $name\n";
        return isset($this->properties[$name]);
    }

    // Magic method to unset property
    public function __unset($name) {
        echo "Unsetting property: $name\n";
        unset($this->properties[$name]);
    }

    // Magic method called when object is treated as string
    public function __toString() {
        return "MagicClass instance with properties: " . json_encode($this->properties);
    }

    // Magic method called when object is invoked as function
    public function __invoke($param) {
        return "Object invoked with parameter: $param";
    }

    // Magic method called when method doesn't exist
    public function __call($name, $arguments) {
        return "Method $name called with arguments: " . implode(', ', $arguments);
    }

    // Magic method for static calls to undefined methods
    public static function __callStatic($name, $arguments) {
        return "Static method $name called with arguments: " . implode(', ', $arguments);
    }

    // Magic method called during serialization
    public function __sleep() {
        echo "Object is being serialized\n";
        return array_keys($this->properties);
    }

    // Magic method called after unserialization
    public function __wakeup() {
        echo "Object has been unserialized\n";
        $this->properties = $this->properties ?? [];
    }

    // Magic method called when object is cloned
    public function __clone() {
        echo "Object is being cloned\n";
        $this->properties = unserialize(serialize($this->properties));
    }
}

// Example usage:
$obj = new MagicClass();

// Using __set
$obj->name = "John";
$obj->age = 30;

// Using __get
echo $obj->name . "\n";

// Using __isset
var_dump(isset($obj->name));

// Using __unset
unset($obj->age);
var_dump(isset($obj->age));

// Using __toString
echo $obj . "\n";

// Using __invoke (if the object was assigned to a variable that is called as function)
$obj2 = new MagicClass();
$obj2->message = "Hello";
echo $obj2("test") . "\n";

// Using __call
echo $obj->someUndefinedMethod("arg1", "arg2") . "\n";

// Using __callStatic
echo MagicClass::__someUndefinedStaticMethod("staticArg1", "staticArg2") . "\n";