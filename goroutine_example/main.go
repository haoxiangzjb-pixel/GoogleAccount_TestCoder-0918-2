package main

import (
	"fmt"
	"sync"
)

func printNumbers(wg *sync.WaitGroup, start, end int) {
	defer wg.Done()
	for i := start; i <= end; i++ {
		fmt.Println(i)
	}
}

func main() {
	var wg sync.WaitGroup

	// 启动一个协程打印1-5
	wg.Add(1)
	go printNumbers(&wg, 1, 5)

	// 启动另一个协程打印6-10
	wg.Add(1)
	go printNumbers(&wg, 6, 10)

	// 等待所有协程完成
	wg.Wait()
}