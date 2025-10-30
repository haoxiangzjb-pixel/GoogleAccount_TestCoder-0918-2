' VBA Macro to format an Excel sheet
Sub FormatExcelSheet()
    ' Format headers
    With Range("A1:Z1")
        .Font.Bold = True
        .Interior.Color = RGB(79, 129, 189)
        .Font.Color = RGB(255, 255, 255)
        .HorizontalAlignment = xlCenter
    End With
    
    ' Auto-fit columns
    Columns("A:Z").AutoFit
    
    ' Add borders to the used range
    With ActiveSheet.UsedRange.Borders
        .LineStyle = xlContinuous
        .Weight = xlThin
        .ColorIndex = 1
    End With
    
    ' Format the first column as date if it contains dates
    Dim cell As Range
    For Each cell In Range("A2:A" & Cells(Rows.Count, 1).End(xlUp).Row)
        If IsDate(cell.Value) Then
            cell.NumberFormat = "mm/dd/yyyy"
        End If
    Next cell
    
    ' Highlight cells with values greater than 100 in red
    Dim dataRange As Range
    Set dataRange = Range("A2:Z" & Cells(Rows.Count, 1).End(xlUp).Row)
    With dataRange
        .FormatConditions.Add Type:=xlCellValue, Operator:=xlGreater, Formula1:="=100"
        .FormatConditions(.FormatConditions.Count).Interior.Color = RGB(255, 0, 0)
        .FormatConditions(.FormatConditions.Count).Font.Color = RGB(255, 255, 255)
    End With
    
    MsgBox "Excel sheet formatted successfully!"
End Sub