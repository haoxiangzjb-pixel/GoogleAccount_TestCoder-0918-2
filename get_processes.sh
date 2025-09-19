#!/bin/bash

# Генерируем случайное имя файла
RANDOM_NAME=$(openssl rand -hex 8)
FILE_NAME="processes_${RANDOM_NAME}.txt"

# Получаем список процессов и сохраняем в файл
ps aux > "$FILE_NAME"

echo "Список процессов сохранен в файл: $FILE_NAME"