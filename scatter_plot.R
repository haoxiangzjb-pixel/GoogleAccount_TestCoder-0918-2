# Генерация случайных данных
set.seed(42) # Для воспроизводимости результатов
n <- 100
x <- rnorm(n)
y <- rnorm(n)

# Генерация случайного имени файла
random_name <- paste0("scatter_plot_", sample(10000:99999, 1), ".png")

# Открытие устройства для сохранения графика
png(random_name, width = 800, height = 600)

# Построение диаграммы рассеяния
plot(x, y, main = "Scatter Plot", xlab = "X", ylab = "Y", pch = 19, col = "blue")

# Закрытие устройства
dev.off()

cat("График сохранен в файл:", random_name, "\n")