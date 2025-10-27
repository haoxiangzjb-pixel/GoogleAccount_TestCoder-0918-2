package main

import (
	"fmt"
	"io"
	"net/http"
	"time"
)

func main() {
	// Запускаем сервер в отдельной горутине
	go func() {
		// Импортируем функции из основного файла сервера
		http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
			fmt.Fprintf(w, "Hello")
		})
		fmt.Println("Server starting on :8080")
		http.ListenAndServe(":8080", nil)
	}()

	// Ждем немного, чтобы сервер успел запуститься
	time.Sleep(2 * time.Second)

	// Делаем HTTP-запрос к серверу
	resp, err := http.Get("http://localhost:8080")
	if err != nil {
		fmt.Printf("Error making request: %v\n", err)
		return
	}
	defer resp.Body.Close()

	body, err := io.ReadAll(resp.Body)
	if err != nil {
		fmt.Printf("Error reading response: %v\n", err)
		return
	}

	fmt.Printf("Response: %s\n", string(body))
}