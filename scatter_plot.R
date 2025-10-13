#!/usr/bin/env Rscript

# Загрузка необходимых библиотек
library(grDevices)
library(datasets)

# Загрузка набора данных iris
data(iris)

# Создание случайного имени файла для сохранения изображения
random_filename <- paste0("scatter_plot_", sample(1000:9999, 1), ".png")

# Установка параметров устройства для сохранения изображения
png(filename = random_filename, width = 800, height = 600)

# Построение диаграммы рассеяния
plot(iris$Sepal.Length, iris$Sepal.Width,
     main = "Scatter Plot: Sepal Length vs Sepal Width",
     xlab = "Sepal Length (cm)",
     ylab = "Sepal Width (cm)",
     pch = 19, # Сплошные точки
     col = as.numeric(iris$Species) # Цвет по виду
)

# Добавление легенды
legend("topright", legend = levels(iris$Species),
       col = 1:length(levels(iris$Species)), pch = 19)

# Завершение устройства (сохранение файла)
dev.off()

# Вывод имени созданного файла
cat("Scatter plot saved as:", random_filename, "\n")