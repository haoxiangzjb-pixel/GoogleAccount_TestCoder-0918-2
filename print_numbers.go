package main

import (
	"fmt"
	"sync"
)

func main() {
	var wg sync.WaitGroup
	
	// Print numbers 1 to 10 using goroutines
	for i := 1; i <= 10; i++ {
		wg.Add(1)
		go func(num int) {
			defer wg.Done()
			fmt.Println(num)
		}(i)
	}
	
	// Wait for all goroutines to finish
	wg.Wait()
}