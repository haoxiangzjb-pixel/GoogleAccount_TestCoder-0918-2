# Función para calcular la desviación estándar
calcular_desviacion_estandar <- function(vector) {
  # Verificar que la entrada sea numérica
  if (!is.numeric(vector)) {
    stop("La entrada debe ser un vector numérico")
  }
  
  # Calcular la media
  media <- mean(vector)
  
  # Calcular la varianza (suma de cuadrados de las diferencias dividido por n-1)
  n <- length(vector)
  if (n < 2) {
    stop("Se necesitan al menos 2 valores para calcular la desviación estándar")
  }
  
  varianza <- sum((vector - media)^2) / (n - 1)
  
  # Calcular la desviación estándar
  desviacion <- sqrt(varianza)
  
  return(desviacion)
}

# Ejemplo de uso:
# datos <- c(10, 15, 20, 25, 30)
# resultado <- calcular_desviacion_estandar(datos)
# print(paste("Desviación estándar:", resultado))
