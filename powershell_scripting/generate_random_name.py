import random
import string

def generate_random_filename(extension="txt"):
    """Генерирует случайное имя файла с указанным расширением."""
    random_string = ''.join(random.choices(string.ascii_letters + string.digits, k=16))
    return f"{random_string}.{extension}"

if __name__ == "__main__":
    print(generate_random_filename("txt"))