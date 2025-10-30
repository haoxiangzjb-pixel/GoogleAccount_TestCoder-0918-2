package main

import (
	"fmt"
)

func main() {
	// Crear un slice vacío
	mySlice := []int{}

	// Agregar elementos al slice
	mySlice = append(mySlice, 1)
	mySlice = append(mySlice, 2)
	mySlice = append(mySlice, 3)

	// Agregar múltiples elementos de una vez
	mySlice = append(mySlice, 4, 5, 6)

	// Mostrar el slice resultante
	fmt.Println("Slice resultante:", mySlice)
}