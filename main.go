package main

import (
	"fmt"
	"math/rand"
	"os"
	"time"
)

func worker(id int, jobs <-chan int, results chan<- string) {
	for job := range jobs {
		result := fmt.Sprintf("Goroutine %d processou o trabalho %d", id, job)
		results <- result
	}
}

func generateRandomFilename() string {
	rand.Seed(time.Now().UnixNano())
	const charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
	name := make([]byte, 10)
	for i := range name {
		name[i] = charset[rand.Intn(len(charset))]
	}
	return fmt.Sprintf("output_%s.txt", string(name))
}

func main() {
	const numJobs = 5
	jobs := make(chan int, numJobs)
	results := make(chan string, numJobs)

	// Inicia 3 workers
	for w := 1; w <= 3; w++ {
		go worker(w, jobs, results)
	}

	// Envia trabalhos
	for j := 1; j <= numJobs; j++ {
		jobs <- j
	}
	close(jobs)

	// Coleta resultados
	var output string
	for i := 1; i <= numJobs; i++ {
		result := <-results
		output += result + "\n"
		fmt.Println(result)
	}

	// Gera nome aleatório para o arquivo
	filename := generateRandomFilename()

	// Salva em arquivo
	err := os.WriteFile(filename, []byte(output), 0644)
	if err != nil {
		fmt.Fprintf(os.Stderr, "Erro ao salvar arquivo: %v\n", err)
		os.Exit(1)
	}

	fmt.Printf("\nResultados salvos em: %s\n", filename)
}
