Sub FormatExcelSheet()
    ' This macro formats the active Excel sheet
    
    ' Declare variables
    Dim ws As Worksheet
    Set ws = ActiveSheet
    
    ' Format the header row
    With ws.Range("A1:E1")
        .Font.Bold = True
        .Font.Size = 12
        .Interior.Color = RGB(200, 200, 200)
        .Borders.LineStyle = xlContinuous
    End With
    
    ' Auto-fit columns
    ws.Columns("A:E").AutoFit
    
    ' Add borders to all cells with data
    ws.UsedRange.Borders.LineStyle = xlContinuous
    
    ' Center align all data
    ws.UsedRange.HorizontalAlignment = xlCenter
    
    ' Apply currency format to column D if it contains numbers
    ws.Range("D:D").NumberFormat = "$#,##0.00"
    
    ' Apply percentage format to column E if it contains numbers
    ws.Range("E:E").NumberFormat = "0.00%"
    
    ' Notify user
    MsgBox "Sheet formatting complete!", vbInformation
End Sub