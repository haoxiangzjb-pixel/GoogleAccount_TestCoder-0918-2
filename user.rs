// Rust структура пользователя с полями имя и возраст
struct User {
    name: String,
    age: u32,
}

fn main() {
    // Создание экземпляра структуры
    let user = User {
        name: String::from("Alice"),
        age: 30,
    };
    
    println!("User created: {}, age {}", user.name, user.age);
}