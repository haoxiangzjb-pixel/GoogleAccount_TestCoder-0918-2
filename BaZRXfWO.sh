#!/bin/bash

# Проверяем, передан ли аргумент
if [ $# -ne 1 ]; then
  echo "Ошибка: Необходимо указать имя файла для резервного копирования."
  echo "Использование: $0 <имя_файла>"
  exit 1
fi

# Сохраняем имя файла из аргумента
ORIGINAL_FILE="$1"

# Проверяем, существует ли файл
if [ ! -f "$ORIGINAL_FILE" ]; then
  echo "Ошибка: Файл $ORIGINAL_FILE не существует."
  exit 1
fi

# Создаем имя файла резервной копии
BACKUP_FILE="${ORIGINAL_FILE}.bak"

# Копируем файл
cp "$ORIGINAL_FILE" "$BACKUP_FILE"

# Проверяем, была ли успешной операция копирования
if [ $? -eq 0 ]; then
  echo "Резервная копия файла $ORIGINAL_FILE успешно создана как $BACKUP_FILE"
else
  echo "Ошибка: Не удалось создать резервную копию файла $ORIGINAL_FILE"
  exit 1
fi