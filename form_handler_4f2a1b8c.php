<?php
// Обработка формы и сохранение данных в файл

// Установим заголовки для корректной работы с JSON
header('Content-Type: application/json');

// Проверим, был ли запрос методом POST
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405); // Method Not Allowed
    echo json_encode(['error' => 'Метод не разрешен. Используйте POST.']);
    exit;
}

// Получим данные из формы
$name = $_POST['name'] ?? '';
$email = $_POST['email'] ?? '';
$message = $_POST['message'] ?? '';

// Простая валидация (проверим, что поля не пустые)
if (empty($name) || empty($email) || empty($message)) {
    http_response_code(400); // Bad Request
    echo json_encode(['error' => 'Все поля обязательны для заполнения.']);
    exit;
}

// Подготовим данные для сохранения
$data = [
    'timestamp' => date('Y-m-d H:i:s'),
    'name' => $name,
    'email' => filter_var($email, FILTER_SANITIZE_EMAIL), // Санитизируем email
    'message' => $message
];

// Проверим, корректен ли email
if (!filter_var($data['email'], FILTER_VALIDATE_EMAIL)) {
    http_response_code(400);
    echo json_encode(['error' => 'Некорректный адрес электронной почты.']);
    exit;
}

// Сгенерируем случайное имя файла
$random_filename = bin2hex(random_bytes(8)) . '.json'; // Например, a1b2c3d4e5f67890.json
$filepath = __DIR__ . '/' . $random_filename;

// Сохраним данные в файл в формате JSON
if (file_put_contents($filepath, json_encode($data, JSON_PRETTY_PRINT))) {
    // Если сохранение прошло успешно
    echo json_encode([
        'success' => true,
        'message' => 'Данные успешно сохранены.',
        'filename' => $random_filename
    ]);
} else {
    // Ошибка при сохранении
    http_response_code(500); // Internal Server Error
    echo json_encode(['error' => 'Не удалось сохранить данные в файл.']);
}