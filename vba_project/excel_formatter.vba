Attribute VB_Name = "FormattingModule"
Option Explicit

Sub FormatExcelSheet()
    Dim ws As Worksheet
    Dim lastRow As Long
    Dim lastCol As Long
    Dim dataRange As Range
    
    ' Set the worksheet (you can change "Sheet1" to your sheet's name)
    Set ws = ThisWorkbook.Sheets("Sheet1")
    
    ' Find the last row and column with data
    lastRow = ws.Cells(ws.Rows.Count, 1).End(xlUp).Row
    lastCol = ws.Cells(1, ws.Columns.Count).End(xlToLeft).Column
    
    ' Create a range object for the data
    Set dataRange = ws.Range(ws.Cells(1, 1), ws.Cells(lastRow, lastCol))
    
    ' Format the header row
    With ws.Range(ws.Cells(1, 1), ws.Cells(1, lastCol))
        .Font.Bold = True
        .Font.Size = 12
        .Font.Color = RGB(255, 255, 255) ' White text
        .Interior.Color = RGB(50, 50, 50) ' Dark gray background
        .HorizontalAlignment = xlCenter
    End With
    
    ' Format the entire data range
    With dataRange
        .Borders(xlEdgeLeft).LineStyle = xlContinuous
        .Borders(xlEdgeTop).LineStyle = xlContinuous
        .Borders(xlEdgeBottom).LineStyle = xlContinuous
        .Borders(xlEdgeRight).LineStyle = xlContinuous
        .Borders(xlInsideVertical).LineStyle = xlContinuous
        .Borders(xlInsideHorizontal).LineStyle = xlContinuous
        .Borders.LineStyle = xlContinuous
        .EntireColumn.AutoFit
    End With
    
    ' Format alternating rows (zebra striping)
    Dim i As Long
    For i = 2 To lastRow
        If i Mod 2 = 0 Then
            ws.Range(ws.Cells(i, 1), ws.Cells(i, lastCol)).Interior.Color = RGB(240, 240, 240) ' Light gray
        Else
            ws.Range(ws.Cells(i, 1), ws.Cells(i, lastCol)).Interior.Color = RGB(255, 255, 255) ' White
        End If
    Next i
    
    ' Add some number formatting for columns that might contain currency
    ' Assuming column B and D might be currency (you can modify as needed)
    On Error Resume Next ' In case the column doesn't exist
    ws.Columns("B").NumberFormat = "$#,##0.00"
    ws.Columns("D").NumberFormat = "$#,##0.00"
    On Error GoTo 0
    
    MsgBox "Sheet formatting complete!", vbInformation
End Sub