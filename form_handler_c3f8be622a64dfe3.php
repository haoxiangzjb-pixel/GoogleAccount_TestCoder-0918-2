<?php
// Form processing script

// Check if form is submitted
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Process form data
    $formData = [];
    $errors = [];

    // Example form fields - adjust these according to your form
    $allowedFields = ['name', 'email', 'message', 'subject'];

    foreach ($allowedFields as $field) {
        if (isset($_POST[$field])) {
            $value = trim($_POST[$field]);
            
            // Basic validation
            switch ($field) {
                case 'name':
                    if (empty($value)) {
                        $errors[] = "Name is required";
                    } else {
                        $formData[$field] = htmlspecialchars($value, ENT_QUOTES, 'UTF-8');
                    }
                    break;
                    
                case 'email':
                    if (empty($value)) {
                        $errors[] = "Email is required";
                    } elseif (!filter_var($value, FILTER_VALIDATE_EMAIL)) {
                        $errors[] = "Invalid email format";
                    } else {
                        $formData[$field] = htmlspecialchars($value, ENT_QUOTES, 'UTF-8');
                    }
                    break;
                    
                case 'message':
                    if (empty($value)) {
                        $errors[] = "Message is required";
                    } else {
                        $formData[$field] = htmlspecialchars($value, ENT_QUOTES, 'UTF-8');
                    }
                    break;
                    
                default:
                    $formData[$field] = htmlspecialchars($value, ENT_QUOTES, 'UTF-8');
            }
        }
    }

    // If no errors, process the data
    if (empty($errors)) {
        // Save form data to file, database, or send email
        $timestamp = date('Y-m-d H:i:s');
        $logData = [
            'timestamp' => $timestamp,
            'formData' => $formData
        ];
        
        // Save to a log file
        $logFile = 'form_submissions.json';
        $existingData = [];
        
        if (file_exists($logFile)) {
            $existingData = json_decode(file_get_contents($logFile), true) ?: [];
        }
        
        $existingData[] = $logData;
        file_put_contents($logFile, json_encode($existingData, JSON_PRETTY_PRINT));
        
        // Success response
        echo json_encode([
            'status' => 'success',
            'message' => 'Form submitted successfully!',
            'data' => $formData
        ]);
    } else {
        // Error response
        http_response_code(400);
        echo json_encode([
            'status' => 'error',
            'message' => 'There were errors with your submission',
            'errors' => $errors
        ]);
    }
} else {
    // If not a POST request, show a simple HTML form for testing
    ?>
    <!DOCTYPE html>
    <html>
    <head>
        <title>Test Form</title>
        <style>
            body { font-family: Arial, sans-serif; max-width: 600px; margin: 50px auto; padding: 20px; }
            .form-group { margin-bottom: 15px; }
            label { display: block; margin-bottom: 5px; font-weight: bold; }
            input, textarea { width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px; }
            button { background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 4px; cursor: pointer; }
            button:hover { background-color: #45a049; }
            .response { margin-top: 20px; padding: 10px; border-radius: 4px; }
            .success { background-color: #d4edda; color: #155724; border: 1px solid #c3e6cb; }
            .error { background-color: #f8d7da; color: #721c24; border: 1px solid #f5c6cb; }
        </style>
    </head>
    <body>
        <h2>Test Form</h2>
        <form id="testForm" method="POST">
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
                <input type="text" id="subject" name="subject">
            </div>
            
            <div class="form-group">
                <label for="message">Message:</label>
                <textarea id="message" name="message" rows="5" required></textarea>
            </div>
            
            <button type="submit">Submit</button>
        </form>
        
        <div id="response"></div>

        <script>
            document.getElementById('testForm').addEventListener('submit', function(e) {
                e.preventDefault();
                
                const formData = new FormData(this);
                
                fetch('', {
                    method: 'POST',
                    body: formData
                })
                .then(response => response.json())
                .then(data => {
                    const responseDiv = document.getElementById('response');
                    if (data.status === 'success') {
                        responseDiv.className = 'response success';
                        responseDiv.innerHTML = '<h3>Success!</h3><p>' + data.message + '</p>';
                        document.getElementById('testForm').reset();
                    } else {
                        responseDiv.className = 'response error';
                        responseDiv.innerHTML = '<h3>Errors:</h3><ul>';
                        data.errors.forEach(function(error) {
                            responseDiv.innerHTML += '<li>' + error + '</li>';
                        });
                        responseDiv.innerHTML += '</ul>';
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                });
            });
        </script>
    </body>
    </html>
    <?php
}
?>