from manipula_usuario import salvar_usuario_dicionario

# Exemplos adicionais de uso da função

# Exemplo 1: Dados de usuário básicos
usuario1 = {
    "nome": "Maria Oliveira",
    "idade": 25,
    "email": "maria@example.com",
    "profissao": "Engenheira de Software"
}

# Exemplo 2: Dados de usuário com informações mais complexas
usuario2 = {
    "nome": "Carlos Souza",
    "idade": 35,
    "email": "carlos.souza@example.com",
    "endereco": {
        "rua": "Av. Principal",
        "numero": 123,
        "cidade": "Rio de Janeiro",
        "estado": "RJ"
    },
    "telefones": ["+55 21 99999-9999", "+55 21 3333-3333"],
    "ativo": True
}

# Exemplo 3: Dados de usuário com lista de interesses
usuario3 = {
    "nome": "Ana Costa",
    "idade": 28,
    "email": "ana.costa@example.com",
    "interesses": ["leitura", "viagem", "tecnologia", "esportes"],
    "preferencias": {
        "tema": "escuro",
        "notificacoes": True,
        "idioma": "pt-BR"
    }
}

# Salvando os diferentes usuários em arquivos com nomes aleatórios
print("Salvando usuário 1:")
arquivo1 = salvar_usuario_dicionario(usuario1)
print(f"Nome do arquivo gerado: {arquivo1}\n")

print("Salvando usuário 2:")
arquivo2 = salvar_usuario_dicionario(usuario2)
print(f"Nome do arquivo gerado: {arquivo2}\n")

print("Salvando usuário 3:")
arquivo3 = salvar_usuario_dicionario(usuario3)
print(f"Nome do arquivo gerado: {arquivo3}\n")

print("Todos os arquivos foram salvos com sucesso!")