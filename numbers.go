package main

import (
	"fmt"
	"time"
)

func printNumbers(start, end int, delay time.Duration) {
	for i := start; i <= end; i++ {
		fmt.Println(i)
		time.Sleep(delay)
	}
}

func main() {
	// Start a goroutine to print numbers 1 to 10 with a small delay
	go printNumbers(1, 10, 100*time.Millisecond)

	// Give the goroutine some time to finish before the main function exits
	time.Sleep(2 * time.Second)
}