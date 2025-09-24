Sub FormatSheet()
    ' Set the active sheet or target a specific sheet
    Dim ws As Worksheet
    Set ws = ActiveSheet ' Or use Worksheets("Sheet1") to target a specific sheet

    ' Format headers in row 1
    With ws.Rows(1)
        .Font.Bold = True
        .Interior.Color = RGB(180, 180, 180) ' Light gray background
        .HorizontalAlignment = xlCenter
    End With

    ' Auto-fit all columns
    ws.Columns.AutoFit

    ' Format the first column (A) if it contains IDs or labels
    ws.Columns(1).Font.Name = "Arial"
    ws.Columns(1).Font.Size = 10

    ' Add borders to the used range
    ws.UsedRange.Borders.LineStyle = xlContinuous

    ' Set the number format for the second column (B) to currency (optional)
    ' ws.Columns(2).NumberFormat = "$#,##0.00"

    MsgBox "Formatting complete!"
End Sub