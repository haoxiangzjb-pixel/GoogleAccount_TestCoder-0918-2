// Script JavaScript para manipular o DOM e alterar o texto de um elemento

// Função para alterar o texto de um elemento
function changeElementText(selector, newText) {
    const element = document.querySelector(selector);
    if (element) {
        element.textContent = newText;
        console.log(`Texto do elemento "${selector}" alterado para: "${newText}"`);
        return true;
    } else {
        console.error(`Elemento "${selector}" não encontrado no DOM.`);
        return false;
    }
}

// Função para alterar o texto de um elemento por ID
function changeElementTextById(elementId, newText) {
    const element = document.getElementById(elementId);
    if (element) {
        element.textContent = newText;
        console.log(`Texto do elemento com ID "${elementId}" alterado para: "${newText}"`);
        return true;
    } else {
        console.error(`Elemento com ID "${elementId}" não encontrado no DOM.`);
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

// Caso este script seja executado em um navegador, as funções estarão disponíveis globalmente