#!/bin/bash

# Генерируем случайное имя файла
RANDOM_FILENAME="processes_$(date +%s%N).txt"

# Получаем список процессов и сохраняем его в файл
ps aux > "$RANDOM_FILENAME"

echo "Список процессов сохранен в файл: $RANDOM_FILENAME"