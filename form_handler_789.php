<?php
// Проверяем, был ли запрос методом POST
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Получаем и очищаем данные из формы
    $name = htmlspecialchars($_POST['name'] ?? '');
    $email = htmlspecialchars($_POST['email'] ?? '');
    $message = htmlspecialchars($_POST['message'] ?? '');

    // Простая валидация
    if (empty($name) || empty($email) || empty($message)) {
        echo "Все поля обязательны для заполнения.";
        exit;
    }

    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        echo "Некорректный адрес электронной почты.";
        exit;
    }

    // Формируем строку для записи
    $data = "Имя: $name, Email: $email, Сообщение: $message, Время: " . date('Y-m-d H:i:s') . "\n";

    // Имя файла для лога
    $log_file = "form_submissions.log";

    // Открываем файл для добавления данных (или создаем, если его нет)
    $file = fopen($log_file, "a");

    // Записываем данные
    if ($file) {
        fwrite($file, $data);
        fclose($file);
        echo "Форма успешно отправлена. Данные сохранены.";
    } else {
        echo "Ошибка при сохранении данных.";
    }
} else {
    echo "Данный скрипт обрабатывает только POST-запросы.";
}
?>