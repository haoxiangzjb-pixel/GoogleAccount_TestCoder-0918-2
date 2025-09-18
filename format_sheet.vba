Sub FormatExcelSheet()
    Dim ws As Worksheet
    Set ws = ActiveSheet
    
    ' Format the header row
    With ws.Range("A1:D1")
        .Font.Bold = True
        .Font.Size = 12
        .Interior.Color = RGB(200, 200, 200)
        .Borders.LineStyle = xlContinuous
    End With
    
    ' Format the data rows
    With ws.Range("A2:D100")
        .Font.Size = 10
        .Borders.LineStyle = xlContinuous
    End With
    
    ' Auto-fit columns
    ws.Columns("A:D").AutoFit
    
    ' Add a title
    ws.Range("A1").Value = "Sales Data"
    ws.Range("A1:D1").Merge
    ws.Range("A1").HorizontalAlignment = xlCenter
    
    MsgBox "Sheet formatted successfully!"
End Sub