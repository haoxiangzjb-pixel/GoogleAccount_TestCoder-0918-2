<?php
// Проверяем, был ли запрос методом POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Пример обработки данных формы
    $name = $_POST['name'] ?? 'Аноним';
    $email = $_POST['email'] ?? '';

    // Простая валидация (например, проверка на пустоту)
    if (empty(trim($name)) || empty(trim($email))) {
        echo 'Ошибка: Имя и Email обязательны.';
    } else {
        // Здесь можно добавить логику сохранения в базу данных, отправки email и т.д.
        echo 'Данные получены от: ' . htmlspecialchars($name) . ' (' . htmlspecialchars($email) . ')';
    }
} else {
    // Если не POST, отображаем форму
    echo '<html><body><form method="post" action="' . $_SERVER['PHP_SELF'] . '">
        Имя: <input type="text" name="name" required><br>
        Email: <input type="email" name="email" required><br>
        <input type="submit" value="Отправить">
    </form></body></html>';
}
?>