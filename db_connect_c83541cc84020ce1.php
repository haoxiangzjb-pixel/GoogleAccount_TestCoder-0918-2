<?php
// Database configuration
$servername = "localhost";
$username = "your_username"; // Replace with your MySQL username
$password = "your_password"; // Replace with your MySQL password
$dbname = "your_database";   // Replace with your database name

try {
    // Create a new PDO connection
    $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);

    // Set the PDO error mode to exception
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Optional: Set charset to utf8
    $conn->exec("set names utf8");

    echo "Connected successfully";

    // You can perform database operations here
    // For example, fetching data:
    /*
    $stmt = $conn->prepare("SELECT id, name FROM your_table");
    $stmt->execute();
    $results = $stmt->fetchAll(PDO::FETCH_ASSOC);
    foreach ($results as $row) {
        echo $row['id'] . " - " . $row['name'] . "\n";
    }
    */

} catch(PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
}

// Close the connection (optional, as it's done automatically at the end of the script)
$conn = null;
?>