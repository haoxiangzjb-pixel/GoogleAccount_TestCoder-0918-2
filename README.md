# VBA - Salvar Dados de Planilha em Arquivo com Nome Aleatório

Este projeto contém um código em VBA (Visual Basic for Applications) que demonstra como:

1. Armazenar dados de uma planilha em um array
2. Salvar esses dados em um arquivo com nome aleatório

## Arquivos do Projeto

- `SaveSheetDataWithRandomName.bas` - Código VBA com as funções necessárias

## Funcionalidades

### Funções Disponíveis

- `SaveSheetDataToArrayAndFile()` - Função principal que:
  - Lê todos os dados da planilha ativa
  - Armazena os dados em um array bidimensional
  - Gera um nome de arquivo aleatório baseado na data/hora
  - Salva os dados do array em um arquivo de texto

- `TestSaveSheetData()` - Função de teste que:
  - Cria dados de exemplo na planilha
  - Chama a função principal para salvar os dados

## Como Usar

1. Abra o Excel
2. Pressione `ALT + F11` para abrir o editor VBA
3. Crie um novo módulo (`Inserir > Módulo`)
4. Cole o conteúdo do arquivo `SaveSheetDataWithRandomName.bas`
5. Execute a função `TestSaveSheetData()` para testar com dados de exemplo
6. Ou execute `SaveSheetDataToArrayAndFile()` para salvar os dados da planilha atual

## Formato do Nome do Arquivo

O nome do arquivo gerado seguirá o padrão:
`DadosPlanilha_yyyymmdd_hhmmss_númeroaleatório.txt`

Por exemplo: `DadosPlanilha_20231201_143022_8745.txt`

## Observações

- O arquivo de saída será salvo na mesma pasta do arquivo Excel ativo
- Os dados são salvos em formato tab-delimited (separados por tabulação)
- O código lê automaticamente todas as linhas e colunas com dados na planilha