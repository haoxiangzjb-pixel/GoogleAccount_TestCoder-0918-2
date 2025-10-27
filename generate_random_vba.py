import os
import random
import string
from datetime import datetime

def generate_random_vba_filename():
    """Generate a random .vba filename"""
    # Create a random string for the filename
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    filename = f"macro_{random_string}_{timestamp}.vba"
    return filename

def create_vba_macro_content():
    """Return the VBA macro content"""
    vba_content = '''Attribute VB_Name = "FormatExcelMacro"
Sub FormatExcelSheet()
    ' This macro formats an Excel sheet with common formatting options
    
    Dim ws As Worksheet
    Set ws = ActiveSheet
    
    ' Format headers (Row 1)
    With ws.Rows(1)
        .Font.Bold = True
        .Interior.Color = RGB(54, 96, 146) ' Dark blue background
        .Font.Color = RGB(255, 255, 255) ' White text
        .HorizontalAlignment = xlCenter
    End With
    
    ' Auto-fit all columns
    ws.Columns.AutoFit
    
    ' Format the first column (A) if it contains data
    If Application.WorksheetFunction.CountA(ws.Columns(1)) > 0 Then
        ws.Columns(1).HorizontalAlignment = xlLeft
    End If
    
    ' Add borders to used range
    With ws.UsedRange.Borders
        .LineStyle = xlContinuous
        .Weight = xlThin
        .ColorIndex = 1 ' Black
    End With
    
    ' Format numbers in the sheet (if any)
    Dim cell As Range
    For Each cell In ws.UsedRange
        If IsNumeric(cell.Value) And cell.Value <> "" Then
            If InStr(cell.Value, ".") > 0 Then
                ' Format as number with 2 decimal places
                cell.NumberFormat = "#,##0.00"
            Else
                ' Format as integer
                cell.NumberFormat = "#,##0"
            End If
        End If
    Next cell
    
    ' Adjust row heights to fit content
    ws.Rows.EntireRow.AutoFit
    
    MsgBox "Excel sheet formatting completed successfully!", vbInformation
End Sub'''
    return vba_content

def main():
    # Generate a random .vba filename
    random_filename = generate_random_vba_filename()
    full_path = os.path.join("/workspace", random_filename)
    
    # Get the VBA macro content
    vba_content = create_vba_macro_content()
    
    # Write the content to the randomly named .vba file
    with open(full_path, 'w') as f:
        f.write(vba_content)
    
    print(f"VBA macro saved to: {full_path}")

if __name__ == "__main__":
    main()