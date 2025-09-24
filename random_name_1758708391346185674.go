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

	// The main goroutine needs to wait a little bit for the spawned goroutine to finish.
	// In a real application, you would use channels or sync.WaitGroup for proper synchronization.
	// For simplicity here, we'll just print a message and let the program exit naturally after a short delay.
	fmt.Println("Goroutine started...")
}