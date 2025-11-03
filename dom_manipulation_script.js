// Script para manipular o DOM e salvar em um arquivo com nome aleatório

// Função para gerar um nome de arquivo aleatório
function generateRandomFileName(extension = 'txt') {
    const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    let result = '';
    const charactersLength = characters.length;
    
    // Gerar um nome com 10 caracteres aleatórios
    for (let i = 0; i < 10; i++) {
        result += characters.charAt(Math.floor(Math.random() * charactersLength));
    }
    
    return result + '.' + extension;
}

// Função para manipular o DOM e alterar o texto de um elemento
function manipulateDOM() {
    // Verificar se estamos no navegador
    if (typeof document !== 'undefined') {
        // Procurar por um elemento com ID específico ou criar um se não existir
        let targetElement = document.getElementById('target-text');
        
        if (!targetElement) {
            // Criar um elemento se não existir
            targetElement = document.createElement('div');
            targetElement.id = 'target-text';
            targetElement.textContent = 'Texto original';
            document.body.appendChild(targetElement);
        }
        
        // Alterar o texto do elemento
        const newText = 'Texto alterado em ' + new Date().toISOString();
        targetElement.textContent = newText;
        
        console.log('Texto do elemento alterado para:', newText);
        
        // Retornar o texto alterado para salvar no arquivo
        return targetElement.textContent;
    } else {
        // Ambiente Node.js - usando JSDOM
        console.log('Ambiente Node.js detectado');
        return 'Texto manipulado em ambiente Node.js em ' + new Date().toISOString();
    }
}

// Função para salvar o conteúdo em um arquivo
function saveToFile(content) {
    // Verificar se estamos no navegador
    if (typeof window !== 'undefined' && typeof Blob !== 'undefined') {
        // No navegador, criar e fazer download do arquivo
        const randomFileName = generateRandomFileName('txt');
        const blob = new Blob([content], { type: 'text/plain' });
        const url = URL.createObjectURL(blob);
        
        const a = document.createElement('a');
        a.href = url;
        a.download = randomFileName;
        document.body.appendChild(a);
        a.click();
        
        // Limpar
        setTimeout(() => {
            document.body.removeChild(a);
            if (window.URL && typeof window.URL.revokeObjectURL === 'function') {
                window.URL.revokeObjectURL(url);
            }
        }, 0);
        
        console.log('Arquivo salvo como:', randomFileName);
        return randomFileName;
    } else {
        // Em Node.js, salvar o arquivo usando o sistema de arquivos
        try {
            const fs = require('fs');
            const path = require('path');
            
            const randomFileName = generateRandomFileName('txt');
            const filePath = path.join(__dirname, randomFileName);
            
            fs.writeFileSync(filePath, content);
            
            console.log('Arquivo salvo como:', randomFileName);
            console.log('Caminho do arquivo:', filePath);
            
            return randomFileName;
        } catch (error) {
            console.error('Erro ao salvar o arquivo em Node.js:', error);
            return null;
        }
    }
}

// Função principal que executa todo o processo
function main() {
    console.log('Iniciando manipulação do DOM...');
    
    // Manipular o DOM e obter o novo conteúdo
    const manipulatedContent = manipulateDOM();
    
    // Salvar o conteúdo em um arquivo com nome aleatório
    const fileName = saveToFile(manipulatedContent);
    
    console.log('Processo concluído. Arquivo salvo como:', fileName);
    
    return {
        fileName: fileName,
        content: manipulatedContent
    };
}

// Executar o script
if (typeof module !== 'undefined' && module.exports) {
    // Para exportar em Node.js
    module.exports = { main, manipulateDOM, saveToFile, generateRandomFileName };
} else {
    // No navegador, executar automaticamente
    window.addEventListener('load', main);
    if (document.readyState === 'loading') {
        // Página ainda carregando
    } else {
        // Página já carregada
        main();
    }
}