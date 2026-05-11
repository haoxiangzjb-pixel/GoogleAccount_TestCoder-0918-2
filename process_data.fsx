// F# script para processar dados com pipeline e salvar em arquivo com nome aleatório

open System
open System.IO

// Função para gerar um nome de arquivo aleatório
let generateRandomFileName (extension: string) =
    let randomId = Guid.NewGuid().ToString().Substring(0, 8)
    let timestamp = DateTime.Now.ToString("yyyyMMdd_HHmmss")
    sprintf "data_%s_%s%s" timestamp randomId extension

// Função para processar dados (exemplo: transformar strings)
let processData (data: string list) =
    data
    |> List.map (fun s -> s.Trim())           // Remove espaços em branco
    |> List.filter (fun s -> not (String.IsNullOrEmpty(s)))  // Remove vazios
    |> List.map (fun s -> s.ToUpper())        // Converte para maiúsculas
    |> List.sort                              // Ordena alfabeticamente

// Função para salvar dados em arquivo
let saveToFile (filePath: string) (data: string list) =
    let content = String.concat "\n" data
    File.WriteAllText(filePath, content)
    filePath

// Função principal com pipeline completo
let processAndSaveData (data: string list) (outputDir: string) =
    // Garante que o diretório existe
    if not (Directory.Exists(outputDir)) then
        Directory.CreateDirectory(outputDir) |> ignore
    
    data
    |> processData                                    // Processa os dados
    |> fun processedData ->                           // Pipeline continua
        let fileName = generateRandomFileName ".txt"
        let fullPath = Path.Combine(outputDir, fileName)
        saveToFile fullPath processedData             // Salva em arquivo
    |> fun savedPath ->                               // Retorna o caminho do arquivo salvo
        printfn "Dados salvos em: %s" savedPath
        savedPath

// Exemplo de uso
[<EntryPoint>]
let main argv =
    let sampleData = [
        "  hello world  "
        "  f# programming  "
        ""
        "  data processing  "
        "  pipeline example  "
        "   "
        "  random file name  "
    ]
    
    let outputDirectory = "./output"
    
    let savedFilePath = processAndSaveData sampleData outputDirectory
    
    printfn "Processamento concluído!"
    printfn "Arquivo salvo: %s" savedFilePath
    
    0
