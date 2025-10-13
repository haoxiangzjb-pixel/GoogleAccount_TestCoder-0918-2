Sub FormatExcelSheet()
    ' Disable screen updating for better performance
    Application.ScreenUpdating = False

    ' Format the header row (Row 1)
    With Rows(1)
        .Font.Bold = True
        .Interior.Color = RGB(156, 194, 227) ' Light blue background
        .HorizontalAlignment = xlCenter
    End With

    ' Auto-fit all columns
    Columns.AutoFit

    ' Add borders to the used range
    With ActiveSheet.UsedRange.Borders
        .LineStyle = xlContinuous
        .Weight = xlThin
        .ColorIndex = 1 ' Black
    End With

    ' Re-enable screen updating
    Application.ScreenUpdating = True

    MsgBox "Excel sheet formatted successfully!"
End Sub