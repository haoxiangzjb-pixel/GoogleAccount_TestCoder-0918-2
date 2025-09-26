Function SumCells(rng As Range) As Double
    ' Function to calculate the sum of cells in a given range
    Dim cell As Range
    Dim total As Double
    total = 0
    For Each cell In rng
        If IsNumeric(cell.Value) Then
            total = total + cell.Value
        End If
    Next cell
    SumCells = total
End Function

Sub TestSumCells()
    ' Example of how to use the SumCells function
    Dim result As Double
    ' Calculate the sum of the range A1:C3
    result = SumCells(Range("A1:C3"))
    ' Print the result to the Immediate Window (Ctrl+G in VBA editor)
    Debug.Print "The sum of A1:C3 is: " & result
End Sub
