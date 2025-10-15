<?php
// Проверяем, была ли форма отправлена методом POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Пример обработки данных формы
    $name = isset($_POST['name']) ? trim($_POST['name']) : '';
    $email = isset($_POST['email']) ? trim($_POST['email']) : '';
    $message = isset($_POST['message']) ? trim($_POST['message']) : '';

    // Простая валидация
    if (!empty($name) && !empty($email) && !empty($message)) {
        // Защита от XSS
        $name = htmlspecialchars($name, ENT_QUOTES, 'UTF-8');
        $email = htmlspecialchars($email, ENT_QUOTES, 'UTF-8');
        $message = htmlspecialchars($message, ENT_QUOTES, 'UTF-8');

        // Здесь можно добавить сохранение в базу данных или файл
        // Пример сохранения в файл
        $data = "Name: $name\nEmail: $email\nMessage: $message\n\n";
        file_put_contents('form_data.txt', $data, FILE_APPEND | LOCK_EX);

        // Отправка успешного ответа
        echo "Форма успешно отправлена!";
    } else {
        echo "Пожалуйста, заполните все поля формы.";
    }
} else {
    echo "Данные формы не были отправлены методом POST.";
}
?>