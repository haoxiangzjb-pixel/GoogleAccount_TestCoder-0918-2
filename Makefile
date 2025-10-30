# Definir la variable para el nombre del ejecutable
EXECUTABLE_NAME := my_program

# Generar un nombre aleatorio para el archivo
RANDOM_FILE := $(shell mktemp --suffix=.txt)

# Meta por defecto
all: random_file

# Meta para crear el archivo con nombre aleatorio
random_file:
	@echo $(EXECUTABLE_NAME) > $(RANDOM_FILE)
	@echo "Nombre del ejecutable guardado en: $(RANDOM_FILE)"

# Limpiar - eliminar el archivo aleatorio generado
clean:
	@rm -f $(RANDOM_FILE)
	@echo "Archivo aleatorio eliminado"

.PHONY: all random_file clean