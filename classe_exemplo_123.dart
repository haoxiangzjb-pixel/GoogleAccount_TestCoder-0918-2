class Pessoa {
  String nome;
  int idade;
  String? endereco; // campo opcional

  // Construtor nomeado padrão
  Pessoa({required this.nome, required this.idade, this.endereco});

  // Construtor nomeado adicional
  Pessoa.nomeCompleto(this.nome, this.idade) {
    this.endereco = "Não informado";
  }

  // Método para exibir informações
  void exibirInfo() {
    print("Nome: $nome");
    print("Idade: $idade");
    print("Endereço: ${endereco ?? "Não informado"}");
  }
}

// Exemplo de uso
void main() {
  // Usando o construtor nomeado padrão
  var pessoa1 = Pessoa(nome: "João Silva", idade: 30, endereco: "Rua A, 123");
  
  // Usando o construtor nomeado adicional
  var pessoa2 = Pessoa.nomeCompleto("Maria Oliveira", 25);
  
  print("Pessoa 1:");
  pessoa1.exibirInfo();
  
  print("\nPessoa 2:");
  pessoa2.exibirInfo();
}