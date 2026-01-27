#!/bin/bash

# Função para verificar se um número é par
verificar_par() {
    local numero=$1
    
    # Verifica se o argumento foi fornecido
    if [ -z "$numero" ]; then
        echo "Erro: Por favor, informe um número como argumento."
        return 1
    fi
    
    # Verifica se é um número válido
    if ! [[ "$numero" =~ ^-?[0-9]+$ ]]; then
        echo "Erro: '$numero' não é um número válido."
        return 1
    fi
    
    # Verifica se é par (resto da divisão por 2 é zero)
    if [ $((numero % 2)) -eq 0 ]; then
        echo "$numero é PAR"
        return 0
    else
        echo "$numero é ÍMPAR"
        return 1
    fi
}

# Chama a função com o primeiro argumento passado para o script
verificar_par "$1"