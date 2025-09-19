Attribute VB_Name = "Module1"
Function SUM_CELLS(rng As Range) As Double
    SUM_CELLS = Application.WorksheetFunction.Sum(rng)
End Function