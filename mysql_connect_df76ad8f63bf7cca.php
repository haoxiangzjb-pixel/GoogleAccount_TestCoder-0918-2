<?php
/**
 * PHP Script to Connect to MySQL Database
 * 
 * This script demonstrates how to connect to a MySQL database using both
 * MySQLi (procedural and object-oriented) and PDO methods.
 */

// Database configuration
$servername = "localhost";  // Change this to your MySQL server address
$username = "your_username"; // Change this to your MySQL username
$password = "your_password"; // Change this to your MySQL password
$dbname = "your_database";   // Change this to your database name

// Method 1: MySQLi Object-Oriented
echo "<h2>Connecting using MySQLi Object-Oriented:</h2>\n";
$mysqli = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($mysqli->connect_error) {
    die("Connection failed: " . $mysqli->connect_error);
}
echo "Connected successfully to database '" . $dbname . "' using MySQLi OOP<br>\n";

// Close connection
$mysqli->close();

// Method 2: MySQLi Procedural
echo "<h2>Connecting using MySQLi Procedural:</h2>\n";
$connection = mysqli_connect($servername, $username, $password, $dbname);

// Check connection
if (!$connection) {
    die("Connection failed: " . mysqli_connect_error());
}
echo "Connected successfully to database '" . $dbname . "' using MySQLi Procedural<br>\n";

// Close connection
mysqli_close($connection);

// Method 3: PDO
echo "<h2>Connecting using PDO:</h2>\n";
try {
    $pdo = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    // Set the PDO error mode to exception
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "Connected successfully to database '" . $dbname . "' using PDO<br>\n";
} catch(PDOException $e) {
    die("Connection failed: " . $e->getMessage());
}

// Close connection
$pdo = null;

echo "<h3>Database connection script executed successfully!</h3>\n";
?>