import toml
import datetime
import random
import string

# Criar um dicionário com dados de configuração contendo um datetime
config_data = {
    "configuracao": {
        "timestamp": datetime.datetime.now(datetime.timezone.utc),
        "descricao": "Arquivo de configuração com timestamp"
    }
}

# Gerar um nome de arquivo aleatório
random_filename = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.toml'

# Salvar os dados em formato TOML com o nome aleatório
with open(random_filename, 'w', encoding='utf-8') as f:
    toml.dump(config_data, f)

print(f"Arquivo TOML salvo como: {random_filename}")
print("Conteúdo do arquivo:")
with open(random_filename, 'r', encoding='utf-8') as f:
    print(f.read())