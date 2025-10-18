<?php
// Form Processing Script
// This script handles form submissions and saves data

// Set content type to HTML
header('Content-Type: text/html; charset=utf-8');

// Function to sanitize input data
function sanitizeInput($data) {
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}

// Check if form was submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    
    // Process form data
    $name = isset($_POST["name"]) ? sanitizeInput($_POST["name"]) : "";
    $email = isset($_POST["email"]) ? sanitizeInput($_POST["email"]) : "";
    $message = isset($_POST["message"]) ? sanitizeInput($_POST["message"]) : "";
    
    // Validation
    $errors = array();
    
    if (empty($name)) {
        $errors[] = "Name is required";
    }
    
    if (empty($email)) {
        $errors[] = "Email is required";
    } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $errors[] = "Invalid email format";
    }
    
    if (empty($message)) {
        $errors[] = "Message is required";
    }
    
    // If no errors, save data
    if (empty($errors)) {
        // Prepare data for saving
        $form_data = array(
            'name' => $name,
            'email' => $email,
            'message' => $message,
            'timestamp' => date('Y-m-d H:i:s')
        );
        
        // Save to a file (in JSON format)
        $data_file = "form_submissions.json";
        $existing_data = array();
        
        // Read existing data if file exists
        if (file_exists($data_file)) {
            $json_data = file_get_contents($data_file);
            $existing_data = json_decode($json_data, true) ?: array();
        }
        
        // Add new submission
        $existing_data[] = $form_data;
        
        // Save updated data
        file_put_contents($data_file, json_encode($existing_data, JSON_PRETTY_PRINT));
        
        // Success response
        echo "<!DOCTYPE html>
        <html>
        <head>
            <title>Form Submission Result</title>
            <style>
                body { font-family: Arial, sans-serif; margin: 40px; }
                .success { color: green; }
                .error { color: red; }
                .back-link { margin-top: 20px; }
            </style>
        </head>
        <body>
            <h2>Form Submission Result</h2>
            <p class='success'>Thank you for your message, {$name}! It has been saved successfully.</p>
            <div class='back-link'>
                <a href='?'>Submit Another Form</a>
            </div>
        </body>
        </html>";
    } else {
        // Display errors
        echo "<!DOCTYPE html>
        <html>
        <head>
            <title>Form Errors</title>
            <style>
                body { font-family: Arial, sans-serif; margin: 40px; }
                .error { color: red; }
                .error-list { background-color: #ffe6e6; padding: 15px; border-radius: 5px; }
            </style>
        </head>
        <body>
            <h2>Form Errors</h2>
            <div class='error-list'>
                <p>Please correct the following errors:</p>
                <ul>";
        foreach ($errors as $error) {
            echo "<li class='error'>" . $error . "</li>";
        }
        echo "      </ul>
            </div>
            <div style='margin-top: 20px;'>
                <a href='javascript:history.back()'>Go Back</a>
            </div>
        </body>
        </html>";
    }
} else {
    // Display the form if not submitted
    echo "<!DOCTYPE html>
    <html>
    <head>
        <title>Contact Form</title>
        <style>
            body { font-family: Arial, sans-serif; margin: 40px; }
            .form-container { max-width: 500px; margin: 0 auto; }
            .form-group { margin-bottom: 15px; }
            label { display: block; margin-bottom: 5px; font-weight: bold; }
            input, textarea { width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px; }
            textarea { height: 100px; resize: vertical; }
            .submit-btn { background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 4px; cursor: pointer; }
            .submit-btn:hover { background-color: #45a049; }
        </style>
    </head>
    <body>
        <div class='form-container'>
            <h2>Contact Form</h2>
            <form method='post' action='" . htmlspecialchars($_SERVER["PHP_SELF"]) . "'>
                <div class='form-group'>
                    <label for='name'>Name *</label>
                    <input type='text' id='name' name='name' required>
                </div>
                
                <div class='form-group'>
                    <label for='email'>Email *</label>
                    <input type='email' id='email' name='email' required>
                </div>
                
                <div class='form-group'>
                    <label for='message'>Message *</label>
                    <textarea id='message' name='message' placeholder='Enter your message here...' required></textarea>
                </div>
                
                <button type='submit' class='submit-btn'>Submit</button>
            </form>
        </div>
    </body>
    </html>";
}
?>