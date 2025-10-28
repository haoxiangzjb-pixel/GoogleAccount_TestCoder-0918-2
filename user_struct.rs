// Определение структуры пользователя
struct User {
    name: String,
    age: u32,
}

// Пример использования структуры и сохранения в файл
// (код ниже демонстрирует, как это будет выглядеть в Rust-приложении)
/*
use std::fs::File;
use std::io::Write;
use serde::{Serialize, Deserialize};

#[derive(Serialize, Deserialize)]
struct User {
    name: String,
    age: u32,
}

fn main() -> std::io::Result<()> {
    // Создаем экземпляр структуры User
    let user = User {
        name: String::from("Иван"),
        age: 30,
    };

    // Генерируем случайное имя файла (в реальном приложении использовалась бы библиотека rand)
    let random_filename = format!("user_data_{}.json", rand::random::<u32>());
    
    // Сериализуем структуру в JSON и записываем в файл
    let json_data = serde_json::to_string(&user)?;
    let mut file = File::create(&random_filename)?;
    file.write_all(json_data.as_bytes())?;
    
    println!("Структура пользователя сохранена в файл: {}", random_filename);
    
    Ok(())
}
*/

// Просто создаем экземпляр структуры для демонстрации
fn main() {
    let user = User {
        name: String::from("Иван"),
        age: 30,
    };
    
    println!("Создан пользователь: {}, возраст: {}", user.name, user.age);
}