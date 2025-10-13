use rand::{distributions::Alphanumeric, Rng};
use serde::{Deserialize, Serialize};
use std::fs::File;
use std::io::Write;

#[derive(Serialize, Deserialize, Debug)]
pub struct User {
    pub name: String,
    pub age: u32,
}

impl User {
    pub fn new(name: String, age: u32) -> Self {
        User { name, age }
    }
}

fn main() {
    // Создаем экземпляр пользователя
    let user = User::new("Alice".to_string(), 30);

    // Генерируем случайное имя файла
    let random_filename = format!(
        "user_info_{}.json",
        rand::thread_rng()
            .sample_iter(&Alphanumeric)
            .take(10)
            .map(char::from)
            .collect::<String>()
    );

    // Сериализуем в JSON и записываем в файл
    let json_string = serde_json::to_string(&user).expect("Serialization failed");
    let mut file = File::create(&random_filename).expect("File creation failed");
    file.write_all(json_string.as_bytes()).expect("Write failed");

    println!("User data saved to file: {}", random_filename);
}