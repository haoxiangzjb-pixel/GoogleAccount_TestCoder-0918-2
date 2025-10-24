#!/bin/bash

# Скрипт для создания файла с данными пользователя со случайным именем

# Генерация случайного имени файла на основе текущего времени
filename="user_data_$(date +%s%N | cut -c1-13).txt"

# Запись данных пользователя в файл
echo "Name: Jane Doe" > "$filename"
echo "Age: 28" >> "$filename"

echo "User data saved to file: $filename"