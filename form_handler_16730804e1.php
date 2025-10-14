<?php
// Простой скрипт для обработки формы
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Получаем и sanitize-им данные из формы
    $name = htmlspecialchars($_POST['name'] ?? '');
    $email = htmlspecialchars($_POST['email'] ?? '');

    // Простая валидация (проверка на пустоту)
    if (empty($name) || empty($email)) {
        echo "Имя и Email обязательны для заполнения.";
    } else {
        // Здесь можно добавить код для сохранения данных в базу данных или файл
        echo "Данные успешно получены!<br>";
        echo "Имя: " . $name . "<br>";
        echo "Email: " . $email . "<br>";
    }
} else {
    // Если запрос не POST, выводим сообщение
    http_response_code(405);
    echo "Метод не разрешен. Используйте POST.";
}
?>