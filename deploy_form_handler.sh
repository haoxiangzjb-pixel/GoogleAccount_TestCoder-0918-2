#!/bin/bash

# Путь к файлам
TEMPLATE_FILE="/workspace/form_handler_template.php"
DEPLOY_SCRIPT=$(realpath "$0")
DEPLOY_DIR=$(dirname "$DEPLOY_SCRIPT")

echo "Текущая директория: $DEPLOY_DIR"
echo "Путь к шаблону: $TEMPLATE_FILE"

# Проверяем, существует ли файл шаблона
if [ ! -f "$TEMPLATE_FILE" ]; then
    echo "Ошибка: Файл шаблона $TEMPLATE_FILE не найден."
    exit 1
fi

# Генерируем случайное имя файла с помощью нашего скрипта
RANDOM_FILENAME=$(/workspace/generate_random_filename.sh)

if [ -z "$RANDOM_FILENAME" ]; then
    echo "Ошибка: Не удалось сгенерировать имя файла."
    exit 1
fi

OUTPUT_FILE="$DEPLOY_DIR/$RANDOM_FILENAME"

echo "Генерируемый файл: $OUTPUT_FILE"

# Копируем содержимое шаблона в новый файл
cp "$TEMPLATE_FILE" "$OUTPUT_FILE"

# Проверяем успешность копирования
if [ $? -eq 0 ]; then
    echo "Скрипт успешно создан: $OUTPUT_FILE"
    
    # Делаем файл исполняемым (на случай, если потребуется)
    chmod +x "$OUTPUT_FILE"
    
    echo "Файл сделан исполняемым."
else
    echo "Ошибка: Не удалось создать файл $OUTPUT_FILE"
    exit 1
fi