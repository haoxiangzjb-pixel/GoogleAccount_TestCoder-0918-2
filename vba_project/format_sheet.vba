Sub FormatExcelSheet()
    Dim ws As Worksheet
    Set ws = ActiveSheet
    
    ' Format headers
    With ws.Range("A1:D1")
        .Font.Bold = True
        .Font.Color = RGB(255, 255, 255)
        .Interior.Color = RGB(50, 50, 50)
        .HorizontalAlignment = xlCenter
    End With
    
    ' Add borders to data range
    ws.Range("A1:D10").Borders.LineStyle = xlContinuous
    ws.Range("A1:D10").Borders.Weight = xlThin
    
    ' Auto-fit columns
    ws.Columns("A:D").AutoFit
    
    ' Add a title
    ws.Range("A1").Value = "Sample Data"
    ws.Range("B1").Value = "Q1"
    ws.Range("C1").Value = "Q2"
    ws.Range("D1").Value = "Q3"
    
    ' Add sample data
    Dim i As Integer
    For i = 2 To 10
        ws.Cells(i, 1).Value = "Item " & i - 1
        ws.Cells(i, 2).Value = Int(Rnd() * 100)
        ws.Cells(i, 3).Value = Int(Rnd() * 100)
        ws.Cells(i, 4).Value = Int(Rnd() * 100)
    Next i
    
    MsgBox "Sheet formatting complete!"
End Sub