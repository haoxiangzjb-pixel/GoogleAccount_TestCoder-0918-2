package main

import (
	"fmt"
	"math/rand"
	"time"
)

func printNumber(num int, ch chan bool) {
	// 模拟一些工作，让协程执行时间稍微错开，便于观察
	time.Sleep(time.Duration(rand.Intn(500)) * time.Millisecond)
	fmt.Println(num)
	ch <- true
}

func main() {
	// 创建一个通道，用于接收协程完成信号
	ch := make(chan bool, 10)

	// 启动10个协程
	for i := 1; i <= 10; i++ {
		go printNumber(i, ch)
	}

	// 等待所有协程完成
	for i := 1; i <= 10; i++ {
		<-ch
	}

	fmt.Println("All numbers printed.")
}