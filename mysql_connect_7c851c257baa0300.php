<?php
/**
 * MySQL Database Connection Script
 * This script demonstrates how to connect to a MySQL database using PHP
 */

// Database configuration
$host = 'localhost';        // Database host
$username = 'your_username'; // Database username
$password = 'your_password'; // Database password
$database = 'your_database'; // Database name

try {
    // Create a new PDO instance
    $pdo = new PDO("mysql:host=$host;dbname=$database", $username, $password);
    
    // Set the PDO error mode to exception
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
    echo "Connected successfully to MySQL database!";
    
    // You can perform database operations here
    // For example:
    // $stmt = $pdo->query("SELECT * FROM your_table");
    // $results = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
} catch(PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
}

// Close the connection
$pdo = null;
?>