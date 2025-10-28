' VBA Macro to Format an Excel Sheet
Sub FormatExcelSheet()
    ' Declare variables
    Dim ws As Worksheet
    Dim lastRow As Long
    Dim lastCol As Long
    
    ' Set the active worksheet
    Set ws = ActiveSheet
    
    ' Auto-fit all columns
    ws.Columns.AutoFit
    
    ' Format header row (Row 1)
    With ws.Rows(1)
        .Font.Bold = True
        .Interior.Color = RGB(68, 114, 196) ' Blue background
        .Font.Color = RGB(255, 255, 255)     ' White text
        .HorizontalAlignment = xlCenter
    End With
    
    ' Format the entire data range with borders
    lastRow = ws.Cells(ws.Rows.Count, 1).End(xlUp).Row
    lastCol = ws.Cells(1, ws.Columns.Count).End(xlToLeft).Column
    
    With ws.Range(ws.Cells(1, 1), ws.Cells(lastRow, lastCol)).Borders
        .LineStyle = xlContinuous
        .Weight = xlThin
    End With
    
    ' Format numeric columns with number format
    Dim col As Long
    For col = 1 To lastCol
        If IsNumeric(ws.Cells(2, col).Value) Or IsNumeric(ws.Cells(3, col).Value) Then
            ws.Columns(col).NumberFormat = "#,##0.00"
        End If
    Next col
    
    ' Add alternating row colors for better readability
    Dim rng As Range
    Set rng = ws.Range(ws.Cells(2, 1), ws.Cells(lastRow, lastCol))
    
    Dim i As Long
    For i = 2 To lastRow
        If i Mod 2 = 0 Then
            ws.Rows(i).Interior.Color = RGB(242, 242, 242) ' Light gray
        End If
    Next i
    
    ' Adjust row height
    ws.Rows.RowHeight = 15
    
    MsgBox "Excel sheet formatting completed!", vbInformation
End Sub

' Main subroutine to run the formatting
Sub Main()
    Call FormatExcelSheet
End Sub