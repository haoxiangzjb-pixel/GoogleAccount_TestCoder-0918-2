<?php
/**
 * Form Processing Script
 * Handles form submission and saves data to a file with a random name
 */

// Function to generate a random filename
function generateRandomFilename($extension = 'txt') {
    $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $randomString = '';
    for ($i = 0; $i < 10; $i++) {
        $randomString .= $characters[rand(0, strlen($characters) - 1)];
    }
    return $randomString . '.' . $extension;
}

// Check if form was submitted
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Collect form data
    $formData = [];
    
    // Process all POST data
    foreach ($_POST as $key => $value) {
        $formData[$key] = is_array($value) ? implode(', ', $value) : $value;
    }
    
    // Generate random filename
    $randomFilename = generateRandomFilename('txt');
    $filePath = __DIR__ . '/' . $randomFilename;
    
    // Prepare data to save
    $dataToSave = "Form Submission Data:\n";
    $dataToSave .= "Timestamp: " . date('Y-m-d H:i:s') . "\n";
    $dataToSave .= "------------------------\n";
    
    foreach ($formData as $field => $value) {
        $dataToSave .= "$field: $value\n";
    }
    
    $dataToSave .= "\n";
    
    // Save form data to file
    if (file_put_contents($filePath, $dataToSave, FILE_APPEND | LOCK_EX)) {
        echo "<h2>Form submitted successfully!</h2>";
        echo "<p>Data saved to file: <strong>$randomFilename</strong></p>";
        echo "<p>Content saved:</p>";
        echo "<pre>" . htmlspecialchars($dataToSave) . "</pre>";
    } else {
        echo "<h2>Error saving form data!</h2>";
        echo "<p>Could not save data to file.</p>";
    }
} else {
    // Display a simple form for testing
    ?>
    <!DOCTYPE html>
    <html>
    <head>
        <title>Form Processing Example</title>
        <style>
            body { font-family: Arial, sans-serif; margin: 40px; }
            .form-group { margin-bottom: 15px; }
            label { display: block; margin-bottom: 5px; font-weight: bold; }
            input, textarea, select { width: 300px; padding: 8px; }
            button { background-color: #4CAF50; color: white; padding: 10px 15px; border: none; cursor: pointer; }
            button:hover { background-color: #45a049; }
        </style>
    </head>
    <body>
        <h1>Form Processing Example</h1>
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
                <label for="message">Message:</label>
                <textarea id="message" name="message" rows="5"></textarea>
            </div>
            
            <div class="form-group">
                <label for="subject">Subject:</label>
                <select id="subject" name="subject">
                    <option value="general">General Inquiry</option>
                    <option value="support">Support</option>
                    <option value="feedback">Feedback</option>
                </select>
            </div>
            
            <button type="submit">Submit Form</button>
        </form>
    </body>
    </html>
    <?php
}
?>