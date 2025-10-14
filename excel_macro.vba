Sub FormatExcelSheet()
    '
    ' FormatExcelSheet Macro
    ' This macro formats the active Excel sheet by adding headers, bolding them, auto-fitting columns, and adding borders.
    '

    ' Define the range for the header row (assuming 5 columns: A to E)
    Dim HeaderRange As Range
    Set HeaderRange = Range("A1:E1")

    ' Add sample header text (modify as needed)
    HeaderRange.Value = Array("ID", "Name", "Department", "Salary", "Start Date")

    ' Format the header row
    With HeaderRange
        .Font.Bold = True
        .Interior.Color = RGB(200, 200, 200) ' Light grey background
        .Borders.LineStyle = xlContinuous
    End With

    ' Auto-fit all columns in the used range
    Cells.EntireColumn.AutoFit

    ' Optional: Add some sample data in the second row
    Range("A2").Value = 1
    Range("B2").Value = "John Doe"
    Range("C2").Value = "Finance"
    Range("D2").Value = 75000
    Range("E2").Value = "01-Jan-2023"

    MsgBox "Excel sheet formatted successfully!"
End Sub