<?php
// Проверяем, был ли запрос методом POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Пример обработки данных формы
    $name = $_POST['name'] ?? '';
    $email = $_POST['email'] ?? '';

    // Простая валидация (в реальном приложении нужна более строгая валидация)
    if (!empty($name) && !empty($email)) {
        // Здесь может быть логика сохранения в базу данных или отправки email
        $data = "Имя: " . htmlspecialchars($name) . "\nEmail: " . htmlspecialchars($email) . "\n---\n";
        file_put_contents('form_data.txt', $data, FILE_APPEND | LOCK_EX);
        echo "Спасибо! Данные сохранены.";
    } else {
        echo "Ошибка: заполните все поля.";
    }
} else {
    // Если запрос не POST, отображаем форму
    ?>
    <form method="post" action="">
        <label for="name">Имя:</label>
        <input type="text" id="name" name="name" required><br><br>
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br><br>
        <input type="submit" value="Отправить">
    </form>
    <?php
}
?>