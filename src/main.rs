use serde::{Serialize, Deserialize};
use std::fs::File;
use std::io::Write;
use rand::Rng;

#[derive(Serialize, Deserialize, Debug)]
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

    // Генерируем случайное имя файла
    let mut rng = rand::thread_rng();
    let random_filename = format!("user_data_{}.json", rng.gen::<u32>());
    
    // Сериализуем структуру в JSON и записываем в файл
    let json_data = serde_json::to_string(&user)?;
    let mut file = File::create(&random_filename)?;
    file.write_all(json_data.as_bytes())?;
    
    println!("Структура пользователя сохранена в файл: {}", random_filename);
    println!("Данные: {:?}", user);
    
    Ok(())
}