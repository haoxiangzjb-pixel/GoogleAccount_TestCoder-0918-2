Sub FormatExcelSheet()
    Dim ws As Worksheet
    Set ws = ActiveSheet
    
    ' Format the header row
    With ws.Range("A1:D1")
        .Font.Bold = True
        .Font.Color = RGB(255, 255, 255) ' White text
        .Interior.Color = RGB(50, 50, 50) ' Dark gray background
        .HorizontalAlignment = xlCenter
    End With
    
    ' Auto-fit column widths
    ws.Columns("A:D").AutoFit
    
    ' Format data rows
    Dim lastRow As Long
    lastRow = ws.Cells(ws.Rows.Count, "A").End(xlUp).Row
    
    If lastRow > 1 Then
        With ws.Range("A2:D" & lastRow)
            .Borders(xlInsideHorizontal).LineStyle = xlContinuous
            .Borders(xlInsideVertical).LineStyle = xlContinuous
            .Borders(xlEdgeLeft).LineStyle = xlContinuous
            .Borders(xlEdgeRight).LineStyle = xlContinuous
            .Borders(xlEdgeTop).LineStyle = xlContinuous
            .Borders(xlEdgeBottom).LineStyle = xlContinuous
        End With
    End If
    
    ' Add alternating row colors
    Dim i As Long
    For i = 2 To lastRow
        If i Mod 2 = 0 Then
            ws.Rows(i).Interior.Color = RGB(240, 240, 240) ' Light gray
        Else
            ws.Rows(i).Interior.Color = RGB(255, 255, 255) ' White
        End If
    Next i
    
    MsgBox "Sheet formatting complete!", vbInformation
End Sub