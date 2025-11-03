const { JSDOM } = require('jsdom');
const fs = require('fs');

// Criar um DOM virtual
const dom = new JSDOM(`
<!DOCTYPE html>
<html>
<head>
    <title>Teste com JSDOM</title>
</head>
<body>
    <div id="target-text">Texto original</div>
</body>
</html>
`);

// Definir os objetos globais necessários
global.window = dom.window;
global.document = dom.window.document;
global.Blob = function(content, options) {
    this.content = content;
    this.options = options;
};
global.URL = {
    createObjectURL: function(blob) { return 'blob:test-url'; },
    revokeObjectURL: function(url) { /* faz nada */ }
};

// Agora podemos executar nosso script de manipulação de DOM
const { main } = require('./dom_manipulation_script.js');

console.log('Executando o script de manipulação de DOM com JSDOM...');
const result = main();

console.log('\nResultado da execução:');
console.log('Nome do arquivo:', result.fileName);
console.log('Conteúdo:', result.content);

// Verificar se o elemento foi manipulado
const targetElement = document.getElementById('target-text');
console.log('\nTexto do elemento após manipulação:', targetElement.textContent);

// Verificar se o arquivo foi criado no diretório atual
console.log('\nArquivos .txt no diretório atual:');
const files = fs.readdirSync('.');
const txtFiles = files.filter(file => file.endsWith('.txt') && file !== 'first.txt');
console.log(txtFiles);