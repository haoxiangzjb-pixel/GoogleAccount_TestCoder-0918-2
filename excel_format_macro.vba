' VBA Macro to format an Excel sheet
Sub FormatExcelSheet()
    ' Set the number format for the range A1:C10 to display numbers with 2 decimal places
    Range("A1:C10").NumberFormat = "0.00"
    
    ' Apply bold formatting to the header row (Row 1)
    Rows("1:1").Font.Bold = True
    
    ' Auto-fit the column widths for the used range
    ActiveSheet.UsedRange.Columns.AutoFit
    
    ' Add a border to the range A1:C10
    With Range("A1:C10").Borders
        .LineStyle = xlContinuous
        .Weight = xlThin
    End With
End Sub