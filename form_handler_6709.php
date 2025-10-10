<?php
// Обработка формы и сохранение в файл со случайным именем
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Проверяем, были ли отправлены какие-либо данные
    if (!empty($_POST)) {
        // Генерируем случайное имя файла
        $random_filename = 'form_data_' . uniqid() . '.txt';

        // Подготавливаем данные для записи
        $data = "Данные формы, полученные " . date('Y-m-d H:i:s') . ":\n";
        foreach ($_POST as $key => $value) {
            $data .= "$key: " . (is_array($value) ? implode(', ', $value) : $value) . "\n";
        }
        $data .= "---\n";

        // Сохраняем данные в файл
        if (file_put_contents($random_filename, $data)) {
            echo "Данные формы успешно сохранены в файл '$random_filename'.";
        } else {
            echo "Ошибка при сохранении файла.";
        }
    } else {
        echo "Форма не содержала данных.";
    }
} else {
    echo "Скрипт должен быть вызван через POST-запрос.";
}
?>