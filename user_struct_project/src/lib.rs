/// Структура, представляющая пользователя.
#[derive(Debug)]
pub struct User {
    /// Имя пользователя.
    pub name: String,
    /// Возраст пользователя.
    pub age: u32,
}

// Пример использования
fn main() {
    let user = User {
        name: "Alice".to_string(),
        age: 30,
    };

    println!("Пользователь: {:?}", user);
}