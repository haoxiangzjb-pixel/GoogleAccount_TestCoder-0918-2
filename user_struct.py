import json
import random
import string

# Определение класса, аналогичного структуре User в Rust
class User:
    def __init__(self, name, age):
        self.name = name
        self.age = age

# Создание экземпляра класса User
user = User("Алексей", 30)

# Генерация случайного имени файла
random_filename = "user_data_" + ''.join(random.choices(string.ascii_letters + string.digits, k=10)) + ".txt"

# Сохранение данных в файл в формате JSON
with open(random_filename, 'w', encoding='utf-8') as f:
    json.dump({"name": user.name, "age": user.age}, f, ensure_ascii=False, indent=4)

print(f"Структура User сохранена в файл: {random_filename}")
print(f"Данные: имя - {user.name}, возраст - {user.age}")