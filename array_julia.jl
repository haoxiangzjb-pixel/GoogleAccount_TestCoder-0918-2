# Script Julia para criar array multidimensional e salvar em arquivo com nome aleatório
# Para executar: julia array_julia.jl

using Random

# Criar um array multidimensional (3x4x2) com números aleatórios
array_multidimensional = rand(3, 4, 2)

println("Array multidimensional criado:")
println(array_multidimensional)
println("Dimensões: ", size(array_multidimensional))

# Gerar nome aleatório para o arquivo
nome_aleatorio = randstring(8)
nome_arquivo = "array_" * nome_aleatorio * ".txt"

# Salvar o array em um arquivo de texto
open(nome_arquivo, "w") do f
    for i in 1:size(array_multidimensional, 3)
        write(f, "Camada $i:\n")
        for j in 1:size(array_multidimensional, 1)
            linha = join([string(array_multidimensional[j, k, i]) for k in 1:size(array_multidimensional, 2)], "\t")
            write(f, linha * "\n")
        end
        write(f, "\n")
    end
end

println("\nArray salvo no arquivo: ", nome_arquivo)
