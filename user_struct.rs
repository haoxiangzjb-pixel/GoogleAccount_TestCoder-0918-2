use std::fs::File;
use std::io::Write;
use serde::{Serialize, Deserialize};
use rand::Rng;

// Определение структуры User
#[derive(Debug, Serialize, Deserialize)]
struct User {
    name: String,
    age: u32,
}

fn main() {
    // Создание экземпляра структуры User
    let user = User {
        name: String::from("Алексей"),
        age: 30,
    };

    // Генерация случайного имени файла
    let mut rng = rand::thread_rng();
    let random_number = rng.gen::<u32>();
    let filename = format!("user_data_{}.txt", random_number);

    // Сохранение данных в файл
    let serialized_user = serde_json::to_string(&user).unwrap();
    let mut file = File::create(&filename).unwrap();
    file.write_all(serialized_user.as_bytes()).unwrap();

    println!("Структура User сохранена в файл: {}", filename);
    println!("Данные: {:?}", user);
}