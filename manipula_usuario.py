import json
import random
import string

def salvar_usuario_dicionario(usuario_dados, diretorio_destino='.'):
    """
    Manipula um dicionário de dados de usuário e salva em um arquivo com nome aleatório.
    
    Args:
        usuario_dados (dict): Dicionário contendo os dados do usuário
        diretorio_destino (str): Diretório onde o arquivo será salvo (padrão é o diretório atual)
    
    Returns:
        str: Nome do arquivo onde os dados foram salvos
    """
    # Verifica se o parâmetro é um dicionário
    if not isinstance(usuario_dados, dict):
        raise TypeError("Os dados do usuário devem ser um dicionário")
    
    # Gera um nome de arquivo aleatório
    nome_arquivo = ''.join(random.choices(string.ascii_letters + string.digits, k=10)) + '.json'
    caminho_completo = f"{diretorio_destino}/{nome_arquivo}" if diretorio_destino != '.' else nome_arquivo
    
    # Salva o dicionário em formato JSON no arquivo
    with open(caminho_completo, 'w', encoding='utf-8') as arquivo:
        json.dump(usuario_dados, arquivo, ensure_ascii=False, indent=4)
    
    print(f"Dados do usuário salvos em: {caminho_completo}")
    return nome_arquivo

# Exemplo de uso
if __name__ == "__main__":
    # Exemplo de dados de usuário
    dados_usuario = {
        "nome": "João Silva",
        "idade": 30,
        "email": "joao.silva@example.com",
        "cidade": "São Paulo"
    }
    
    # Salva os dados em um arquivo com nome aleatório
    nome_arquivo_gerado = salvar_usuario_dicionario(dados_usuario)
    print(f"Arquivo gerado: {nome_arquivo_gerado}")