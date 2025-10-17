import random
import string

def generate_random_filename():
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for i in range(10)) + '.py'

def hello_world():
    print('Привет, мир!')

filename = generate_random_filename()
with open(filename, 'w', encoding='utf-8') as f:
    f.write('def hello_world():\n    print("Привет, мир!")\n\nhello_world()\n')

print(f'Файл создан: {filename}')