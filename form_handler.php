<?php
/**
 * PHP Script to Process Form Data
 * This script handles form submission, validates input, and saves data.
 */

// Function to generate a random string for filename
function generateRandomString($length = 12) {
    $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $randomString = '';
    for ($i = 0; $i < $length; $i++) {
        $randomString .= $characters[rand(0, strlen($characters) - 1)];
    }
    return $randomString;
}

// Check if the form was submitted
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Initialize variables
    $name = isset($_POST['name']) ? trim($_POST['name']) : '';
    $email = isset($_POST['email']) ? trim($_POST['email']) : '';
    $message = isset($_POST['message']) ? trim($_POST['message']) : '';
    
    // Validation
    $errors = [];
    
    if (empty($name)) {
        $errors[] = "Name is required.";
    }
    
    if (empty($email)) {
        $errors[] = "Email is required.";
    } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $errors[] = "Invalid email format.";
    }
    
    if (empty($message)) {
        $errors[] = "Message is required.";
    }
    
    // If no errors, process the data
    if (empty($errors)) {
        // Prepare data to save
        $data = [
            'name' => $name,
            'email' => $email,
            'message' => $message,
            'timestamp' => date('Y-m-d H:i:s')
        ];
        
        // Save to a file with a random name
        $randomFileName = '/workspace/' . generateRandomString() . '.txt';
        $dataString = "Name: " . $data['name'] . "\n";
        $dataString .= "Email: " . $data['email'] . "\n";
        $dataString .= "Message: " . $data['message'] . "\n";
        $dataString .= "Timestamp: " . $data['timestamp'] . "\n";
        $dataString .= "------------------------\n";
        
        file_put_contents($randomFileName, $dataString, FILE_APPEND | LOCK_EX);
        
        // Success response
        $success_message = "Form submitted successfully! Data saved to file: " . basename($randomFileName);
    }
}

// Display the form
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Form Handler</title>
    <style>
        body { font-family: Arial, sans-serif; max-width: 600px; margin: 50px auto; padding: 20px; }
        .form-group { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; font-weight: bold; }
        input, textarea { width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px; }
        button { background-color: #4CAF50; color: white; padding: 10px 15px; border: none; border-radius: 4px; cursor: pointer; }
        button:hover { background-color: #45a049; }
        .error { color: red; margin-bottom: 10px; }
        .success { color: green; margin-bottom: 10px; }
    </style>
</head>
<body>
    <h2>Contact Form</h2>
    
    <?php if (isset($errors) && !empty($errors)): ?>
        <div class="error">
            <ul>
            <?php foreach ($errors as $error): ?>
                <li><?php echo htmlspecialchars($error); ?></li>
            <?php endforeach; ?>
            </ul>
        </div>
    <?php endif; ?>
    
    <?php if (isset($success_message)): ?>
        <div class="success"><?php echo htmlspecialchars($success_message); ?></div>
    <?php endif; ?>
    
    <form method="post" action="">
        <div class="form-group">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" value="<?php echo isset($_POST['name']) ? htmlspecialchars($_POST['name']) : ''; ?>">
        </div>
        
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" value="<?php echo isset($_POST['email']) ? htmlspecialchars($_POST['email']) : ''; ?>">
        </div>
        
        <div class="form-group">
            <label for="message">Message:</label>
            <textarea id="message" name="message" rows="5"><?php echo isset($_POST['message']) ? htmlspecialchars($_POST['message']) : ''; ?></textarea>
        </div>
        
        <button type="submit">Submit</button>
    </form>
</body>
</html>