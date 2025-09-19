#!/bin/bash

# Генерируем случайное имя файла (8 символов)
RANDOM_NAME=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1)

# Добавляем расширение .fs
FILE_NAME="${RANDOM_NAME}.fs"

# Копируем программу в новый файл с случайным именем
cp /workspace/program.fs "/workspace/${FILE_NAME}"

echo "Программа сохранена в файл: ${FILE_NAME}"