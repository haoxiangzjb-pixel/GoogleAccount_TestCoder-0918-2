Attribute VB_Name = "FormatExcelSheet"
Sub FormatExcelSheet()
    '
    ' FormatExcelSheet Macro
    ' Formats the active Excel sheet with a title, headers, and basic styling.
    '

    ' Set the title in cell A1
    Range("A1").Value = "Monthly Sales Report"
    Range("A1").Font.Bold = True
    Range("A1").Font.Size = 16
    Range("A1").Interior.Color = RGB(79, 129, 189)
    Range("A1").Font.Color = RGB(255, 255, 255)
    Range("A1:C1").Merge

    ' Set headers in row 3
    Range("A3").Value = "Product"
    Range("B3").Value = "Units Sold"
    Range("C3").Value = "Revenue"
    Range("A3:C3").Font.Bold = True
    Range("A3:C3").Interior.Color = RGB(217, 225, 242)

    ' Format the header row
    Range("A3:C3").Borders.LineStyle = xlContinuous
    Range("A3:C3").Borders.Weight = xlThin

    ' Format the data range (example data range A4:C10)
    With Range("A4:C10")
        .Borders.LineStyle = xlContinuous
        .Borders.Weight = xlThin
        .VerticalAlignment = xlTop
    End With

    ' Auto-fit columns
    Columns("A:C").AutoFit

    ' Format the Revenue column (C) as Currency
    Columns("C").NumberFormat = "$#,##0.00"

End Sub