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

	// Give the goroutine some time to finish before the main function exits
	// In a real application, you would use sync.WaitGroup or channels for synchronization
	// Here we use a simple sleep for demonstration
	// Note: importing "time" package is not required for the core logic, but if we needed precise control:
	// import "time"
	// time.Sleep(time.Millisecond * 100) // Sleep for 100 milliseconds

	// For this simple example, we assume the goroutine completes quickly.
	// A more idiomatic way would be to use channels or sync.WaitGroup.
	// Let's use a channel to wait for completion.
	done := make(chan bool)
	go func() {
		printNumbers(1, 10)
		done <- true
	}()

	<-done // Wait for the goroutine to finish
}