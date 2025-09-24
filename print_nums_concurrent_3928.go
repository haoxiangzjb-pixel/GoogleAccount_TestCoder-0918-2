package main

import (
	"fmt"
)

func printNumber(num int) {
	fmt.Println(num)
}

func main() {
	for i := 1; i <= 10; i++ {
		go printNumber(i)
	}

	// 简单的等待，确保所有goroutine完成
	// 在实际项目中，应使用 sync.WaitGroup
	for i := 0; i < 1000; i++ {
		// 空循环，让出时间片给其他goroutine
	}
}