import tempfile
import os

def print_hello():
    print('Привет, мир!')

# Создаем временный файл с случайным именем
with tempfile.NamedTemporaryFile(mode='w', suffix='.py', delete=False, dir='/workspace') as temp_file:
    temp_file.write("def print_hello():\n    print('Привет, мир!')\n\n# Вызов функции для демонстрации\nprint_hello()\n")
    temp_filename = temp_file.name

print(f"Функция сохранена в файл: {temp_filename}")