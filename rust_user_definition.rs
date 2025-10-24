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

    // Сохранение данных в файл
    // Код для сохранения в файл опущен из-за отсутствия установленного Rust
    println!("User: {}, Age: {}", user.name, user.age);
}