' VBA Macro to format an Excel sheet
Sub FormatExcelSheet()
    '
    ' FormatExcelSheet Macro
    '

    ' Set the font name and size for the entire sheet
    Cells.Font.Name = "Calibri"
    Cells.Font.Size = 11

    ' Auto-fit column widths
    Columns.AutoFit

    ' Format the header row (Row 1)
    With Rows(1)
        .Font.Bold = True
        .Font.Color = RGB(255, 255, 255) ' White text
        .Interior.Color = RGB(0, 176, 240) ' Blue background
        .HorizontalAlignment = xlCenter
    End With

    ' Add borders to the used range
    Dim ws As Worksheet
    Set ws = ActiveSheet
    With ws.UsedRange.Borders
        .LineStyle = xlContinuous
        .Weight = xlThin
        .ColorIndex = xlAutomatic
    End With

    ' Format any cells containing numbers as Currency (optional)
    ' Uncomment the following lines if needed
    ' Dim rng As Range
    ' Set rng = ws.UsedRange.SpecialCells(xlCellTypeConstants, xlNumbers)
    ' rng.NumberFormat = "$#,##0.00"

End Sub