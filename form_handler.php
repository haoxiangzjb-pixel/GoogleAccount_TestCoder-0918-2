<?php
// PHP script to handle form processing
// This script demonstrates form processing with validation and data handling

// Set content type to HTML
header('Content-Type: text/html; charset=utf-8');

// Define a function to sanitize input data
function sanitizeInput($data) {
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}

// Check if the request method is POST
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Process form data
    $name = $email = $message = "";
    $nameErr = $emailErr = $messageErr = "";
    $isValid = true;

    // Validate and sanitize name
    if (empty($_POST["name"])) {
        $nameErr = "Name is required";
        $isValid = false;
    } else {
        $name = sanitizeInput($_POST["name"]);
        // Check if name only contains letters and whitespace
        if (!preg_match("/^[a-zA-Z-' ]*$/", $name)) {
            $nameErr = "Only letters and white space allowed";
            $isValid = false;
        }
    }

    // Validate and sanitize email
    if (empty($_POST["email"])) {
        $emailErr = "Email is required";
        $isValid = false;
    } else {
        $email = sanitizeInput($_POST["email"]);
        // Check if email address is well-formed
        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            $emailErr = "Invalid email format";
            $isValid = false;
        }
    }

    // Validate and sanitize message
    if (empty($_POST["message"])) {
        $messageErr = "Message is required";
        $isValid = false;
    } else {
        $message = sanitizeInput($_POST["message"]);
    }

    // If all validations pass, process the data
    if ($isValid) {
        // In a real application, you would save to database or file
        // For this example, we'll just show a success message
        echo "<h2>Form Submission Successful!</h2>";
        echo "<p><strong>Name:</strong> " . $name . "</p>";
        echo "<p><strong>Email:</strong> " . $email . "</p>";
        echo "<p><strong>Message:</strong> " . $message . "</p>";
        
        // Optional: Save to a file
        $data = "Name: $name\nEmail: $email\nMessage: $message\n---\n";
        file_put_contents("form_submissions.txt", $data, FILE_APPEND | LOCK_EX);
        
        echo "<p>Your form has been successfully processed.</p>";
    } else {
        // Display errors
        echo "<h2>Form Submission Error</h2>";
        echo "<p style='color:red;'>Please correct the following errors:</p>";
        if (!empty($nameErr)) {
            echo "<p><strong>Name Error:</strong> " . $nameErr . "</p>";
        }
        if (!empty($emailErr)) {
            echo "<p><strong>Email Error:</strong> " . $emailErr . "</p>";
        }
        if (!empty($messageErr)) {
            echo "<p><strong>Message Error:</strong> " . $messageErr . "</p>";
        }
        
        // Provide a link to go back to the form
        echo "<p><a href='javascript:history.back()'>Go back to form</a></p>";
    }
} else {
    // If not a POST request, display the form
    ?>
    <!DOCTYPE html>
    <html>
    <head>
        <title>Form Processing Example</title>
        <style>
            body { font-family: Arial, sans-serif; margin: 40px; }
            .form-group { margin-bottom: 15px; }
            label { display: block; margin-bottom: 5px; font-weight: bold; }
            input[type="text"], input[type="email"], textarea {
                width: 100%; max-width: 400px; padding: 8px; border: 1px solid #ccc; border-radius: 4px;
            }
            textarea { height: 100px; }
            .error { color: red; }
            button { background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 4px; cursor: pointer; }
            button:hover { background-color: #45a049; }
        </style>
    </head>
    <body>
        <h1>Contact Form</h1>
        <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
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
                <textarea id="message" name="message" required></textarea>
            </div>
            
            <button type="submit">Submit</button>
        </form>
    </body>
    </html>
    <?php
}
?>