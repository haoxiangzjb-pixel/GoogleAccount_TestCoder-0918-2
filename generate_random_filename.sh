#!/bin/bash

# Генерируем случайную строку из 12 символов
RANDOM_STRING=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 12 | head -n 1)

# Создаем имя файла с расширением .php
RANDOM_FILENAME="${RANDOM_STRING}.php"

# Выводим имя файла в stdout
echo $RANDOM_FILENAME