Attribute VB_Name = "FormatExcelMacro"
Sub FormatExcelSheet()
    ' Format an Excel sheet with various formatting options
    
    Dim ws As Worksheet
    Set ws = ActiveSheet
    
    ' Format headers (row 1)
    With ws.Rows(1)
        .Font.Bold = True
        .Interior.Color = RGB(79, 129, 189)  ' Blue background
        .Font.Color = RGB(255, 255, 255)     ' White text
        .HorizontalAlignment = xlCenter
    End With
    
    ' Auto-fit column widths
    ws.Columns.AutoFit
    
    ' Format alternate rows
    Dim i As Long
    For i = 2 To ws.UsedRange.Rows.Count Step 2
        ws.Rows(i).Interior.Color = RGB(242, 242, 242)  ' Light gray background
    Next i
    
    ' Add borders to used range
    With ws.UsedRange.Borders
        .LineStyle = xlContinuous
        .Weight = xlThin
    End With
    
    ' Format date columns if any (assuming column with "Date" in header)
    Dim col As Long
    For col = 1 To ws.UsedRange.Columns.Count
        If InStr(UCase(ws.Cells(1, col).Value), "DATE") > 0 Then
            ws.Columns(col).NumberFormat = "mm/dd/yyyy"
        End If
    Next col
    
    ' Format number columns (assuming columns with "Amount", "Price", "Cost" in header)
    For col = 1 To ws.UsedRange.Columns.Count
        Dim headerText As String
        headerText = UCase(ws.Cells(1, col).Value)
        If InStr(headerText, "AMOUNT") > 0 Or InStr(headerText, "PRICE") > 0 Or InStr(headerText, "COST") > 0 Then
            ws.Columns(col).NumberFormat = "#,##0.00"
        End If
    Next col
    
    MsgBox "Excel sheet formatting completed!", vbInformation
End Sub