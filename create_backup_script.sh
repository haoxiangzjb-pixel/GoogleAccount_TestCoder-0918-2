#!/bin/bash

# Скрипт для создания скрипта резервного копирования с случайным именем

# Генерируем случайное имя для файла
RANDOM_NAME=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 10 | head -n 1)
SCRIPT_NAME="backup_script_${RANDOM_NAME}.sh"

# Создаем директорию для скриптов, если она не существует
mkdir -p /workspace/generated_scripts

# Создаем файл со случайным именем и помещаем в него скрипт резервного копирования
cat > "/workspace/generated_scripts/${SCRIPT_NAME}" << 'EOF'
#!/bin/bash

# Скрипт для создания резервной копии файла
# Использование: ./backup_script.sh <имя_файла>

# Проверяем, передан ли аргумент
if [ $# -eq 0 ]; then
    echo "Ошибка: Не указан файл для резервного копирования"
    echo "Использование: $0 <имя_файла>"
    exit 1
fi

# Проверяем, существует ли файл
if [ ! -f "$1" ]; then
    echo "Ошибка: Файл '$1' не найден"
    exit 1
fi

# Получаем имя файла и директорию
FILE="$1"
FILENAME=$(basename "$FILE")
DIRNAME=$(dirname "$FILE")

# Создаем имя для резервной копии с временной меткой
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_NAME="${FILENAME}_backup_${TIMESTAMP}"

# Создаем резервную копию
cp "$FILE" "${DIRNAME}/${BACKUP_NAME}"

# Проверяем успешность операции
if [ $? -eq 0 ]; then
    echo "Резервная копия создана: ${DIRNAME}/${BACKUP_NAME}"
else
    echo "Ошибка при создании резервной копии"
    exit 1
fi
EOF

# Делаем файл исполняемым
chmod +x "/workspace/generated_scripts/${SCRIPT_NAME}"

# Выводим информацию о созданном файле
echo "Скрипт резервного копирования создан: /workspace/generated_scripts/${SCRIPT_NAME}"