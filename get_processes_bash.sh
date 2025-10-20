#!/bin/bash

# Получаем список процессов
processes=$(ps aux)

# Генерируем случайное имя файла
random_filename="processes_$(shuf -i 1-99999 -n 1).csv"

# Сохраняем список процессов в файл
echo "$processes" > "$random_filename"

echo "Список процессов сохранен в файл: $random_filename"