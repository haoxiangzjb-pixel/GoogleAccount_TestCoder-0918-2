/// Структура пользователя с полями имя и возраст
pub struct User {
    pub name: String,
    pub age: u32,
}

impl User {
    /// Создает нового пользователя с заданными параметрами
    pub fn new(name: String, age: u32) -> Self {
        User { name, age }
    }
}