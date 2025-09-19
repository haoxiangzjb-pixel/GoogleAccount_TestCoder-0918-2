<?php
// Database configuration
$host = 'localhost';        // Database host
$username = 'db_user';      // Database username
$password = 'db_password';  // Database password
$database = 'my_database';  // Database name

// Create connection
$conn = new mysqli($host, $username, $password, $database);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

echo "Connected successfully to the database!";

// Close connection
$conn->close();
?>