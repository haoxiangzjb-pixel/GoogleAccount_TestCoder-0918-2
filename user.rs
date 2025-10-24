/// Структура пользователя с полями имя и возраст
pub struct User {
    /// Имя пользователя
    pub name: String,
    /// Возраст пользователя
    pub age: u32,
}

impl User {
    /// Создает нового пользователя с заданными параметрами
    pub fn new(name: String, age: u32) -> Self {
        User { name, age }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_user_creation() {
        let user = User::new("John Doe".to_string(), 30);
        assert_eq!(user.name, "John Doe");
        assert_eq!(user.age, 30);
    }
}