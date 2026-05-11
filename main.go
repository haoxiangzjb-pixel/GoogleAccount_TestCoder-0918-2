package main

import (
	"fmt"
	"math/rand"
	"os"
	"strings"
	"time"
)

func producer(ch chan<- string, id int) {
	for i := 0; i < 5; i++ {
		msg := fmt.Sprintf("Goroutine %d: mensagem %d", id, i+1)
		ch <- msg
		time.Sleep(time.Millisecond * 100)
	}
}

func worker(ch <-chan string, results chan<- string) {
	for msg := range ch {
		processed := strings.ToUpper(msg)
		results <- processed
	}
	close(results)
}

func generateRandomName() string {
	rand.Seed(time.Now().UnixNano())
	const charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
	result := make([]byte, 8)
	for i := range result {
		result[i] = charset[rand.Intn(len(charset))]
	}
	return fmt.Sprintf("%s.txt", string(result))
}

func main() {
	ch := make(chan string)
	results := make(chan string)

	// Inicia múltiplas goroutines produtoras
	for i := 1; i <= 3; i++ {
		go producer(ch, i)
	}

	// Inicia o worker que processa as mensagens
	go worker(ch, results)

	// Coleta todos os resultados
	var allResults []string
	go func() {
		for result := range results {
			allResults = append(allResults, result)
			fmt.Println(result)
		}
	}()

	// Aguarda um pouco para garantir que todas as mensagens sejam processadas
	time.Sleep(time.Second * 2)

	// Gera nome aleatório para o arquivo
	filename := generateRandomName()

	// Prepara o conteúdo do arquivo
	var content strings.Builder
	content.WriteString("Resultados da comunicação entre goroutines:\n\n")
	for _, result := range allResults {
		content.WriteString(result + "\n")
	}

	// Salva no arquivo com nome aleatório
	err := os.WriteFile(filename, []byte(content.String()), 0644)
	if err != nil {
		fmt.Printf("Erro ao salvar arquivo: %v\n", err)
		return
	}

	fmt.Printf("\nArquivo salvo com sucesso: %s\n", filename)
}
