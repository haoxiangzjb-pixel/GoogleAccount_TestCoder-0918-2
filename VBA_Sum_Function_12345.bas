' VBA Function to calculate sum of cells
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

' Alternative function that takes multiple ranges
Function SumMultipleRanges(ParamArray ranges() As Variant) As Double
    Dim i As Integer
    Dim rng As Range
    Dim cell As Range
    Dim total As Double
    
    total = 0
    
    For i = LBound(ranges) To UBound(ranges)
        If TypeName(ranges(i)) = "Range" Then
            Set rng = ranges(i)
            For Each cell In rng
                If IsNumeric(cell.Value) Then
                    total = total + cell.Value
                End If
            Next cell
        End If
    Next i
    
    SumMultipleRanges = total
End Function

' Subroutine to demonstrate usage
Sub ExampleUsage()
    ' Example of how to use the SumCells function
    Dim result As Double
    result = SumCells(Range("A1:A10"))
    MsgBox "Sum of A1:A10 is: " & result
End Sub