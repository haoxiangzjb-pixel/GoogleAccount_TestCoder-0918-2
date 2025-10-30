import std/strutils
import std/random
import std/os

# Función para generar un nombre de archivo aleatorio
proc generateRandomFileName(): string =
  result = ""
  for i in 0..7:
    let randomChar = chr(rand(25) + ord('a'))
    result.add(randomChar)

# Función para formatear un nombre completo
proc formatFullName(firstName, lastName: string): string =
  result = capitalizeAscii(firstName) & " " & capitalizeAscii(lastName)

# Ejemplo de uso
let firstName = "juan"
let lastName = "pérez"
let fullName = formatFullName(firstName, lastName)

# Generar un nombre de archivo aleatorio
let fileName = generateRandomFileName() & ".txt"

# Guardar el nombre formateado en el archivo
writeFile(fileName, fullName)

echo "Nombre completo formateado: ", fullName
echo "Guardado en archivo: ", fileName