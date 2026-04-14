open System
open System.IO

/// Função para gerar um nome de arquivo aleatório
let generateRandomFileName () =
    let randomId = Guid.NewGuid().ToString().Substring(0, 8)
    $"data_{randomId}.txt"

/// Função para processar dados usando pipeline
let processDataAndSave (data: string list) (outputDir: string) =
    data
    |> List.filter (fun s -> not (String.IsNullOrWhiteSpace s))  // Remove strings vazias
    |> List.map (fun s -> s.Trim().ToUpper())                    // Trim e converte para maiúsculo
    |> List.sort                                                 // Ordena alfabeticamente
    |> List.mapi (fun i s -> sprintf "[%d] %s" (i + 1) s)       // Adiciona numeração
    |> String.concat Environment.NewLine                         // Junta com quebra de linha
    |> fun content ->                                            // Prepara conteúdo para salvar
        let fileName = generateRandomFileName ()
        let fullPath = Path.Combine(outputDir, fileName)
        File.WriteAllText(fullPath, content)
        fullPath

[<EntryPoint>]
let main argv =
    // Dados de exemplo para processamento
    let sampleData = [
        "  hello world  "
        "f# programming"
        ""
        "  data processing  "
        "pipeline example"
        "   "
        "random file name"
    ]
    
    // Diretório de saída (usa o diretório atual se não especificado)
    let outputDir = 
        if argv.Length > 0 then argv.[0]
        else Directory.GetCurrentDirectory()
    
    // Garante que o diretório existe
    if not (Directory.Exists(outputDir)) then
        Directory.CreateDirectory(outputDir) |> ignore
    
    // Processa os dados e salva em arquivo com nome aleatório
    let outputPath = processDataAndSave sampleData outputDir
    
    printfn "Dados processados e salvos em: %s" outputPath
    printfn "\nConteúdo do arquivo:"
    
    // Lê e exibe o conteúdo do arquivo criado
    File.ReadAllText(outputPath) |> printfn "%s"
    
    0
