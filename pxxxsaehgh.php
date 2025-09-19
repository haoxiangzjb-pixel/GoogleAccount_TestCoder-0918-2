<?php
// Database configuration
$host = 'localhost';
$username = 'your_username';
$password = 'your_password';
$database = 'your_database';

// Create connection
try {
    $pdo = new PDO("mysql:host=$host;dbname=$database", $username, $password);
    // Set the PDO error mode to exception
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "Connected successfully to the database!";
} catch(PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
}

// Example query (commented out for safety)
// $stmt = $pdo->query('SELECT * FROM your_table');
// while ($row = $stmt->fetch()) {
//     print_r($row);
// }

// Close connection
$pdo = null;
?>