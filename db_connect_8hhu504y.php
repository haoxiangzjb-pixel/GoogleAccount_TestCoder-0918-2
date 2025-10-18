<?php
// Database connection script

// Database configuration
$host = 'localhost'; // Change this to your MySQL host
$dbname = 'your_database_name'; // Change this to your database name
$username = 'your_username'; // Change this to your MySQL username
$password = 'your_password'; // Change this to your MySQL password

try {
    // Create a new PDO instance
    $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    
    // Set the PDO error mode to exception
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
    echo "Connected successfully to the database!";
    
    // You can perform database operations here
    // For example:
    // $stmt = $pdo->query("SELECT * FROM your_table");
    // $results = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
} catch(PDOException $e) {
    // Handle connection errors
    echo "Connection failed: " . $e->getMessage();
}

// Close the connection (optional, as it will close automatically at the end of the script)
$pdo = null;
?>