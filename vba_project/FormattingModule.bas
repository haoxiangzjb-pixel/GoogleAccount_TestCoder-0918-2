Attribute VB_Name = "FormattingModule"
Option Explicit

Sub FormatActiveSheet()
    Dim ws As Worksheet
    Dim lastRow As Long
    Dim lastCol As Long
    Dim dataRange As Range
    
    ' Set the worksheet to the currently active one
    Set ws = ActiveSheet
    
    ' Turn off screen updating for faster performance
    Application.ScreenUpdating = False
    
    ' Find the last row and column with data
    lastRow = ws.Cells(ws.Rows.Count, 1).End(xlUp).Row
    lastCol = ws.Cells(1, ws.Columns.Count).End(xlToLeft).Column
    
    ' Define the range of data
    If lastRow > 1 And lastCol > 1 Then
        Set dataRange = ws.Range(ws.Cells(1, 1), ws.Cells(lastRow, lastCol))
    Else
        ' If no data is found, exit the subroutine
        MsgBox "No data found on the worksheet."
        Application.ScreenUpdating = True
        Exit Sub
    End If
    
    ' Format the header row (assuming first row is header)
    With dataRange.Rows(1)
        .Font.Bold = True
        .Font.Color = RGB(255, 255, 255) ' White font color
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
        .Font.Name = "Calibri"
        .Font.Size = 11
    End With
    
    ' Auto-fit columns for better appearance
    dataRange.EntireColumn.AutoFit
    
    ' Turn screen updating back on
    Application.ScreenUpdating = True
    
    ' Notify user that formatting is complete
    MsgBox "Worksheet formatted successfully!"
    
End Sub