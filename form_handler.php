<?php
// Простой обработчик формы

// Проверяем, был ли отправлен POST-запрос
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Получаем данные из формы
    $name = $_POST['name'] ?? '';
    $email = $_POST['email'] ?? '';

    // Простая валидация (можно расширить)
    if (!empty($name) && !empty($email)) {
        // Здесь можно добавить логику сохранения в базу данных или отправки email
        $data = "Имя: " . htmlspecialchars($name) . "\nEmail: " . htmlspecialchars($email) . "\n---\n";

        // Сохраняем данные в файл
        file_put_contents('form_submissions.txt', $data, FILE_APPEND | LOCK_EX);

        echo "Спасибо, ваша форма отправлена!";
    } else {
        echo "Пожалуйста, заполните все поля.";
    }
} else {
    // Если запрос не POST, отображаем форму
    ?>
    <!DOCTYPE html>
    <html>
    <head>
        <title>Форма</title>
    </head>
    <body>
        <form method="post" action="">
            <label for="name">Имя:</label><br>
            <input type="text" id="name" name="name" required><br><br>

            <label for="email">Email:</label><br>
            <input type="email" id="email" name="email" required><br><br>

            <input type="submit" value="Отправить">
        </form>
    </body>
    </html>
    <?php
}
?>