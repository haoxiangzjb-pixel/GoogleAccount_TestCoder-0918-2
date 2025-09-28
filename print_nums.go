package main

import (
	"fmt"
)

func printNumbers(start, end int) {
	for i := start; i <= end; i++ {
		fmt.Println(i)
	}
}

func main() {
	// Start a goroutine to print numbers 1 to 10
	go printNumbers(1, 10)

	// Give the goroutine time to finish before the main function exits
	// In a real application, you might use channels or sync.WaitGroup for synchronization
	// Here, a simple sleep is enough for demonstration.
	// However, for a simple print task like this, we can just call the function directly.
	// For the purpose of this exercise, we will call the function directly to ensure output.
	printNumbers(1, 10)
}