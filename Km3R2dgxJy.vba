Sub FormatExcelSheet()
    ' This macro formats the active Excel sheet
    
    ' Declare variables
    Dim ws As Worksheet
    Set ws = ActiveSheet
    
    ' Format the header row (assuming first row is header)
    With ws.Range("A1:Z1")
        .Font.Bold = True
        .Font.Size = 12
        .Interior.Color = RGB(200, 200, 200) ' Light gray background
        .Borders.LineStyle = xlContinuous
    End With
    
    ' Auto-fit columns
    ws.Columns.AutoFit
    
    ' Add alternating row colors
    Dim lastRow As Long
    lastRow = ws.Cells(ws.Rows.Count, "A").End(xlUp).Row
    
    Dim i As Long
    For i = 2 To lastRow
        If i Mod 2 = 0 Then
            ws.Rows(i).Interior.Color = RGB(240, 240, 240) ' Light gray for even rows
        Else
            ws.Rows(i).Interior.Color = RGB(255, 255, 255) ' White for odd rows
        End If
    Next i
    
    ' Add a border around the used range
    ws.UsedRange.Borders.LineStyle = xlContinuous
    
    ' Notify user
    MsgBox "Sheet formatting complete!", vbInformation
End Sub