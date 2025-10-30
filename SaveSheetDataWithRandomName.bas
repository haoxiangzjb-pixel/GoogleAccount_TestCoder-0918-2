' Sub para salvar dados da planilha em um arquivo com nome aleatório usando array
Sub SaveSheetDataToArrayAndFile()
    Dim ws As Worksheet
    Dim dataArray() As Variant
    Dim fileName As String
    Dim filePath As String
    Dim lastRow As Long
    Dim lastCol As Long
    Dim i As Long, j As Long
    Dim fileNum As Integer
    
    ' Define a planilha (pode ser alterado conforme necessário)
    Set ws = ActiveSheet ' ou use Worksheets("NomeDaPlanilha")
    
    ' Encontra o último número de linha e coluna preenchido
    lastRow = ws.Cells(ws.Rows.Count, 1).End(xlUp).Row
    lastCol = ws.Cells(1, ws.Columns.Count).End(xlToLeft).Column
    
    ' Redimensiona o array para conter todos os dados
    ReDim dataArray(1 To lastRow, 1 To lastCol)
    
    ' Preenche o array com os dados da planilha
    For i = 1 To lastRow
        For j = 1 To lastCol
            dataArray(i, j) = ws.Cells(i, j).Value
        Next j
    Next i
    
    ' Gera um nome de arquivo aleatório
    fileName = "DadosPlanilha_" & Format(Now, "yyyymmdd_hhmmss") & "_" & Int(Rnd() * 10000) & ".txt"
    filePath = ThisWorkbook.Path & "\" & fileName
    
    ' Abre o arquivo para escrita
    fileNum = FreeFile
    Open filePath For Output As #fileNum
    
    ' Escreve os dados do array no arquivo
    For i = 1 To lastRow
        Dim lineText As String
        lineText = ""
        For j = 1 To lastCol
            If j = 1 Then
                lineText = dataArray(i, j)
            Else
                lineText = lineText & vbTab & dataArray(i, j)
            End If
        Next j
        Print #fileNum, lineText
    Next i
    
    ' Fecha o arquivo
    Close #fileNum
    
    ' Informa ao usuário onde o arquivo foi salvo
    MsgBox "Dados salvos com sucesso em: " & filePath, vbInformation
End Sub

' Sub para testar a funcionalidade criando dados de exemplo
Sub TestSaveSheetData()
    Dim ws As Worksheet
    Set ws = ActiveSheet
    
    ' Limpa a planilha e adiciona dados de exemplo
    ws.Cells.Clear
    
    ' Adiciona cabeçalhos
    ws.Cells(1, 1).Value = "ID"
    ws.Cells(1, 2).Value = "Nome"
    ws.Cells(1, 3).Value = "Idade"
    ws.Cells(1, 4).Value = "Cidade"
    
    ' Adiciona dados de exemplo
    ws.Cells(2, 1).Value = 1
    ws.Cells(2, 2).Value = "João Silva"
    ws.Cells(2, 3).Value = 30
    ws.Cells(2, 4).Value = "São Paulo"
    
    ws.Cells(3, 1).Value = 2
    ws.Cells(3, 2).Value = "Maria Oliveira"
    ws.Cells(3, 3).Value = 25
    ws.Cells(3, 4).Value = "Rio de Janeiro"
    
    ws.Cells(4, 1).Value = 3
    ws.Cells(4, 2).Value = "Pedro Santos"
    ws.Cells(4, 3).Value = 35
    ws.Cells(4, 4).Value = "Belo Horizonte"
    
    ' Executa a rotina principal
    Call SaveSheetDataToArrayAndFile
End Sub