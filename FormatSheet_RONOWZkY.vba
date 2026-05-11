Sub FormatExcelSheet()
    Dim ws As Worksheet
    Dim lastRow As Long, lastCol As Long
    Dim dataRange As Range
    Dim headerRange As Range
    
    ' Set the active worksheet
    Set ws = ActiveSheet
    
    ' Check if sheet is empty, if so add sample data
    If Application.WorksheetFunction.CountA(ws.Cells) = 0 Then
        ' Add headers
        ws.Range("A1:E1").Value = Array("ID", "Name", "Department", "Salary", "Start Date")
        
        ' Add sample data
        ws.Range("A2").Value = 1001
        ws.Range("B2").Value = "John Smith"
        ws.Range("C2").Value = "Sales"
        ws.Range("D2").Value = 55000
        ws.Range("E2").Value = DateSerial(2023, 1, 15)
        
        ws.Range("A3").Value = 1002
        ws.Range("B3").Value = "Jane Doe"
        ws.Range("C3").Value = "Marketing"
        ws.Range("D3").Value = 62000
        ws.Range("E3").Value = DateSerial(2022, 6, 1)
        
        ws.Range("A4").Value = 1003
        ws.Range("B4").Value = "Bob Johnson"
        ws.Range("C4").Value = "IT"
        ws.Range("D4").Value = 75000
        ws.Range("E4").Value = DateSerial(2021, 3, 20)
        
        ws.Range("A5").Value = 1004
        ws.Range("B5").Value = "Alice Williams"
        ws.Range("C5").Value = "HR"
        ws.Range("D5").Value = 58000
        ws.Range("E5").Value = DateSerial(2023, 9, 10)
    End If
    
    ' Find the last row and column with data
    lastRow = ws.Cells(ws.Rows.Count, 1).End(xlUp).Row
    lastCol = ws.Cells(1, ws.Columns.Count).End(xlToLeft).Column
    
    ' Define ranges
    Set headerRange = ws.Range(ws.Cells(1, 1), ws.Cells(1, lastCol))
    Set dataRange = ws.Range(ws.Cells(1, 1), ws.Cells(lastRow, lastCol))
    
    ' Insert a title row above headers
    ws.Rows(1).Insert Shift:=xlDown
    ws.Range("A1").Value = "Employee Directory"
    ws.Range("A1").Merge Area:=ws.Range(ws.Cells(1, 1), ws.Cells(1, lastCol))
    
    With ws.Range("A1")
        .Font.Bold = True
        .Font.Size = 16
        .Font.Color = RGB(255, 255, 255)
        .HorizontalAlignment = xlCenter
        .VerticalAlignment = xlCenter
        .Interior.Color = RGB(65, 105, 225) ' Royal Blue
    End With
    
    ' Update header range to new position
    Set headerRange = ws.Range(ws.Cells(2, 1), ws.Cells(2, lastCol))
    Set dataRange = ws.Range(ws.Cells(2, 1), ws.Cells(lastRow + 1, lastCol))
    
    ' Format headers
    With headerRange
        .Font.Bold = True
        .Font.Color = RGB(255, 255, 255)
        .Interior.Color = RGB(70, 130, 180) ' Steel Blue
        .HorizontalAlignment = xlCenter
        .VerticalAlignment = xlCenter
        .Borders.LineStyle = xlContinuous
        .Borders.Color = RGB(128, 128, 128)
        .RowHeight = 25
    End With
    
    ' Format data range
    With dataRange
        .Font.Name = "Calibri"
        .Font.Size = 11
        .Borders.LineStyle = xlContinuous
        .Borders.Color = RGB(192, 192, 192)
        .WrapText = False
    End With
    
    ' Auto-fit columns
    ws.Columns.AutoFit
    
    ' Format Salary column (column D) as currency
    ws.Columns(4).NumberFormat = "$#,##0.00"
    
    ' Format Start Date column (column E) as date
    ws.Columns(5).NumberFormat = "mm/dd/yyyy"
    
    ' Center align ID column
    ws.Columns(1).HorizontalAlignment = xlCenter
    
    ' Apply alternating row colors (zebra striping)
    Dim i As Long
    For i = 3 To lastRow + 1
        If i Mod 2 = 0 Then
            ws.Range(ws.Cells(i, 1), ws.Cells(i, lastCol)).Interior.Color = RGB(242, 242, 242)
        End If
    Next i
    
    ' Freeze panes below header
    ws.Range("A3").Select
    ActiveWindow.FreezePanes = True
    
    ' Enable AutoFilter on headers
    headerRange.AutoFilter
    
    ' Add a message
    MsgBox "Formatting complete!", vbInformation, "Success"
    
End Sub
