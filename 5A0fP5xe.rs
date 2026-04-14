use std::fs;
use std::io::{self, Write};

// Структура пользователя с полями имя и возраст
#[derive(Debug, serde::Serialize, serde::Deserialize)]
struct User {
    name: String,
    age: u32,
}

fn generate_random_filename() -> String {
    use std::time::{SystemTime, UNIX_EPOCH};
    let timestamp = SystemTime::now()
        .duration_since(UNIX_EPOCH)
        .unwrap()
        .as_nanos();
    format!("user_{}.json", timestamp)
}

fn main() -> io::Result<()> {
    // Создаем экземпляр пользователя
    let user = User {
        name: String::from("Иван"),
        age: 30,
    };

    // Генерируем случайное имя файла
    let filename = generate_random_filename();

    // Сериализуем структуру в JSON
    let json = serde_json::to_string_pretty(&user).unwrap();

    // Сохраняем в файл
    let mut file = fs::File::create(&filename)?;
    file.write_all(json.as_bytes())?;

    println!("Пользователь сохранен в файл: {}", filename);
    println!("Содержимое: {}", json);

    Ok(())
}
