<?php
// Обработка данных формы
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Получение и очистка данных
    $name = htmlspecialchars($_POST['name'] ?? '');
    $email = htmlspecialchars($_POST['email'] ?? '');
    $message = htmlspecialchars($_POST['message'] ?? '');

    // Простая валидация
    if (empty($name) || empty($email) || empty($message)) {
        die('Все поля обязательны для заполнения.');
    }

    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        die('Некорректный email.');
    }

    // Здесь можно добавить логику сохранения в базу данных или отправки email
    // Для примера, просто сохраним в файл
    $log_entry = date('Y-m-d H:i:s') . " | Имя: $name, Email: $email, Сообщение: $message\n";
    file_put_contents('form_submissions.log', $log_entry, FILE_APPEND | LOCK_EX);

    echo "Спасибо, $name! Ваше сообщение отправлено.";
} else {
    // Если форма не отправлена методом POST, перенаправляем на главную
    header('Location: index.html');
    exit;
}
</php>