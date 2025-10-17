<?php
// PHP script to handle form processing

// Set content type to HTML
header("Content-Type: text/html; charset=UTF-8");

// Check if the request method is POST
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Process form data
    $name = isset($_POST['name']) ? htmlspecialchars($_POST['name']) : '';
    $email = isset($_POST['email']) ? htmlspecialchars($_POST['email']) : '';
    $message = isset($_POST['message']) ? htmlspecialchars($_POST['message']) : '';
    
    // Validation
    $errors = [];
    
    if (empty($name)) {
        $errors[] = "Имя обязательно для заполнения.";
    }
    
    if (empty($email)) {
        $errors[] = "Email обязателен для заполнения.";
    } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $errors[] = "Некорректный формат email.";
    }
    
    if (empty($message)) {
        $errors[] = "Сообщение обязательно для заполнения.";
    }
    
    // If no errors, process the data
    if (empty($errors)) {
        // Save form data to a file
        $data = [
            'name' => $name,
            'email' => $email,
            'message' => $message,
            'timestamp' => date('Y-m-d H:i:s')
        ];
        
        // Convert to JSON string
        $json_data = json_encode($data, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE);
        
        // Save to file
        $filename = "form_data_" . date('Y-m-d') . ".json";
        file_put_contents($filename, $json_data . "\n", FILE_APPEND | LOCK_EX);
        
        // Success response
        echo "<!DOCTYPE html>
        <html>
        <head>
            <title>Форма обработана</title>
            <meta charset=\"UTF-8\">
        </head>
        <body>
            <h1>Спасибо за ваше сообщение!</h1>
            <p>Имя: " . $name . "</p>
            <p>Email: " . $email . "</p>
            <p>Сообщение: " . nl2br($message) . "</p>
            <p>Сообщение отправлено: " . date('d.m.Y H:i:s') . "</p>
            <a href='javascript:history.back()'>Вернуться к форме</a>
        </body>
        </html>";
    } else {
        // Display errors
        echo "<!DOCTYPE html>
        <html>
        <head>
            <title>Ошибки в форме</title>
            <meta charset=\"UTF-8\">
            <style>
                .error { color: red; }
            </style>
        </head>
        <body>
            <h1>Пожалуйста, исправьте следующие ошибки:</h1>
            <ul>";
        foreach ($errors as $error) {
            echo "<li class='error'>" . $error . "</li>";
        }
        echo "
            </ul>
            <a href='javascript:history.back()'>Вернуться к форме</a>
        </body>
        </html>";
    }
} else {
    // If not a POST request, display a simple form for testing
    echo "<!DOCTYPE html>
    <html>
    <head>
        <title>Тестовая форма</title>
        <meta charset=\"UTF-8\">
    </head>
    <body>
        <h1>Тестовая контактная форма</h1>
        <form method='post' action='" . $_SERVER['PHP_SELF'] . "'>
            <p>
                <label for='name'>Имя:</label><br>
                <input type='text' id='name' name='name' required>
            </p>
            <p>
                <label for='email'>Email:</label><br>
                <input type='email' id='email' name='email' required>
            </p>
            <p>
                <label for='message'>Сообщение:</label><br>
                <textarea id='message' name='message' rows='5' cols='40' required></textarea>
            </p>
            <p>
                <input type='submit' value='Отправить'>
            </p>
        </form>
    </body>
    </html>";
}
?>