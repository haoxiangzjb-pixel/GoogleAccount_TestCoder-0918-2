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
    
    ' Add borders
    With Range("A1:Z100").Borders
        .LineStyle = xlContinuous
        .Weight = xlThin
        .ColorIndex = 1
    End With
    
    ' Format alternate rows
    Dim i As Integer
    For i = 2 To 100 Step 2
        Rows(i).Interior.Color = RGB(242, 242, 242)
    Next i
    
    ' Format currency columns (assuming columns D, E, F are currency)
    Range("D:E").NumberFormat = "$#,##0.00"
    
    ' Format date columns (assuming column C contains dates)
    Range("C:C").NumberFormat = "mm/dd/yyyy"
    
    MsgBox "Excel sheet formatting completed successfully!"
End Sub