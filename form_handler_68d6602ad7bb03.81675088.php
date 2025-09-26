<?php
// Простой обработчик формы

// Проверяем, был ли запрос методом POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Определяем массив для хранения очищенных данных
    $clean_data = array();

    // Обрабатываем каждый элемент $_POST
    foreach ($_POST as $key => $value) {
        // Очищаем данные от потенциально опасных символов
        $clean_data[$key] = htmlspecialchars($value, ENT_QUOTES, 'UTF-8');
    }

    // Выводим результат (в реальном приложении здесь может быть сохранение в базу данных)
    echo "<h2>Обработанные данные формы:</h2>";
    foreach ($clean_data as $key => $value) {
        echo "<p><strong>" . htmlspecialchars($key, ENT_QUOTES, 'UTF-8') . ":</strong> " . $value . "</p>";
    }
} else {
    // Если запрос не POST, выводим сообщение
    echo "Этот скрипт обрабатывает только POST-запросы.";
}
?>