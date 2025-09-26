import random
import string

def generate_random_filename(length=10, extension='.py'):
    """Генерирует случайное имя файла."""
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for i in range(length)) + extension

def hello_world_function():
    """Функция, которая выводит 'Привет, мир!'."""
    print('Привет, мир!')

# Генерация случайного имени файла
random_filename = generate_random_filename()

# Запись функции в файл
with open(random_filename, 'w', encoding='utf-8') as f:
    f.write('''def hello_world_function():
    print('Привет, мир!')

# Вызов функции
hello_world_function()
''')

print(f'Файл создан: {random_filename}')