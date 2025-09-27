import os
import random
import string

def generate_random_filename(length=10, extension='.py'):
    letters = string.ascii_lowercase + string.digits
    return ''.join(random.choice(letters) for _ in range(length)) + extension

random_filename = generate_random_filename()

with open(random_filename, 'w', encoding='utf-8') as f:
    f.write("def print_hello():\n    print('Привет, мир!')\n\nprint_hello()\n")

print(f"Файл создан: {random_filename}")