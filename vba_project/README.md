# Excel Sheet Formatter VBA Macro

This VBA macro formats an Excel sheet with professional styling including:
- Header row formatting with bold white text on dark gray background
- Borders around all cells
- Alternating row colors (zebra striping)
- Auto-fitting columns
- Currency formatting for columns B and D

## How to Use

1. Open your Excel workbook
2. Press Alt+F11 to open the VBA editor
3. Insert a new module (Right-click on your workbook > Insert > Module)
4. Copy and paste the code from `excel_formatter.vba` into the module
5. Close the VBA editor
6. Run the macro by pressing Alt+F8, selecting "FormatExcelSheet", and clicking "Run"

## Customization

- To change which sheet gets formatted, modify the sheet name in line 11:
  `Set ws = ThisWorkbook.Sheets("Sheet1")`
  
- To change which columns get currency formatting, modify lines 54-55:
  `ws.Columns("B").NumberFormat = "$#,##0.00"`
  `ws.Columns("D").NumberFormat = "$#,##0.00"`

## Requirements

- Microsoft Excel for Windows
- This macro is designed for Excel 2010 or later