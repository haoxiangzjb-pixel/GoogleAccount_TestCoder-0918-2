// Структура пользователя с полями имени и возраста
struct User {
    name: String,
    age: u32,
}

fn main() {
    // Пример создания экземпляра структуры
    let user = User {
        name: String::from("Иван"),
        age: 30,
    };
    
    println!("Имя: {}, Возраст: {}", user.name, user.age);
}