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
        // Save data to a file or database
        $data = [
            'name' => $name,
            'email' => $email,
            'message' => $message,
            'timestamp' => date('Y-m-d H:i:s')
        ];
        
        // Write to a log file
        $log_entry = json_encode($data) . "\n";
        file_put_contents('form_submissions.log', $log_entry, FILE_APPEND | LOCK_EX);
        
        echo "<h2>Form submitted successfully!</h2>";
        echo "<p>Thank you, {$name}. Your message has been received.</p>";
    } else {
        echo "<h2>Errors found:</h2><ul>";
        foreach ($errors as $error) {
            echo "<li>" . htmlspecialchars($error) . "</li>";
        }
        echo "</ul>";
        echo '<a href="javascript:history.back()">Go back</a>';
    }
} else {
    // Display the form
    ?>
    <!DOCTYPE html>
    <html>
    <head>
        <title>Form Example</title>
        <style>
            body { font-family: Arial, sans-serif; max-width: 600px; margin: 50px auto; }
            .form-group { margin-bottom: 15px; }
            label { display: block; margin-bottom: 5px; font-weight: bold; }
            input, textarea { width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px; }
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
                <label for="message">Message:</label>
                <textarea id="message" name="message" rows="5" required></textarea>
            </div>
            
            <button type="submit">Submit</button>
        </form>
    </body>
    </html>
    <?php
}
?>