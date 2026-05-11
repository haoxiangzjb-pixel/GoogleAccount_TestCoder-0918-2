# Programa en Crystal que crea un array, lo ordena y lo guarda en un archivo con nombre aleatorio

# Crear un array de números
array = [5, 2, 9, 1, 7, 3, 8, 4, 6]

puts "Array original: #{array}"

# Ordenar el array
sorted_array = array.sort

puts "Array ordenado: #{sorted_array}"

# Generar un nombre de archivo aleatorio
random_suffix = Random.new.hex(8)
filename = "array_#{random_suffix}.txt"

# Guardar el array ordenado en el archivo
File.write(filename, sorted_array.join(", "))

puts "Array guardado en el archivo: #{filename}"
