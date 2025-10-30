import os
import random
import string
from datetime import datetime

def generate_random_filename(extension=".vba"):
    """Generate a random filename with the given extension."""
    # Create a random string of 10 characters
    random_string = ''.join(random.choices(string.ascii_letters + string.digits, k=10))
    # Add timestamp to make it more unique
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    return f"{random_string}_{timestamp}{extension}"

def save_vba_macro_to_random_file():
    """Save the VBA macro to a randomly named .vba file."""
    # The VBA macro content
    vba_content = '''\' VBA Macro to format an Excel sheet
Sub FormatExcelSheet()
    ' Format headers
    With Range("A1:Z1")
        .Font.Bold = True
        .Interior.Color = RGB(79, 129, 189)
        .Font.Color = RGB(255, 255, 255)
        .HorizontalAlignment = xlCenter
    End With
    
    ' Auto-fit columns
    Columns("A:Z").AutoFit
    
    ' Add borders to the used range
    With ActiveSheet.UsedRange.Borders
        .LineStyle = xlContinuous
        .Weight = xlThin
        .ColorIndex = 1
    End With
    
    ' Format the first column as date if it contains dates
    Dim cell As Range
    For Each cell In Range("A2:A" & Cells(Rows.Count, 1).End(xlUp).Row)
        If IsDate(cell.Value) Then
            cell.NumberFormat = "mm/dd/yyyy"
        End If
    Next cell
    
    ' Highlight cells with values greater than 100 in red
    Dim dataRange As Range
    Set dataRange = Range("A2:Z" & Cells(Rows.Count, 1).End(xlUp).Row)
    With dataRange
        .FormatConditions.Add Type:=xlCellValue, Operator:=xlGreater, Formula1:="=100"
        .FormatConditions(.FormatConditions.Count).Interior.Color = RGB(255, 0, 0)
        .FormatConditions(.FormatConditions.Count).Font.Color = RGB(255, 255, 255)
    End With
    
    MsgBox "Excel sheet formatted successfully!"
End Sub'''

    # Generate a random filename
    random_filename = generate_random_filename(".vba")
    
    # Write the VBA content to the randomly named file
    with open(random_filename, 'w') as file:
        file.write(vba_content)
    
    print(f"VBA macro saved to: {random_filename}")
    return random_filename

if __name__ == "__main__":
    save_vba_macro_to_random_file()