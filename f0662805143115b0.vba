Sub FillCellsLoop()
    Dim i As Integer
    Dim j As Integer
    
    ' 使用循环填充单元格 A1:E10
    For i = 1 To 10
        For j = 1 To 5
            Cells(i, j).Value = "R" & i & "C" & j
        Next j
    Next i
    
    MsgBox "单元格填充完成！"
End Sub
