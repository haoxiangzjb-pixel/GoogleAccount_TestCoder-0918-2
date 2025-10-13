Attribute VB_Name = "SumCells"
' Функция для вычисления суммы ячеек в заданном диапазоне
Function SumRange(rng As Range) As Double
    SumRange = Application.WorksheetFunction.Sum(rng)
End Function