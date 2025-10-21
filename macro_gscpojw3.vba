Attribute VB_Name = "FormatSheetMacro"
Sub FormatExcelSheet()
    ' Format the active sheet with common formatting options
    
    ' Format headers (Row 1)
    With Rows(1)
        .Font.Bold = True
        .Interior.Color = RGB(51, 102, 255) ' Blue background
        .Font.Color = RGB(255, 255, 255) ' White text
        .HorizontalAlignment = xlCenter
    End With
    
    ' Auto-fit columns
    Columns.AutoFit
    
    ' Add borders to used range
    With ActiveSheet.UsedRange
        .Borders.LineStyle = xlContinuous
        .Borders.Weight = xlThin
    End With
    
    ' Format currency columns (assuming columns with "Price" or "Cost" in header)
    Dim cell As Range
    For Each cell In Rows(1).EntireRow.Cells
        If InStr(LCase(cell.Value), "price") > 0 Or InStr(LCase(cell.Value), "cost") > 0 Or InStr(LCase(cell.Value), "amount") > 0 Then
            Columns(cell.Column).NumberFormat = "$#,##0.00"
        End If
    Next cell
    
    ' Format date columns (assuming columns with "Date" in header)
    For Each cell In Rows(1).EntireRow.Cells
        If InStr(LCase(cell.Value), "date") > 0 Then
            Columns(cell.Column).NumberFormat = "mm/dd/yyyy"
        End If
    Next cell
    
    MsgBox "Sheet formatting completed!", vbInformation
End Sub