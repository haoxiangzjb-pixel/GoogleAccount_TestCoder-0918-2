Sub FormatExcelSheet()
    '
    ' FormatExcelSheet Macro
    ' This macro formats the active Excel sheet by setting column widths, row heights, and applying basic styles.
    '

    ' Set the width for all columns
    Columns("A:Z").ColumnWidth = 15

    ' Set the height for the first row (header row)
    Rows("1:1").RowHeight = 20

    ' Format the header row (Row 1)
    With Rows("1:1")
        .Font.Bold = True
        .Font.Color = RGB(255, 255, 255) ' White font color
        .Interior.Color = RGB(0, 100, 200) ' Blue background color
        .HorizontalAlignment = xlCenter
    End With

    ' Add borders to the used range
    Dim ws As Worksheet
    Set ws = ActiveSheet
    With ws.UsedRange.Borders
        .LineStyle = xlContinuous
        .Weight = xlThin
        .ColorIndex = 1 ' Black color
    End With

    ' Auto-fit the column widths based on content (optional, can be used instead of fixed width)
    ' Columns("A:Z").AutoFit

End Sub