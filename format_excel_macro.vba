Sub FormatExcelSheet()
    '
    ' FormatExcelSheet Macro
    ' Formats the active Excel sheet with a title, bold headers, and auto-fits columns.
    '

    ' Add a title in cell A1 and format it
    Range("A1").Select
    ActiveCell.FormulaR1C1 = "Formatted Data Report"
    With Selection
        .Font.Name = "Calibri"
        .Font.Size = 18
        .Font.Bold = True
        .HorizontalAlignment = xlCenter
    End With

    ' Assume headers start from row 2, format them as bold
    Dim HeaderRange As Range
    Set HeaderRange = Rows("2:2")
    With HeaderRange
        .Font.Bold = True
        .HorizontalAlignment = xlCenter
    End With

    ' Auto-fit all columns based on content
    Columns("A:XFD").Select
    Selection.Columns.AutoFit

    ' Add some borders to the header row
    HeaderRange.Select
    With Selection.Borders(xlEdgeBottom)
        .LineStyle = xlContinuous
        .Weight = xlThin
        .ColorIndex = 1
    End With

    MsgBox "Excel sheet formatting complete!", vbInformation
End Sub