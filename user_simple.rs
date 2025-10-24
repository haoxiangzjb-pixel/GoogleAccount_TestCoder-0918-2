use std::fs::File;
use std::io::Write;
use std::time::{SystemTime, UNIX_EPOCH};

// Структура пользователя с полями имя и возраст
struct User {
    name: String,
    age: u32,
}

fn main() {
    let user = User {
        name: String::from("John Doe"),
        age: 30,
    };

    // Генерация случайного имени файла на основе текущего времени
    let now = SystemTime::now()
        .duration_since(UNIX_EPOCH)
        .expect("Time went backwards");
    let filename = format!("user_data_{}.txt", now.as_secs());

    // Формируем строку с данными пользователя
    let user_data = format!("Name: {}\nAge: {}", user.name, user.age);

    let mut file = File::create(&filename).expect("Unable to create file");
    file.write_all(user_data.as_bytes()).expect("Unable to write data");

    println!("User data saved to file: {}", filename);
}