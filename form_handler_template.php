<?php
// Проверяем, была ли форма отправлена методом POST
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Получаем данные из формы
    $name = htmlspecialchars($_POST['name'] ?? '');
    $email = htmlspecialchars($_POST['email'] ?? '');
    $message = htmlspecialchars($_POST['message'] ?? '');
    
    // Простая валидация
    if (empty($name) || empty($email) || empty($message)) {
        http_response_code(400); // Устанавливаем код ответа 400 Bad Request
        echo json_encode(["status" => "error", "message" => "Пожалуйста, заполните все поля формы."]);
    } else {
        // Подготавливаем данные для сохранения
        $data = [
            "timestamp" => date("Y-m-d H:i:s"),
            "name" => $name,
            "email" => $email,
            "message" => $message
        ];
        
        // Кодируем данные в JSON
        $jsonData = json_encode($data, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);
        
        // Генерируем имя файла для сохранения данных
        $dataFilename = "form_submission_" . date("YmdHis") . ".json";
        
        // Сохраняем данные в файл
        if (file_put_contents($dataFilename, $jsonData)) {
            // Возвращаем успешный ответ
            echo json_encode([
                "status" => "success", 
                "message" => "Форма успешно отправлена!",
                "data_file" => $dataFilename
            ]);
        } else {
            // Возвращаем ошибку, если не удалось сохранить файл
            http_response_code(500); // Internal Server Error
            echo json_encode(["status" => "error", "message" => "Ошибка при сохранении данных."]);
        }
    }
} else {
    // Если запрос не POST, возвращаем ошибку
    http_response_code(405); // Method Not Allowed
    echo json_encode(["status" => "error", "message" => "Метод не разрешен. Используйте POST."]);
}
?>