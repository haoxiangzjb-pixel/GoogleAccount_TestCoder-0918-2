import random
import string

def generate_random_filename(ext='.py'):
    name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f'{name}{ext}'

def hello_function():
    print('Привет, мир!')

filename = generate_random_filename()
with open(filename, 'w', encoding='utf-8') as f:
    f.write('def hello_function():\n    print(\"Привет, мир!\")\n\n# Вызов функции\nhello_function()\n')

print(f'Файл создан: {filename}')