' VBA Macro to format an Excel sheet
Sub FormatExcelSheet()
    ' Format headers
    With Range("A1:Z1")
        .Font.Bold = True
        .Interior.Color = RGB(54, 95, 146) ' Dark blue background
        .Font.Color = RGB(255, 255, 255)   ' White text
        .HorizontalAlignment = xlCenter
    End With
    
    ' Auto-fit columns
    Columns("A:Z").AutoFit
    
    ' Add borders to the used range
    Dim ws As Worksheet
    Set ws = ActiveSheet
    With ws.UsedRange.Borders
        .LineStyle = xlContinuous
        .Weight = xlThin
        .ColorIndex = 1 ' Black
    End With
    
    ' Format date columns (assuming dates might be in columns with "date" in header)
    Dim cell As Range
    For Each cell In Range("A1:Z1").Cells
        If InStr(LCase(cell.Value), "date") > 0 Then
            Columns(cell.Column).NumberFormat = "mm/dd/yyyy"
        End If
    Next cell
    
    ' Format numeric columns (assuming numbers might be in columns with "amount", "price", "cost", etc. in header)
    For Each cell In Range("A1:Z1").Cells
        If InStr(LCase(cell.Value), "amount") > 0 Or _
           InStr(LCase(cell.Value), "price") > 0 Or _
           InStr(LCase(cell.Value), "cost") > 0 Or _
           InStr(LCase(cell.Value), "value") > 0 Then
            Columns(cell.Column).NumberFormat = "#,##0.00"
        End If
    Next cell
    
    MsgBox "Excel sheet formatted successfully!", vbInformation
End Sub