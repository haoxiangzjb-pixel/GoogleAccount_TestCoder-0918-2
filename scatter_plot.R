#!/usr/bin/env Rscript

# Загрузка библиотеки для генерации случайных чисел (необязательно, так как stats входит в базовую установку)
library(stats)

# Генерация случайных данных
set.seed(Sys.time()) # Для воспроизводимости при отладке, можно убрать
n <- 100
x <- rnorm(n)
y <- rnorm(n)

# Создание случайного имени файла для изображения
image_filename <- paste0("scatter_plot_", sample(10000:99999, 1), ".png")

# Открытие PNG устройства
png(filename = image_filename, width = 800, height = 600)

# Построение диаграммы рассеяния
plot(x, y, main = "Scatter Plot", xlab = "X-axis", ylab = "Y-axis", pch = 19, col = "blue")

# Закрытие PNG устройства
dev.off()

# Вывод имени созданного файла
cat("Scatter plot saved as:", image_filename, "\n")