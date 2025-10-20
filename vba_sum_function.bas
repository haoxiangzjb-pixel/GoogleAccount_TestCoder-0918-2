' VBA function to calculate the sum of cells
Function SumCells(rng As Range) As Double
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

' Alternative version that can handle multiple ranges
Function SumMultipleRanges(ParamArray ranges() As Variant) As Double
    Dim i As Integer
    Dim rng As Range
    Dim cell As Range
    Dim total As Double
    
    total = 0
    
    For i = 0 To UBound(ranges)
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