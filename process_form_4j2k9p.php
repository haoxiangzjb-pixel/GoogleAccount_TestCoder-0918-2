<?php
// Проверяем, был ли запрос методом POST
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Пример обработки данных формы
    $name = htmlspecialchars($_POST['name'] ?? '');
    $email = htmlspecialchars($_POST['email'] ?? '');

    // Простая валидация (пример)
    if (!empty($name) && !empty($email)) {
        // Здесь можно добавить код для сохранения в базу данных или отправки по email
        echo "Данные успешно получены от: " . $name . " (" . $email . ")";
    } else {
        echo "Пожалуйста, заполните все обязательные поля.";
    }
} else {
    // Если запрос не POST, перенаправляем или показываем сообщение
    http_response_code(405);
    echo "Метод не разрешен.";
}
?>