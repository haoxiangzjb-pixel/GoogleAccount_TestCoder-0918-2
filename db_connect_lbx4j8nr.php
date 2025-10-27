<?php
/**
 * MySQL Database Connection Script
 * This script demonstrates how to connect to a MySQL database using PHP
 */

// Database configuration
$servername = "localhost"; // Change this to your MySQL server address
$username = "your_username"; // Change this to your MySQL username
$password = "your_password"; // Change this to your MySQL password
$dbname = "your_database"; // Change this to your database name

try {
    // Create a new PDO instance
    $pdo = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    
    // Set the PDO error mode to exception
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
    echo "Connected successfully to MySQL database!";
    
    // Optional: Test a simple query
    $stmt = $pdo->query("SELECT VERSION()");
    $version = $stmt->fetch();
    echo "\nMySQL version: " . $version[0];
    
} catch(PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
}

// Alternative connection method using mysqli
/*
$mysqli = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($mysqli->connect_error) {
    die("Connection failed: " . $mysqli->connect_error);
}
echo "Connected successfully using MySQLi!";
*/
?>