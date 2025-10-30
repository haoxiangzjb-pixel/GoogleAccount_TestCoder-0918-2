<?php
/**
 * PHP Script to Connect to MySQL Database
 * 
 * This script demonstrates different ways to connect to a MySQL database
 * using both the MySQLi extension and PDO.
 */

// Database configuration
$servername = "localhost";  // Change this to your MySQL server address
$username = "your_username";  // Change this to your MySQL username
$password = "your_password";  // Change this to your MySQL password
$database = "your_database";  // Change this to your database name (optional)

// Method 1: Using MySQLi (Procedural)
echo "<h2>Method 1: MySQLi Procedural</h2>\n";
$connection = mysqli_connect($servername, $username, $password, $database);

// Check connection
if (!$connection) {
    die("Connection failed: " . mysqli_connect_error());
}
echo "Connected successfully using MySQLi (Procedural)<br>\n";

// Close connection
mysqli_close($connection);

// Method 2: Using MySQLi (Object-Oriented)
echo "<h2>Method 2: MySQLi Object-Oriented</h2>\n";
$mysqli = new mysqli($servername, $username, $password, $database);

// Check connection
if ($mysqli->connect_error) {
    die("Connection failed: " . $mysqli->connect_error);
}
echo "Connected successfully using MySQLi (Object-Oriented)<br>\n";

// Close connection
$mysqli->close();

// Method 3: Using PDO
echo "<h2>Method 3: PDO</h2>\n";
try {
    $pdo = new PDO("mysql:host=$servername;dbname=$database", $username, $password);
    // Set the PDO error mode to exception
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "Connected successfully using PDO<br>\n";
} catch(PDOException $e) {
    echo "Connection failed: " . $e->getMessage() . "<br>\n";
}

echo "<p>All connection methods executed.</p>\n";
?>