<?php
/**
 * Form Processing Script
 * Handles form submission, validates input, and saves data
 */

// Generate a random filename for saving
$random_filename = 'form_data_' . uniqid() . '.txt';

// Check if form was submitted
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Process form data
    $form_data = array();
    
    // Sanitize and collect form inputs
    foreach ($_POST as $key => $value) {
        $form_data[$key] = htmlspecialchars(strip_tags(trim($value)));
    }
    
    // Create output string with form data
    $output = "Form Submission Data\n";
    $output .= "-------------------\n";
    $output .= "Submitted at: " . date('Y-m-d H:i:s') . "\n\n";
    
    foreach ($form_data as $field => $value) {
        $output .= ucfirst($field) . ": " . $value . "\n";
    }
    
    $output .= "\n";
    
    // Save form data to file with random name
    if (file_put_contents($random_filename, $output)) {
        echo "<h2>Form submitted successfully!</h2>";
        echo "<p>Data saved to file: <strong>" . $random_filename . "</strong></p>";
        echo "<p>Saved data:</p><pre>" . $output . "</pre>";
    } else {
        echo "<p>Error saving data to file.</p>";
    }
} else {
    // Display a simple form for testing
    echo '<h2>Test Form</h2>';
    echo '<form method="post" action="">';
    echo '<p><label for="name">Name: </label><input type="text" name="name" id="name" required></p>';
    echo '<p><label for="email">Email: </label><input type="email" name="email" id="email" required></p>';
    echo '<p><label for="message">Message: </label><textarea name="message" id="message"></textarea></p>';
    echo '<p><input type="submit" value="Submit"></p>';
    echo '</form>';
}
?>