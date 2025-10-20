<?php
/**
 * Form Processing Script
 * Handles form submission, validates input, sanitizes data, and provides feedback
 */

// Initialize variables
$name = $email = $message = "";
$nameErr = $emailErr = $messageErr = "";
$success = false;

// Process form when submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    
    // Validate Name
    if (empty($_POST["name"])) {
        $nameErr = "Name is required";
    } else {
        $name = sanitize_input($_POST["name"]);
        if (!preg_match("/^[a-zA-Z-' ]*$/", $name)) {
            $nameErr = "Only letters and white space allowed";
        }
    }
    
    // Validate Email
    if (empty($_POST["email"])) {
        $emailErr = "Email is required";
    } else {
        $email = sanitize_input($_POST["email"]);
        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            $emailErr = "Invalid email format";
        }
    }
    
    // Validate Message
    if (empty($_POST["message"])) {
        $messageErr = "Message is required";
    } else {
        $message = sanitize_input($_POST["message"]);
    }
    
    // If no errors, process the form
    if (empty($nameErr) && empty($emailErr) && empty($messageErr)) {
        // In a real application, you might save to database or send email here
        // For this example, we'll just set success to true
        $success = true;
        
        // Optional: Save form data to a file or database
        $formData = [
            'name' => $name,
            'email' => $email,
            'message' => $message,
            'timestamp' => date('Y-m-d H:i:s')
        ];
        
        // Log the submission to a file (optional)
        file_put_contents('form_submissions.log', json_encode($formData) . "\n", FILE_APPEND | LOCK_EX);
    }
}

// Function to sanitize input data
function sanitize_input($data) {
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Form Handler</title>
    <style>
        body { font-family: Arial, sans-serif; max-width: 600px; margin: 50px auto; padding: 20px; }
        .error { color: #e74c3c; }
        .success { color: #27ae60; }
        .form-group { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; font-weight: bold; }
        input[type="text"], input[type="email"], textarea {
            width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px; box-sizing: border-box;
        }
        textarea { height: 100px; resize: vertical; }
        input[type="submit"] {
            background-color: #3498db; color: white; padding: 10px 20px; border: none;
            border-radius: 4px; cursor: pointer; font-size: 16px;
        }
        input[type="submit"]:hover { background-color: #2980b9; }
    </style>
</head>
<body>
    <h1>Contact Form</h1>
    
    <?php if ($success): ?>
        <div class="success">
            <p>Thank you for your message, <?php echo $name; ?>! We have received your submission.</p>
        </div>
    <?php else: ?>
        <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" value="<?php echo $name; ?>">
                <span class="error"><?php echo $nameErr; ?></span>
            </div>
            
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" value="<?php echo $email; ?>">
                <span class="error"><?php echo $emailErr; ?></span>
            </div>
            
            <div class="form-group">
                <label for="message">Message:</label>
                <textarea id="message" name="message"><?php echo $message; ?></textarea>
                <span class="error"><?php echo $messageErr; ?></span>
            </div>
            
            <input type="submit" value="Submit">
        </form>
    <?php endif; ?>
</body>
</html>