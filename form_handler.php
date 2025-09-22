<?php
// Проверяем, была ли форма отправлена методом POST
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Получаем данные из формы
    $name = htmlspecialchars($_POST['name'] ?? '');
    $email = htmlspecialchars($_POST['email'] ?? '');
    $message = htmlspecialchars($_POST['message'] ?? '');
    
    // Простая валидация
    if (empty($name) || empty($email) || empty($message)) {
        echo "Пожалуйста, заполните все поля формы.";
    } else {
        // Выводим полученные данные
        echo "<h2>Полученные данные:</h2>";
        echo "<p><strong>Имя:</strong> " . $name . "</p>";
        echo "<p><strong>Email:</strong> " . $email . "</p>";
        echo "<p><strong>Сообщение:</strong> " . $message . "</p>";
        
        // Здесь можно добавить код для сохранения данных в файл или базу данных
        // Например, сохранение в текстовый файл:
        /*
        $data = "Имя: $name\nEmail: $email\nСообщение: $message\n\n";
        file_put_contents('submissions.txt', $data, FILE_APPEND | LOCK_EX);
        echo "<p>Данные успешно сохранены.</p>";
        */
    }
} else {
    // Если форма не была отправлена, показываем форму
    echo '
    <!DOCTYPE html>
    <html>
    <head>
        <title>Форма обратной связи</title>
        <meta charset="UTF-8">
    </head>
    <body>
        <h2>Форма обратной связи</h2>
        <form method="post" action="">
            <label for="name">Имя:</label><br>
            <input type="text" id="name" name="name" required><br><br>
            
            <label for="email">Email:</label><br>
            <input type="email" id="email" name="email" required><br><br>
            
            <label for="message">Сообщение:</label><br>
            <textarea id="message" name="message" rows="5" cols="40" required></textarea><br><br>
            
            <input type="submit" value="Отправить">
        </form>
    </body>
    </html>
    ';
}
?>