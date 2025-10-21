Attribute VB_Name = "FormatExcelSheet"
Sub FormatExcelWorksheet()
    ' Format an Excel worksheet with common formatting options
    
    Dim ws As Worksheet
    Set ws = ActiveSheet
    
    ' Format headers (first row)
    With ws.Rows(1)
        .Font.Bold = True
        .Interior.Color = RGB(54, 95, 145) ' Dark blue background
        .Font.Color = RGB(255, 255, 255) ' White font
        .HorizontalAlignment = xlCenter
    End With
    
    ' Auto-fit all columns
    ws.Columns.AutoFit
    
    ' Format alternating rows
    Dim lastRow As Long
    Dim lastCol As Long
    lastRow = ws.Cells(ws.Rows.Count, 1).End(xlUp).Row
    lastCol = ws.Cells(1, ws.Columns.Count).End(xlToLeft).Column
    
    Dim i As Long
    For i = 2 To lastRow
        If i Mod 2 = 0 Then
            ws.Rows(i).Interior.Color = RGB(242, 242, 242) ' Light gray for even rows
        End If
    Next i
    
    ' Add borders to the data range
    ws.Range(ws.Cells(1, 1), ws.Cells(lastRow, lastCol)).Borders.LineStyle = xlContinuous
    
    ' Format any currency columns (if column headers contain "Amount", "Price", "Cost", etc.)
    Dim j As Long
    For j = 1 To lastCol
        If InStr(UCase(ws.Cells(1, j).Value), "AMOUNT") > 0 Or _
           InStr(UCase(ws.Cells(1, j).Value), "PRICE") > 0 Or _
           InStr(UCase(ws.Cells(1, j).Value), "COST") > 0 Or _
           InStr(UCase(ws.Cells(1, j).Value), "TOTAL") > 0 Then
            ws.Columns(j).NumberFormat = "$#,##0.00"
        End If
    Next j
    
    MsgBox "Worksheet formatting completed successfully!", vbInformation
End Sub