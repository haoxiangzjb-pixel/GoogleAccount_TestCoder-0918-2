use std::fs::File;
use std::io::Write;
use std::process::Command;
use rand::Rng;

// Definindo um enum com diferentes variantes
#[derive(Debug)]
enum Mensagem {
    Texto(String),
    Numero(i32),
    Booleano(bool),
    Vazio,
}

impl Mensagem {
    // Método que usa match para lidar com diferentes valores do enum
    fn formatar(&self) -> String {
        match self {
            Mensagem::Texto(s) => format!("Texto: {}", s),
            Mensagem::Numero(n) => format!("Número: {}", n),
            Mensagem::Booleano(b) => format!("Booleano: {}", b),
            Mensagem::Vazio => String::from("Vazio"),
        }
    }
}

// Função para gerar um nome de arquivo aleatório
fn gerar_nome_aleatorio() -> String {
    let mut rng = rand::thread_rng();
    let numero: u64 = rng.gen();
    format!("arquivo_{}.txt", numero)
}

fn main() {
    // Criando diferentes instâncias do enum
    let mensagens = vec![
        Mensagem::Texto(String::from("Olá, mundo!")),
        Mensagem::Numero(42),
        Mensagem::Booleano(true),
        Mensagem::Vazio,
        Mensagem::Texto(String::from("Rust é incrível!")),
        Mensagem::Numero(-100),
        Mensagem::Booleano(false),
    ];

    // Gerando nome aleatório para o arquivo
    let nome_arquivo = gerar_nome_aleatorio();
    
    println!("Salvando em: {}", nome_arquivo);

    // Criando e escrevendo no arquivo
    let mut arquivo = File::create(&nome_arquivo).expect("Não foi possível criar o arquivo");

    for mensagem in &mensagens {
        // Usando match para formatar cada mensagem
        let conteudo = mensagem.formatar();
        writeln!(arquivo, "{}", conteudo).expect("Não foi possível escrever no arquivo");
        println!("{}", conteudo);
    }

    println!("\nArquivo '{}' criado com sucesso!", nome_arquivo);
}
