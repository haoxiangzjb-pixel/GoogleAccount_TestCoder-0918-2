Attribute VB_Name = "SumCells"
Sub CalculateSum()
    ' Объявляем переменные
    Dim rng As Range
    Dim cell As Range
    Dim sumResult As Double

    ' Запрашиваем у пользователя диапазон
    On Error GoTo ErrorHandler
    Set rng = Application.InputBox("Выберите диапазон для суммирования:", "Ввод диапазона", Type:=8)
    On Error GoTo 0

    ' Проверяем, что диапазон выбран
    If rng Is Nothing Then
        MsgBox "Операция отменена пользователем.", vbExclamation
        Exit Sub
    End If

    ' Вычисляем сумму
    sumResult = 0
    For Each cell In rng
        If IsNumeric(cell.Value) Then
            sumResult = sumResult + cell.Value
        End If
    Next cell

    ' Выводим результат в ячейку ниже последней ячейки в диапазоне
    Dim outputCell As Range
    Set outputCell = rng.Cells(rng.Rows.Count, rng.Columns.Count).Offset(1, 0)
    outputCell.Value = "Сумма: " & sumResult

    ' Опционально: выводим сообщение
    MsgBox "Сумма диапазона " & rng.Address & " равна " & sumResult, vbInformation, "Результат"

    Exit Sub

ErrorHandler:
    MsgBox "Произошла ошибка при вводе диапазона.", vbCritical
End Sub