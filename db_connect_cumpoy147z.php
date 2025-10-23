<?php
/**
 * MySQL Database Connection Script
 * This script demonstrates how to connect to a MySQL database using PHP
 */

// Database configuration
$servername = "localhost";  // or your MySQL server address
$username = "your_username"; // your MySQL username
$password = "your_password"; // your MySQL password
$database = "your_database"; // your database name

try {
    // Create a new PDO instance for MySQL connection
    $pdo = new PDO("mysql:host=$servername;dbname=$database", $username, $password);
    
    // Set the PDO error mode to exception
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
    echo "Connected successfully to MySQL database!";
    
    // Example query to test the connection
    $stmt = $pdo->query("SELECT VERSION()");
    $version = $stmt->fetch();
    echo "\nMySQL Server Version: " . $version[0];
    
} catch(PDOException $e) {
    // Handle connection errors
    echo "Connection failed: " . $e->getMessage();
}

// Alternative connection method using mysqli
/*
$mysqli = new mysqli($servername, $username, $password, $database);

// Check connection
if ($mysqli->connect_error) {
    die("Connection failed: " . $mysqli->connect_error);
}
echo "Connected successfully using MySQLi!";
*/
?>