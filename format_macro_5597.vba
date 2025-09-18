Sub FormatExcelSheet()
    ' Declare worksheet variable
    Dim ws As Worksheet
    Set ws = ActiveSheet
    
    ' Format the header row
    With ws.Range("A1:E1")
        .Font.Bold = True
        .Font.Size = 12
        .Interior.Color = RGB(200, 200, 200)
        .Borders.LineStyle = xlContinuous
    End With
    
    ' Auto-fit columns
    ws.Columns("A:E").AutoFit
    
    ' Add some sample data
    ws.Range("A1") = "Name"
    ws.Range("B1") = "Age"
    ws.Range("C1") = "Department"
    ws.Range("D1") = "Salary"
    ws.Range("E1") = "Join Date"
    
    ws.Range("A2") = "John Smith"
    ws.Range("B2") = 35
    ws.Range("C2") = "Marketing"
    ws.Range("D2") = 50000
    ws.Range("E2") = "1/15/2020"
    
    ws.Range("A3") = "Jane Doe"
    ws.Range("B3") = 28
    ws.Range("C3") = "Engineering"
    ws.Range("D3") = 65000
    ws.Range("E3") = "6/1/2019"
    
    ' Format currency column
    ws.Range("D2:D3").NumberFormat = "$#,##0.00"
    
    ' Format date column
    ws.Range("E2:E3").NumberFormat = "mm/dd/yyyy"
    
    MsgBox "Sheet formatting complete!"
End Sub