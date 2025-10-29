import random
import time
import os

# Определяем класс User с полями имя и возраст
class User:
    def __init__(self, name, age):
        self.name = name
        self.age = age
    
    def __repr__(self):
        return f"User(name='{self.name}', age={self.age})"

# Создаем экземпляр класса User
user = User("Алексей", 30)

# Генерируем случайное имя файла с использованием текущего времени и случайного числа
now = int(time.time())
random_suffix = random.randint(1000, 9999)
filename = f"user_data_{now}_{random_suffix}.txt"

# Сохраняем данные пользователя в файл
with open(filename, 'w', encoding='utf-8') as file:
    file.write(f"Имя: {user.name}\n")
    file.write(f"Возраст: {user.age}\n")

print(f"Данные пользователя сохранены в файл: {filename}")
print(f"Класс User: {user}")

# Выводим содержимое созданного файла для проверки
print("\nСодержимое файла:")
with open(filename, 'r', encoding='utf-8') as file:
    print(file.read())