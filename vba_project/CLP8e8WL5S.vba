Attribute VB_Name = "FormattingModule"
Option Explicit

Sub FormatSheet()

    Dim ws As Worksheet
    Dim lastRow As Long
    Dim lastCol As Long
    Dim dataRange As Range
    
    ' Set the worksheet to the active sheet
    Set ws = ActiveSheet
    
    ' Find the last row and column with data
    lastRow = ws.Cells(ws.Rows.Count, 1).End(xlUp).Row
    lastCol = ws.Cells(1, ws.Columns.Count).End(xlToLeft).Column
    
    ' Define the data range
    If lastRow >= 1 And lastCol >= 1 Then
        Set dataRange = ws.Range(ws.Cells(1, 1), ws.Cells(lastRow, lastCol))
    Else
        MsgBox "No data found on the sheet."
        Exit Sub
    End If
    
    ' Apply formatting
    With dataRange
        ' Auto-fit columns
        .EntireColumn.AutoFit
        
        ' Format header row
        .Rows(1).Interior.Color = RGB(200, 200, 200) ' Light gray background
        .Rows(1).Font.Bold = True
        
        ' Add borders around the entire data range
        .Borders.LineStyle = xlContinuous
        .Borders.Weight = xlThin
    End With
    
    MsgBox "Sheet formatted successfully!"

End Sub