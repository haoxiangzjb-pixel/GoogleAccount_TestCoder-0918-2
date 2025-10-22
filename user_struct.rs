#[derive(Debug)]
struct User {
    name: String,
    age: u32,
}

fn main() {
    let user = User {
        name: String::from("Alice"),
        age: 30,
    };

    // Создаем случайное имя файла
    use std::fs::File;
    use std::io::Write;
    use std::time::{SystemTime, UNIX_EPOCH};
    
    let timestamp = SystemTime::now()
        .duration_since(UNIX_EPOCH)
        .unwrap()
        .as_nanos();
    let filename = format!("user_data_{}.txt", timestamp);
    
    // Записываем данные пользователя в файл
    let mut file = File::create(&filename).unwrap();
    writeln!(file, "Name: {}", user.name).unwrap();
    writeln!(file, "Age: {}", user.age).unwrap();
    
    println!("User data saved to file: {}", filename);
}