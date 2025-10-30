// Script para demonstrar como salvar o script de manipulação DOM com nome aleatório

// Primeiro, vamos incluir o conteúdo do script de manipulação DOM
const domScriptContent = `// Script JavaScript para manipular o DOM e alterar o texto de um elemento

// Função para alterar o texto de um elemento
function changeElementText(selector, newText) {
    const element = document.querySelector(selector);
    if (element) {
        element.textContent = newText;
        console.log(\`Texto do elemento "\${selector}" alterado para: "\${newText}"\`);
        return true;
    } else {
        console.error(\`Elemento "\${selector}" não encontrado no DOM.\`);
        return false;
    }
}

// Função para alterar o texto de um elemento por ID
function changeElementTextById(elementId, newText) {
    const element = document.getElementById(elementId);
    if (element) {
        element.textContent = newText;
        console.log(\`Texto do elemento com ID "\${elementId}" alterado para: "\${newText}"\`);
        return true;
    } else {
        console.error(\`Elemento com ID "\${elementId}" não encontrado no DOM.\`);
        return false;
    }
}

// Função para gerar um nome de arquivo aleatório
function generateRandomFileName(extension = 'js') {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    let result = '';
    const length = 10; // Comprimento do nome do arquivo aleatório
    
    for (let i = 0; i < length; i++) {
        result += chars.charAt(Math.floor(Math.random() * chars.length));
    }
    
    return result + '.' + extension;
}

// Exemplo de uso:
// Assumindo que exista um elemento HTML com ID "target" ou uma classe específica
// changeElementText('#target', 'Novo texto definido pelo script!');
// changeElementText('.my-class', 'Texto alterado por classe CSS!');

// Exportar funções para uso em ambientes Node.js ou outros módulos
if (typeof module !== 'undefined' && module.exports) {
    module.exports = {
        changeElementText,
        changeElementTextById,
        generateRandomFileName
    };
}

// Caso este script seja executado em um navegador, as funções estarão disponíveis globalmente`;

// Função para gerar um nome de arquivo aleatório
function generateRandomFileName(extension = 'js') {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    let result = '';
    const length = 10;
    
    for (let i = 0; i < length; i++) {
        result += chars.charAt(Math.floor(Math.random() * chars.length));
    }
    
    return result + '.' + extension;
}

// Simular a gravação do arquivo com nome aleatório
console.log("Conteúdo do script de manipulação DOM criado com sucesso.");
console.log("Para salvar em um arquivo com nome aleatório, você pode usar o seguinte código em Node.js:");

console.log(`
const fs = require('fs');
const randomFileName = generateRandomFileName('js');
fs.writeFileSync(randomFileName, domScriptContent);
console.log('Script salvo em:', randomFileName);
`);

// Gerando um nome de arquivo aleatório como exemplo
const exampleRandomName = generateRandomFileName('js');
console.log('\nExemplo de nome de arquivo aleatório gerado:', exampleRandomName);

// Em um ambiente real com Node.js, você usaria:
// const fs = require('fs');
// const randomFileName = generateRandomFileName('js');
// fs.writeFileSync(randomFileName, domScriptContent);
// console.log('Script salvo em:', randomFileName);