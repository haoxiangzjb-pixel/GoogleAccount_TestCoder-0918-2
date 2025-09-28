<?php
// Проверяем, был ли запрос методом POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Определяем поля формы
    $name = $_POST['name'] ?? '';
    $email = $_POST['email'] ?? '';
    $message = $_POST['message'] ?? '';

    // Простая валидация (пример)
    $errors = [];
    if (empty($name)) {
        $errors[] = 'Имя обязательно.';
    }
    if (empty($email) || !filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $errors[] = 'Email обязателен и должен быть действительным.';
    }
    if (empty($message)) {
        $errors[] = 'Сообщение обязательно.';
    }

    // Если ошибок нет, обрабатываем данные
    if (empty($errors)) {
        // В реальном приложении данные следует сохранять в базу данных.
        // Для примера, сохраним в текстовый файл.
        $data = "Имя: " . $name . "\n";
        $data .= "Email: " . $email . "\n";
        $data .= "Сообщение: " . $message . "\n";
        $data .= "Время: " . date('Y-m-d H:i:s') . "\n---\n";

        file_put_contents('form_submissions.txt', $data, FILE_APPEND | LOCK_EX);

        echo "Спасибо, ваше сообщение отправлено!";
    } else {
        // Выводим ошибки
        foreach ($errors as $error) {
            echo htmlspecialchars($error) . "<br>";
        }
    }
} else {
    // Если запрос не POST, выводим форму
    echo '
    <form method="post" action="">
        <label for="name">Имя:</label><br>
        <input type="text" id="name" name="name" required><br><br>

        <label for="email">Email:</label><br>
        <input type="email" id="email" name="email" required><br><br>

        <label for="message">Сообщение:</label><br>
        <textarea id="message" name="message" rows="4" cols="50" required></textarea><br><br>

        <input type="submit" value="Отправить">
    </form>
    ';
}
?>