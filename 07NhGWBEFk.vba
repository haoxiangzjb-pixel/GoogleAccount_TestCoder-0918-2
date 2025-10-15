Attribute VB_Name = "FormatExcelSheet"
Sub FormatExcelSheet()
    ' Format the active worksheet with common formatting tasks
    
    Dim ws As Worksheet
    Set ws = ActiveSheet
    
    ' Format headers (row 1)
    With ws.Rows(1)
        .Font.Bold = True
        .Interior.Color = RGB(54, 96, 146) ' Dark blue background
        .Font.Color = RGB(255, 255, 255) ' White text
        .HorizontalAlignment = xlCenter
    End With
    
    ' Auto-fit all columns
    ws.Columns.AutoFit
    
    ' Format the first column (A) if it contains data
    If Application.WorksheetFunction.CountA(ws.Columns(1)) > 0 Then
        ws.Columns(1).HorizontalAlignment = xlLeft
    End If
    
    ' Add borders to the used range
    With ws.UsedRange.Borders
        .LineStyle = xlContinuous
        .Weight = xlThin
        .ColorIndex = 1 ' Black
    End With
    
    ' Format numbers in the sheet (if any)
    Dim cell As Range
    For Each cell In ws.UsedRange
        If IsNumeric(cell.Value) And cell.Value <> "" Then
            If InStr(cell.Value, ".") > 0 Then
                ' Format as number with 2 decimal places
                cell.NumberFormat = "#,##0.00"
            Else
                ' Format as integer
                cell.NumberFormat = "#,##0"
            End If
        End If
    Next cell
    
    ' Adjust row height for better readability
    ws.Rows.RowHeight = 18
    
    MsgBox "Excel sheet formatting completed!", vbInformation
End Sub