Sub FormatExcelSheet()
    ' Format the active worksheet
    Dim ws As Worksheet
    Set ws = ActiveSheet
    
    ' Format headers (first row)
    With ws.Rows(1)
        .Font.Bold = True
        .Interior.Color = RGB(79, 129, 189)
        .Font.Color = RGB(255, 255, 255)
        .HorizontalAlignment = xlCenter
    End With
    
    ' Auto-fit all columns
    ws.Columns.AutoFit
    
    ' Add borders to used range
    With ws.UsedRange.Borders
        .LineStyle = xlContinuous
        .Weight = xlThin
        .ColorIndex = 1
    End With
    
    ' Format even rows with a light gray background
    Dim i As Long
    For i = 2 To ws.UsedRange.Rows.Count
        If i Mod 2 = 0 Then
            ws.Rows(i).Interior.Color = RGB(242, 242, 242)
        End If
    Next i
    
    MsgBox "Worksheet formatting completed!"
End Sub