Sub FormatExcelSheet()
    ' VBA Macro to format an Excel sheet
    
    Dim ws As Worksheet
    Dim lastRow As Long
    Dim lastCol As Long
    Dim rng As Range
    Dim i As Long, j As Long
    
    ' Set the worksheet (active sheet)
    Set ws = ActiveSheet
    
    ' Add sample data if sheet is empty
    If Application.WorksheetFunction.CountA(ws.Cells) = 0 Then
        ' Add headers
        ws.Range("A1").Value = "ID"
        ws.Range("B1").Value = "Name"
        ws.Range("C1").Value = "Department"
        ws.Range("D1").Value = "Salary"
        ws.Range("E1").Value = "Start Date"
        
        ' Add sample data
        For i = 2 To 10
            ws.Cells(i, 1).Value = i - 1
            ws.Cells(i, 2).Value = "Employee " & (i - 1)
            ws.Cells(i, 3).Value = Choose((i Mod 5) + 1, "HR", "IT", "Finance", "Marketing", "Operations")
            ws.Cells(i, 4).Value = 30000 + (i - 1) * 5000
            ws.Cells(i, 5).Value = DateSerial(2020 + (i Mod 3), 1 + (i Mod 12), 1 + (i Mod 28))
        Next i
    End If
    
    ' Find last row and column with data
    lastRow = ws.Cells(ws.Rows.Count, 1).End(xlUp).Row
    lastCol = ws.Cells(1, ws.Columns.Count).End(xlToLeft).Column
    
    ' Define the data range
    Set rng = ws.Range(ws.Cells(1, 1), ws.Cells(lastRow, lastCol))
    
    ' Format headers
    With ws.Range(ws.Cells(1, 1), ws.Cells(1, lastCol))
        .Font.Bold = True
        .Font.Color = RGB(255, 255, 255)
        .Interior.Color = RGB(70, 130, 180) ' Steel Blue
        .HorizontalAlignment = xlCenter
        .VerticalAlignment = xlCenter
        .RowHeight = 25
    End With
    
    ' Format data range
    With rng
        .Borders.LineStyle = xlContinuous
        .Borders.Color = RGB(128, 128, 128)
        .Borders.Weight = xlThin
        .Font.Name = "Calibri"
        .Font.Size = 11
    End With
    
    ' Auto-fit columns
    ws.Columns.AutoFit
    
    ' Format salary column as currency
    ws.Columns(4).NumberFormat = "$#,##0.00"
    
    ' Format date column
    ws.Columns(5).NumberFormat = "mm/dd/yyyy"
    
    ' Apply alternating row colors (zebra striping)
    For i = 2 To lastRow
        If i Mod 2 = 0 Then
            ws.Range(ws.Cells(i, 1), ws.Cells(i, lastCol)).Interior.Color = RGB(242, 242, 242)
        End If
    Next i
    
    ' Add a title above the table
    ws.Range("A1").Insert Shift:=xlDown
    ws.Range("A1").MergeArea.Merge
    ws.Range("A1").Resize(1, lastCol).Merge
    ws.Range("A1").Value = "Employee Directory"
    With ws.Range("A1").Resize(1, lastCol)
        .Font.Bold = True
        .Font.Size = 16
        .Font.Color = RGB(255, 255, 255)
        .Interior.Color = RGB(41, 98, 255) ' Royal Blue
        .HorizontalAlignment = xlCenter
        .VerticalAlignment = xlCenter
        .RowHeight = 30
    End With
    
    ' Freeze panes at header row
    ws.Range("A3").Select
    ActiveWindow.FreezePanes = True
    
    ' Add filter to header row
    ws.Range(ws.Cells(2, 1), ws.Cells(2, lastCol)).AutoFilter
    
    MsgBox "Excel sheet has been formatted successfully!", vbInformation, "Formatting Complete"
    
End Sub
