' VBA function to calculate the sum of cells
Function SumCells(rng As Range) As Double
    ' This function takes a range and returns the sum of all numeric values in that range
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

' Alternative version that accepts a range address as string
Function SumCellsByAddress(address As String) As Double
    Dim rng As Range
    Set rng = Range(address)
    
    Dim cell As Range
    Dim total As Double
    
    total = 0
    
    For Each cell In rng
        If IsNumeric(cell.Value) Then
            total = total + cell.Value
        End If
    Next cell
    
    SumCellsByAddress = total
End Function

' Subroutine to demonstrate usage
Sub ExampleUsage()
    ' Example of how to use the function
    Dim result As Double
    result = SumCells(Range("A1:A10"))
    MsgBox "Sum of A1:A10 is: " & result
    
    ' Alternative usage
    result = SumCellsByAddress("B1:B5")
    MsgBox "Sum of B1:B5 is: " & result
End Sub