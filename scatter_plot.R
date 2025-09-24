#!/usr/bin/env Rscript

# Загрузка библиотеки для генерации случайных строк (опционально, можно вручную сгенерировать имя)
# install.packages("stringi") # раскомментируйте, если пакет не установлен и нужен
library(stats)

# Генерация случайных данных
set.seed(42) # Для воспроизводимости
n <- 100
x <- rnorm(n)
y <- x + rnorm(n, sd = 0.5) # y зависит от x с небольшим шумом

# Создание случайного имени файла
# random_name <- paste0(tempfile(pattern = "scatter_", tmpdir = getwd()), ".png")
# Или просто используем фиксированное случайное имя для примера
random_name <- tempfile(pattern = "plot_", tmpdir = getwd(), fileext = ".png")

# Сохранение графика в файл
png(filename = random_name, width = 800, height = 600)
plot(x, y, main = "Scatter Plot", xlab = "X", ylab = "Y", pch = 19, col = "blue")
abline(lm(y ~ x), col = "red") # Добавляем линию регрессии
dev.off()

cat("График сохранен в файл:", random_name, "\n")