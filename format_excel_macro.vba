Attribute VB_Name = "FormatExcelMacro"
Sub FormatExcelSheet()
    ' Format an Excel sheet with various formatting options
    
    Dim ws As Worksheet
    Set ws = ActiveSheet
    
    ' Format headers (row 1)
    With ws.Rows(1)
        .Font.Bold = True
        .Interior.Color = RGB(68, 114, 196) ' Blue background
        .Font.Color = RGB(255, 255, 255) ' White text
        .HorizontalAlignment = xlCenter
    End With
    
    ' Auto-fit all columns
    ws.Columns.AutoFit
    
    ' Format alternate rows
    Dim lastRow As Long
    Dim i As Long
    lastRow = ws.Cells(ws.Rows.Count, 1).End(xlUp).Row
    
    For i = 2 To lastRow
        If i Mod 2 = 0 Then
            ws.Rows(i).Interior.Color = RGB(242, 242, 242) ' Light gray for even rows
        End If
    Next i
    
    ' Add borders to the data range
    Dim dataRange As Range
    Set dataRange = ws.Range("A1").CurrentRegion
    With dataRange.Borders
        .LineStyle = xlContinuous
        .Weight = xlThin
        .ColorIndex = 1 ' Black
    End With
    
    ' Format numbers in the sheet
    Dim cell As Range
    For Each cell In dataRange
        If IsNumeric(cell.Value) And cell.Value <> "" Then
            If InStr(cell.Text, ".") > 0 Then
                cell.NumberFormat = "#,##0.00" ' Format decimals
            Else
                cell.NumberFormat = "#,##0" ' Format integers
            End If
        End If
    Next cell
    
    MsgBox "Excel sheet formatting completed successfully!", vbInformation
End Sub