import random
import string

# Генерация случайного имени файла
random_suffix = ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))
filename = f"db_config_{random_suffix}.ini"

# Содержимое файла конфигурации
config_content = """[database]
host = localhost
port = 5432
username = myuser
password = mypassword
database_name = mydatabase
ssl_mode = require
connection_timeout = 30
"""

# Запись содержимого в файл
with open(filename, 'w') as f:
    f.write(config_content)

print(f"Файл конфигурации создан: {filename}")