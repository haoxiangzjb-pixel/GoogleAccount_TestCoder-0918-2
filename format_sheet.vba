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
    
    ' Auto-fit columns
    ws.Columns("A:D").AutoFit
    
    ' Format data rows
    Dim lastRow As Long
    lastRow = ws.Cells(ws.Rows.Count, "A").End(xlUp).Row
    
    If lastRow > 1 Then
        With ws.Range("A2:D" & lastRow)
            .Borders.LineStyle = xlContinuous
            .HorizontalAlignment = xlCenter
        End With
    End If
    
    ' Add a title
    ws.Range("A1").Value = "Sample Data"
    ws.Range("A1").Font.Bold = True
    ws.Range("A1").Font.Size = 14
    
    MsgBox "Sheet formatting complete!"
End Sub