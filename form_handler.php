<?php
// PHP script for processing form data and saving to a file

// Check if the form was submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Collect form data
    $name = isset($_POST['name']) ? htmlspecialchars($_POST['name']) : '';
    $email = isset($_POST['email']) ? htmlspecialchars($_POST['email']) : '';
    $message = isset($_POST['message']) ? htmlspecialchars($_POST['message']) : '';
    
    // Validate required fields
    if (empty($name) || empty($email)) {
        echo "Name and email are required fields.";
        exit;
    }
    
    // Prepare data to save
    $data = array(
        'name' => $name,
        'email' => $email,
        'message' => $message,
        'timestamp' => date('Y-m-d H:i:s')
    );
    
    // Generate a random filename
    $random_filename = 'form_data_' . uniqid() . '.txt';
    $file_path = $random_filename;
    
    // Convert data to string format
    $content = "Form Submission Data:\n";
    $content .= "Name: " . $data['name'] . "\n";
    $content .= "Email: " . $data['email'] . "\n";
    $content .= "Message: " . $data['message'] . "\n";
    $content .= "Timestamp: " . $data['timestamp'] . "\n";
    $content .= "--------------------------\n\n";
    
    // Save the data to the file
    if (file_put_contents($file_path, $content, FILE_APPEND | LOCK_EX)) {
        echo "Form data successfully saved to file: " . $random_filename;
    } else {
        echo "Error saving form data to file.";
    }
} else {
    // Display a simple form for testing
    ?>
    <!DOCTYPE html>
    <html>
    <head>
        <title>Form Processing Example</title>
    </head>
    <body>
        <h2>Contact Form</h2>
        <form method="post" action="<?php echo $_SERVER['PHP_SELF']; ?>">
            <label for="name">Name:</label><br>
            <input type="text" id="name" name="name" required><br><br>
            
            <label for="email">Email:</label><br>
            <input type="email" id="email" name="email" required><br><br>
            
            <label for="message">Message:</label><br>
            <textarea id="message" name="message"></textarea><br><br>
            
            <input type="submit" value="Submit">
        </form>
    </body>
    </html>
    <?php
}
?>