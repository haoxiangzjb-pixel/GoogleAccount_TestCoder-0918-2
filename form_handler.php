<?php
/**
 * Form Processing Script
 * Handles form submission and saves data
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

// Check if form was submitted
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Collect form data
    $formData = [];
    
    // Process all form fields
    foreach ($_POST as $key => $value) {
        $formData[$key] = htmlspecialchars(trim($value));
    }
    
    // Generate a unique filename for the data
    $dataFileName = 'form_data_' . date('Y-m-d') . '_' . generateRandomString() . '.txt';
    $dataFilePath = __DIR__ . '/' . $dataFileName;
    
    // Save form data to file
    $logData = "Form Submission - " . date('Y-m-d H:i:s') . "\n";
    $logData .= "----------------------------------------\n";
    foreach ($formData as $field => $value) {
        $logData .= "$field: $value\n";
    }
    $logData .= "\n";
    
    // Write data to file
    file_put_contents($dataFilePath, $logData, FILE_APPEND | LOCK_EX);
    
    // Prepare response
    $response = [
        'status' => 'success',
        'message' => 'Form submitted successfully!',
        'data_file' => $dataFileName,
        'received_data' => $formData
    ];
    
    // Return JSON response
    header('Content-Type: application/json');
    echo json_encode($response);
} else {
    // If not a POST request, show a simple form for testing
    ?>
    <!DOCTYPE html>
    <html>
    <head>
        <title>Test Form</title>
    </head>
    <body>
        <h2>Test Form</h2>
        <form method="post" action="">
            <p>
                <label for="name">Name:</label><br>
                <input type="text" id="name" name="name" required>
            </p>
            <p>
                <label for="email">Email:</label><br>
                <input type="email" id="email" name="email" required>
            </p>
            <p>
                <label for="message">Message:</label><br>
                <textarea id="message" name="message"></textarea>
            </p>
            <p>
                <input type="submit" value="Submit">
            </p>
        </form>
    </body>
    </html>
    <?php
}
?>