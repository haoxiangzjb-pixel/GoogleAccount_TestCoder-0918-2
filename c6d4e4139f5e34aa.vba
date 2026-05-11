Sub FillCellsUsingLoop()
    Dim i As Integer
    Dim j As Integer
    
    ' 使用双重循环填充 A1:E10 区域
    For i = 1 To 10
        For j = 1 To 5
            Cells(i, j).Value = "R" & i & "C" & j
        Next j
    Next i
    
    MsgBox "单元格填充完成！", vbInformation
End Sub
