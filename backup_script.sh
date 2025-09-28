#!/bin/bash

# Функция для создания резервной копии файла
backup_file() {
    local source_file="$1"

    # Проверяем, был ли передан аргумент
    if [[ -z "$source_file" ]]; then
        echo "Ошибка: Не указан файл для резервного копирования."
        echo "Использование: $0 <путь_к_файлу>"
        exit 1
    fi

    # Проверяем, существует ли файл
    if [[ ! -f "$source_file" ]]; then
        echo "Ошибка: Файл '$source_file' не существует."
        exit 1
    fi

    # Генерируем случайное имя для резервной копии
    local backup_name
    backup_name=$(mktemp --suffix=.bak)

    # Копируем файл
    cp "$source_file" "$backup_name"

    # Выводим имя созданного файла резервной копии
    echo "Создана резервная копия: $backup_name"
}

# Вызываем функцию с первым аргументом командной строки
backup_file "$1"