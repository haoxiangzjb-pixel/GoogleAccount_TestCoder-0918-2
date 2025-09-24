<?php
// Обработка формы
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $name = $_POST['name'] ?? '';
    $email = $_POST['email'] ?? '';

    // Простая валидация (в реальном приложении нужна более строгая проверка)
    if (!empty($name) && !empty($email)) {
        // Здесь можно добавить код для сохранения данных в файл или базу данных
        echo 'Данные успешно получены от: ' . htmlspecialchars($name) . '<br>';
        echo 'Email: ' . htmlspecialchars($email);
    } else {
        echo 'Пожалуйста, заполните все поля.';
    }
} else {
    echo 'Метод запроса не поддерживается.';
}
?>
