package main

import (
	"fmt"
)

func printNumber(start, end int) {
	for i := start; i <= end; i++ {
		fmt.Println(i)
	}
}

func main() {
	// Start a goroutine to print numbers 1 to 5
	go printNumber(1, 5)

	// Print numbers 6 to 10 from the main goroutine
	printNumber(6, 10)

	// A simple way to wait for the other goroutine to finish
	// In real applications, you might use sync.WaitGroup
	for i := 0; i < 1000; i++ {
		// Busy waiting for a short time
	}
}