// Структура пользователя с полями имя и возраст
#[derive(Debug)]
pub struct User {
    pub name: String,
    pub age: u32,
}

impl User {
    // Конструктор для удобного создания экземпляров
    pub fn new(name: String, age: u32) -> Self {
        User { name, age }
    }
}