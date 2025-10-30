<?php
/**
 * MySQL Database Connection Script
 * This script demonstrates how to connect to a MySQL database using PHP
 */

// Database configuration
$servername = "localhost"; // Change this to your MySQL server address
$username = "your_username"; // Replace with your MySQL username
$password = "your_password"; // Replace with your MySQL password
$dbname = "your_database"; // Replace with your database name

// Method 1: Procedural approach
echo "Attempting connection using procedural approach...\n";
$connection = mysqli_connect($servername, $username, $password, $dbname);

// Check connection
if (!$connection) {
    die("Connection failed: " . mysqli_connect_error());
}
echo "Connected successfully using procedural approach\n";

// Close the procedural connection
mysqli_close($connection);

// Method 2: Object-oriented approach
echo "Attempting connection using object-oriented approach...\n";
$mysqli = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($mysqli->connect_error) {
    die("Connection failed: " . $mysqli->connect_error);
}
echo "Connected successfully using object-oriented approach\n";

// Example query to test the connection
$result = $mysqli->query("SELECT VERSION() as version");
if ($result) {
    $row = $result->fetch_assoc();
    echo "MySQL Version: " . $row['version'] . "\n";
} else {
    echo "Error executing query: " . $mysqli->error . "\n";
}

// Close the object-oriented connection
$mysqli->close();

// Method 3: Using PDO (PHP Data Objects)
echo "Attempting connection using PDO approach...\n";
try {
    $pdo = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    // Set the PDO error mode to exception
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "Connected successfully using PDO approach\n";
    
    // Example query using PDO
    $stmt = $pdo->query("SELECT VERSION() as version");
    $row = $stmt->fetch(PDO::FETCH_ASSOC);
    echo "MySQL Version (via PDO): " . $row['version'] . "\n";
} catch(PDOException $e) {
    echo "Connection failed: " . $e->getMessage() . "\n";
}

echo "All connection attempts completed.\n";
?>