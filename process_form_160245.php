<?php
// Check if the form was submitted using POST method
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Sanitize and retrieve the 'name' input from the form
    $name = htmlspecialchars($_POST["name"]);

    // Display the processed data
    echo "<h1>Hello, " . $name . "!</h1>";
    echo "<p>Thank you for submitting the form.</p>";

    // Example: Save data to a file or database could go here
    // $file = fopen("submissions.txt", "a");
    // fwrite($file, $name . "\n");
    // fclose($file);
} else {
    // If not a POST request, display a simple form for testing
    echo '<form method="post" action="">
              Name: <input type="text" name="name" required>
              <input type="submit" value="Submit">
          </form>';
}
?>