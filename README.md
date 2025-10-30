# Script de Manipulação DOM com Nome Aleatório

Este projeto contém um script JavaScript que demonstra como manipular o DOM para alterar o texto de elementos e como salvar esse script em um arquivo com nome aleatório.

## Arquivos

- `dom_manipulation_script.js`: Script principal com funções para manipular o DOM
- `example_usage.js`: Exemplo de como salvar o script com nome aleatório em Node.js
- `save_random_name_script.js`: Script demonstrativo de como salvar com nome aleatório
- `example_dom.html`: Exemplo HTML para testar as funções no navegador
- `1UAUzREupE.js`: Arquivo gerado com nome aleatório (exemplo)

## Funções principais

1. `changeElementText(selector, newText)` - Altera o texto de um elemento usando seletor CSS
2. `changeElementTextById(elementId, newText)` - Altera o texto de um elemento usando ID
3. `generateRandomFileName(extension)` - Gera um nome de arquivo aleatório

## Como usar

### No navegador
1. Inclua o script no seu HTML:
   ```html
   <script src="dom_manipulation_script.js"></script>
   ```
2. Use as funções para alterar elementos:
   ```javascript
   changeElementText('#meuId', 'Novo texto');
   changeElementText('.minhaClasse', 'Texto alterado');
   ```

### Em Node.js
Para salvar o script com nome aleatório:
```javascript
const fs = require('fs');
const randomFileName = generateRandomFileName('js');
fs.writeFileSync(randomFileName, domScriptContent);
```

## Exemplo de uso

Execute o exemplo HTML (`example_dom.html`) em um navegador para ver as funções em ação, ou execute o exemplo Node.js:

```bash
node example_usage.js
```