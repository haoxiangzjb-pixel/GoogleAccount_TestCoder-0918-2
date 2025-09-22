Sub FormatExcelSheet()
    ' This macro formats an Excel sheet with common formatting options
    
    Dim ws As Worksheet
    Set ws = ActiveSheet
    
    ' Format the header row
    With ws.Range("A1:E1")
        .Font.Bold = True
        .Font.Size = 12
        .Interior.Color = RGB(79, 129, 189) ' Blue background
        .Font.Color = RGB(255, 255, 255) ' White text
        .Borders.LineStyle = xlContinuous
    End With
    
    ' Auto-fit columns
    ws.Columns("A:E").AutoFit
    
    ' Add alternating row colors
    Dim lastRow As Long
    lastRow = ws.Cells(ws.Rows.Count, "A").End(xlUp).Row
    
    Dim i As Long
    For i = 2 To lastRow
        If i Mod 2 = 0 Then
            ws.Rows(i).Interior.Color = RGB(219, 229, 241) ' Light blue
        Else
            ws.Rows(i).Interior.Color = RGB(255, 255, 255) ' White
        End If
    Next i
    
    ' Format all cells with borders
    ws.Range("A1:E" & lastRow).Borders.LineStyle = xlContinuous
    
    ' Center align all cells
    ws.Range("A1:E" & lastRow).HorizontalAlignment = xlCenter
    
    MsgBox "Sheet formatting complete!"
End Sub