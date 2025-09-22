#!/bin/bash

# Генерируем случайное имя файла
randomFileName="processes_$(date +%s%N).txt"

# Получаем список процессов и сохраняем в файл
ps aux > "$randomFileName"

# Выводим сообщение о завершении
echo "Список процессов сохранен в файл: $randomFileName"