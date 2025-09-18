Sub FormatExcelSheet()
    Dim ws As Worksheet
    Set ws = ActiveSheet
    
    ' Auto-fit columns and rows
    ws.Columns.AutoFit
    ws.Rows.AutoFit
    
    ' Format header row (assuming headers are in row 1)
    With ws.Range("1:1")
        .Font.Bold = True
        .Interior.Color = RGB(200, 200, 200)
        .Borders.LineStyle = xlContinuous
    End With
    
    ' Format all cells with borders
    ws.Cells.Borders.LineStyle = xlContinuous
    
    ' Center align all cells
    ws.Cells.HorizontalAlignment = xlCenter
    ws.Cells.VerticalAlignment = xlCenter
    
    ' Apply alternating row colors
    Dim lastRow As Long
    lastRow = ws.Cells(ws.Rows.Count, 1).End(xlUp).Row
    
    Dim i As Long
    For i = 2 To lastRow
        If i Mod 2 = 0 Then
            ws.Range("A" & i & ":" & ws.Cells(i, ws.Columns.Count).End(xlToLeft).Address).Interior.Color = RGB(240, 240, 240)
        End If
    Next i
    
    MsgBox "Sheet formatting complete!"
End Sub