#!/bin/bash

# Генерация случайного имени файла
RANDOM_NAME=$(openssl rand -hex 8).txt
OUTPUT_FILE="/workspace/$RANDOM_NAME"

# Получение списка процессов и сохранение в файл
ps aux > "$OUTPUT_FILE"

echo "Список процессов (аналог Get-Process) сохранен в файл: $OUTPUT_FILE"