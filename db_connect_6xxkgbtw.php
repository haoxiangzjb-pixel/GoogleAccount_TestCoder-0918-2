<?php
/**
 * PHP script to connect to a MySQL database
 */

// Database configuration
$host = 'localhost';        // Database host
$username = 'your_username'; // Database username
$password = 'your_password'; // Database password
$dbname = 'your_database';   // Database name
$port = 3306;               // Database port (default is 3306)

try {
    // Create a new PDO instance
    $pdo = new PDO("mysql:host=$host;port=$port;dbname=$dbname", $username, $password);
    
    // Set the PDO error mode to exception
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
    echo "Connected successfully to MySQL database!\n";
    
    // Example: Perform a simple query
    $stmt = $pdo->query("SELECT VERSION() as version");
    $result = $stmt->fetch(PDO::FETCH_ASSOC);
    echo "MySQL Version: " . $result['version'] . "\n";
    
} catch(PDOException $e) {
    // Handle connection errors
    echo "Connection failed: " . $e->getMessage() . "\n";
}

// Close the connection
$pdo = null;
?>