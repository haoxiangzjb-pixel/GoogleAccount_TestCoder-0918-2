import subprocess
import random
import string

# Генерация случайного имени файла
random_filename = "ProcessList_" + ''.join(random.choices(string.ascii_letters + string.digits, k=8)) + ".txt"

# Команда для получения списка процессов
command = "ps aux"

# Выполнение команды и запись результата в файл
with open(random_filename, 'w') as f:
    subprocess.run(command, shell=True, stdout=f)

print(f"Список процессов сохранен в файл: {random_filename}")