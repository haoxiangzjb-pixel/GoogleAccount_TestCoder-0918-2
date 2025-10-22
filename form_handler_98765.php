<?php
/**
 * PHP Script to Handle Form Processing
 * This script processes form data and saves it to a file
 */

// Function to generate a random string
function generateRandomString($length = 10) {
    $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $randomString = '';
    for ($i = 0; $i < $length; $i++) {
        $randomString .= $characters[rand(0, strlen($characters) - 1)];
    }
    return $randomString;
}

// Process form data if form was submitted
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Collect form data
    $formData = [];
    
    // Process each field in the form
    foreach ($_POST as $key => $value) {
        $formData[$key] = htmlspecialchars(trim($value));
    }
    
    // Create a unique filename for storing form data
    $randomFileName = 'form_data_' . generateRandomString(8) . '.txt';
    
    // Prepare data to save
    $dataToSave = "Form Submission - " . date('Y-m-d H:i:s') . "\n";
    foreach ($formData as $key => $value) {
        $dataToSave .= "$key: $value\n";
    }
    $dataToSave .= "------------------------\n\n";
    
    // Save form data to file
    if (file_put_contents($randomFileName, $dataToSave, FILE_APPEND | LOCK_EX)) {
        echo "<h2>Form submitted successfully!</h2>";
        echo "<p>Form data saved to: <strong>$randomFileName</strong></p>";
        echo "<p>Thank you for your submission.</p>";
    } else {
        echo "<h2>Error saving form data!</h2>";
        echo "<p>There was an issue saving your form data.</p>";
    }
} else {
    // Display a simple form for testing
    ?>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Form Handler</title>
        <style>
            body { font-family: Arial, sans-serif; max-width: 600px; margin: 50px auto; padding: 20px; }
            .form-group { margin-bottom: 15px; }
            label { display: block; margin-bottom: 5px; font-weight: bold; }
            input, textarea, select { width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px; }
            button { background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 4px; cursor: pointer; }
            button:hover { background-color: #45a049; }
        </style>
    </head>
    <body>
        <h1>Contact Form</h1>
        <form method="POST" action="">
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required>
            </div>
            
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
            </div>
            
            <div class="form-group">
                <label for="subject">Subject:</label>
                <input type="text" id="subject" name="subject" required>
            </div>
            
            <div class="form-group">
                <label for="message">Message:</label>
                <textarea id="message" name="message" rows="5" required></textarea>
            </div>
            
            <div class="form-group">
                <label for="department">Department:</label>
                <select id="department" name="department">
                    <option value="sales">Sales</option>
                    <option value="support">Support</option>
                    <option value="billing">Billing</option>
                    <option value="other">Other</option>
                </select>
            </div>
            
            <button type="submit">Submit Form</button>
        </form>
    </body>
    </html>
    <?php
}
?>