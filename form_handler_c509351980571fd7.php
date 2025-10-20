<?php
// Form processing script
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Process form data
    $name = isset($_POST['name']) ? htmlspecialchars($_POST['name']) : '';
    $email = isset($_POST['email']) ? htmlspecialchars($_POST['email']) : '';
    $message = isset($_POST['message']) ? htmlspecialchars($_POST['message']) : '';
    
    // Validation
    $errors = [];
    if (empty($name)) {
        $errors[] = "Name is required";
    }
    if (empty($email) || !filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $errors[] = "Valid email is required";
    }
    if (empty($message)) {
        $errors[] = "Message is required";
    }
    
    if (empty($errors)) {
        // Save form data to a file
        $data = [
            'name' => $name,
            'email' => $email,
            'message' => $message,
            'timestamp' => date('Y-m-d H:i:s')
        ];
        
        $filename = 'form_submissions_' . date('Y-m-d') . '.json';
        $file_path = __DIR__ . '/' . $filename;
        
        // Read existing data or initialize empty array
        $all_data = [];
        if (file_exists($file_path)) {
            $all_data = json_decode(file_get_contents($file_path), true) ?: [];
        }
        
        // Append new submission
        $all_data[] = $data;
        
        // Write back to file
        file_put_contents($file_path, json_encode($all_data, JSON_PRETTY_PRINT));
        
        echo "Form submitted successfully!";
    } else {
        echo "Errors:\n";
        foreach ($errors as $error) {
            echo "- $error\n";
        }
    }
} else {
    // Display a simple form for testing
    ?>
    <!DOCTYPE html>
    <html>
    <head>
        <title>Form Example</title>
    </head>
    <body>
        <h2>Contact Form</h2>
        <form method="POST" action="">
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
                <textarea id="message" name="message" required></textarea>
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