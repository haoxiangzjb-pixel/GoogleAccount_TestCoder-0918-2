package main

import (
	"fmt"
	"time"
)

func printNumber(num int) {
	fmt.Println(num)
}

func main() {
	// 启动10个协程，每个打印一个数字
	for i := 1; i <= 10; i++ {
		go printNumber(i)
	}
	
	// 等待所有协程完成
	time.Sleep(100 * time.Millisecond)
}