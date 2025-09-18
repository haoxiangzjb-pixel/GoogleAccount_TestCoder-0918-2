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
    
    ' Add borders to all cells with data
    ws.UsedRange.Borders.LineStyle = xlContinuous
    
    ' Center align all data
    ws.UsedRange.HorizontalAlignment = xlCenter
    
    ' Apply alternating row colors
    Dim lastRow As Long
    lastRow = ws.Cells(ws.Rows.Count, "A").End(xlUp).Row
    
    Dim i As Long
    For i = 2 To lastRow
        If i Mod 2 = 0 Then
            ws.Range("A" & i & ":E" & i).Interior.Color = RGB(217, 225, 242) ' Light blue
        Else
            ws.Range("A" & i & ":E" & i).Interior.Color = RGB(255, 255, 255) ' White
        End If
    Next i
    
    ' Add a title
    ws.Range("A1").EntireRow.Insert
    ws.Range("A1:E1").Merge
    ws.Range("A1").Value = "Formatted Data Report"
    ws.Range("A1").Font.Bold = True
    ws.Range("A1").Font.Size = 16
    ws.Range("A1").HorizontalAlignment = xlCenter
    
    MsgBox "Sheet formatting complete!"
End Sub