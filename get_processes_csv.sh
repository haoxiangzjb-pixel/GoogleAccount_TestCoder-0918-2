#!/bin/bash

# Получаем список процессов в формате, похожем на CSV
processes=$(ps -eo user,pid,ppid,pcpu,pmem,vsz,rss,tty,stat,start,time,comm --no-headers)

# Генерируем случайное имя файла
random_filename="processes_$(shuf -i 1-99999 -n 1).csv"

# Добавляем заголовки, чтобы файл был в формате CSV
echo "USER,PID,PPID,CPU,Memory,VSZ,RSS,TTY,STAT,START,TIME,COMMAND" > "$random_filename"
echo "$processes" >> "$random_filename"

echo "Список процессов сохранен в файл: $random_filename"