// Определение структуры пользователя с полями имя и возраст
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
    
    /// Сохраняет данные пользователя в файл со случайным именем
    /// 
    /// Обратите внимание: этот код будет работать только при наличии установленного Rust
    /// и соответствующих зависимостей. В текущей реализации он показывает, как бы выглядел
    /// код сохранения в файл.
    #[cfg(feature = "save_to_file")]
    pub fn save_to_random_file(&self) -> std::io::Result<String> {
        use std::fs::File;
        use std::io::Write;
        use std::time::{SystemTime, UNIX_EPOCH};
        
        let now = SystemTime::now()
            .duration_since(UNIX_EPOCH)
            .expect("Time went backwards");
        let filename = format!("user_data_{}.txt", now.as_secs());

        let mut file = File::create(&filename)?;
        writeln!(file, "Name: {}", self.name)?;
        writeln!(file, "Age: {}", self.age)?;

        Ok(filename)
    }
}

// Пример использования структуры
fn main() {
    let user = User::new("Bob Johnson".to_string(), 35);
    
    println!("Создан пользователь: {}, возраст: {}", user.name, user.age);
    
    // Если бы Rust был установлен, можно было бы вызвать:
    // if let Ok(filename) = user.save_to_random_file() {
    //     println!("Данные пользователя сохранены в файл: {}", filename);
    // }
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