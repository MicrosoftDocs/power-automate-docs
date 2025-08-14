---
title: Excel actions reference
description: Display the Excel actions.
author: jpapadimitriou
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: reference
ms.date: 08/14/2025
ms.author: iomavrid
ms.reviewer: matp
contributors:
- jpapadimitriou
- Yiannismavridis
- NikosMoutzourakis
- PetrosFeleskouras
- AntoniosDanas
- DanaMartens
search.audienceType: 
  - flowmaker
  - enduser
---

# Excel actions

After setting an Excel instance, either with the **Launch Excel** or the **Attach to running Excel** action, you can further handle your Excel worksheets.

To read and extract data from an Excel document, use the **Read from Excel worksheet** action. You can retrieve the value of a single cell or a data table. The following example reads the cells A1 through E5:

:::image type="content" source="media\excel\read-from-excel-action-properties.png" alt-text="Screenshot of the Read from Excel worksheet action.":::



The “Get cell(s) contents as” parameter determines how the value from an Excel cell is interpreted and returned in Power Automate for desktop. You can choose from the following options:
- Typed values
  - Interprets the cell’s data type (e.g., DateTime, numeric, Boolean) and returns the value using the same type. This ensures consistency with how Excel internally stores the data.
- Plain text
  - Returns exactly what is written in the cell, without interpreting its type or formatting. Ideal when you want the raw text as seen in Excel.
- Formatted text values
  - Similar to Typed values, but the result is returned as a string that reflects the cell’s formatting (e.g., date format, currency symbols). Useful when you want to preserve the visual representation of the value.

Example

A cell contains the value '8/13/2025 11:43:45 AM' and is formatted as Long Date. In Excel, the visible content in the cell is 'Thursday, August 13, 2025', while the full value (including time) is visible only in the formula bar. This formatting can be customized by the user. Depending on the selected option:
- Typed values: The result is 8/13/2505 11:43:45 AM and type in Power Automate for desktop is DateTime.
- Plain text: The result is "Thursday, August 13, 2025" and type in Power Automate for desktop is Text.
- Formatted text values: The result is "8/13/2505 11:43:45 AM" and type in Power Automate for desktop is Text.

When the flow runs, the action stores the data in a data table variable:

:::image type="content" source="media/excel/datatable-values.png" alt-text="Screenshot of a data table displayed in the value viewer.":::

To write data to an Excel spreadsheet, use the **Write to Excel worksheet** action. This action can write any static data or variable to a specified cell or multiple cells in an Excel worksheet.

The following example writes the previously mentioned data table to cell A51:

:::image type="content" source="media/excel/write-to-excel-action-properties.png" alt-text="Screenshot of the Write to Excel worksheet action.":::

Each cell in the data table populates the corresponding cell in the workbook. The result is that the A51 to E55 cell range is filled with the contents of the data table.

:::image type="content" source="media/excel/excel-data-written.png" alt-text="Screenshot of written Excel data.":::

## <a name="resizecolumnsorrowsaction"></a> Resize columns/rows in Excel worksheet

Resizes a selection of columns or rows in the active worksheet of an Excel instance.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Excel instance|No|[Excel instance](../variable-data-types.md#instances)||Specify the Excel instance. This variable must have been previously specified in a Launch Excel action.|
|Resize target|N/A|Column, Row|Column|Specify whether to resize columns or rows|
|Selection range|N/A|Single, Range, All available|Single|Specify whether to select a single column/row, a range of columns/rows or all the available columns/rows in the active worksheet|
|Column|No|[Text value](../variable-data-types.md#text-value)||The column's index number or letter. Column numbering starts from index 1.|
|Start column|No|[Text value](../variable-data-types.md#text-value)||The index or letter of the first column. Column numbering starts from index 1.|
|End column|No|[Text value](../variable-data-types.md#text-value)||The index or letter of the last column. Column numbering starts from index 1.|
|Row|No|[Numeric value](../variable-data-types.md#numeric-value)||The row's index number. The numbering starts from 1.|
|Start row|No|[Numeric value](../variable-data-types.md#numeric-value)||The index or the first row. The numbering starts from 1.|
|End row|No|[Numeric value](../variable-data-types.md#numeric-value)||The index or the last row. The numbering starts from 1.|
|Resize type|N/A|Autofit, Custom size|Autofit|Specify whether to autofit selected columns/rows or set a custom size|
|Width|No|[Numeric value](../variable-data-types.md#numeric-value)||The width of the selected columns|
|Height|No|[Numeric value](../variable-data-types.md#numeric-value)||The height of the selected rows|

### Variables produced

This action doesn't produce any variables.

### <a name="resizecolumnsorrowsaction_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to resize columns/rows|Indicates a problem while resizing columns/rows|

## <a name="runmacro"></a> Run Excel macro

Runs a specified macro on the document of an Excel instance.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Excel instance|No|[Excel instance](../variable-data-types.md#instances)||The Excel instance to work with. This variable must have been previously specified in a Launch Excel action.|
|Macro|No|[Text value](../variable-data-types.md#text-value)||The macro to run. The text should consist of the name of the macro, followed by any arguments (optional), all separated by semicolons.|

### Variables produced

This action doesn't produce any variables.

### <a name="runmacro_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to run macro|Indicates a problem running the specified macro|

## <a name="getactiveworksheet"></a> Get active Excel worksheet

Retrieves an Excel document's active worksheet.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Excel instance|No|[Excel instance](../variable-data-types.md#instances)||The Excel instance to work with. This variable must have been previously specified in a Launch Excel action.|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|SheetName|[Text value](../variable-data-types.md#text-value)|The name of the active worksheet|
|SheetIndex|[Numeric value](../variable-data-types.md#numeric-value)|The index of the active worksheet|

### <a name="getactiveworksheet_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to retrieve active worksheet|Indicates a problem retrieving the active worksheet|

## <a name="getallworksheets"></a> Get all Excel worksheets

Retrieves all worksheet names of an Excel document.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Excel instance|No|[Excel instance](../variable-data-types.md#instances)||Specify the Excel instance. This variable must have been previously specified in a Launch Excel action.|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|SheetNames|[List](../variable-data-types.md#list) of [Text values](../variable-data-types.md#text-value)|The names of all worksheets|

### <a name="getallworksheets_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to retrieve all worksheet names|Indicates a problem retrieving the names of the Excel worksheet|

## <a name="deleteworksheet"></a> Delete Excel worksheet

Deletes a specific worksheet from an Excel instance.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Excel instance|No|[Excel instance](../variable-data-types.md#instances)||The Excel instance to work with. This variable must have been previously specified in a Launch Excel action.|
|Delete worksheet with|N/A|Index, Name|Name|Whether to find the worksheet by name or index|
|Worksheet index|No|[Numeric value](../variable-data-types.md#numeric-value)||The Index number of the worksheet to delete. The numbering starts from 1, meaning that the index of the first worksheet is 1, the second is 2, and so on.|
|Worksheet name|No|[Text value](../variable-data-types.md#text-value)||The name of the worksheet to delete|

### Variables produced

This action doesn't produce any variables.

### <a name="deleteworksheet_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Can't find worksheet|Indicates that a worksheet with the specified name couldn't be found|
|Failed to delete worksheet|Indicates a problem deleting the specified worksheet|

## <a name="renameworksheet"></a> Rename Excel worksheet

Renames a specific worksheet of an Excel instance.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Excel instance|No|[Excel instance](../variable-data-types.md#instances)||Specify the Excel instance. This variable must have been previously specified in a Launch Excel action.|
|Rename worksheet with|N/A|Index, Name|Name|Specify whether to find the worksheet by name or index|
|Worksheet index|No|[Numeric value](../variable-data-types.md#numeric-value)||The index of the worksheet to rename. The numbering starts from 1, meaning that the index of the first worksheet is 1, the second is 2, and so on.|
|Worksheet name|No|[Text value](../variable-data-types.md#text-value)||The name of the worksheet to rename|
|Worksheet new name|No|[Text value](../variable-data-types.md#text-value)||The new name of the worksheet|

### Variables produced

This action doesn't produce any variables.

### <a name="renameworksheet_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Can't find worksheet|Indicates that a worksheet with the specified name couldn't be found|
|Failed to rename worksheet|Indicates a problem renaming the specified worksheet|

## <a name="copyexcelworksheet"></a> Copy Excel worksheet

Copies a worksheet from an Excel document and paste it to the Excel document of the same or different Excel instance.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Excel instance|No|[Excel instance](../variable-data-types.md#instances)||The Excel instance to work with. This variable must be specified in a Launch Excel action.|
|Copy worksheet with|N/A|Index, Name|Name|Specify whether to find the worksheet by name or index|
|Worksheet index|No|[Numeric value](../variable-data-types.md#numeric-value)||The index of the worksheet to copy. The numbering starts from 1, meaning that the index of the first worksheet is 1, the second is 2, and so on.|
|Worksheet name|No|[Text value](../variable-data-types.md#text-value)||The name of the worksheet to copy.|
|Target Excel instance|Νο|[Excel instance](../variable-data-types.md#instances)||The Excel instance of the target file. This variable must be specified in a Launch Excel action.|
|Worksheet new name|No|[Text value](../variable-data-types.md#text-value)||The new name of the worksheet|
|Paste worksheet as|N/A|First worksheet, Last worksheet|First worksheet|Specify whether the copied Excel worksheet will be added before or after the existing worksheets|

### Variables produced

This action doesn't produce any variables.

### <a name="copyexcelworksheet_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to copy worksheet|Indicates a problem when copying a worksheet in Excel|
|Can't copy worksheet with this name|Indicates a problem when trying to set the sheet name after copying|

## <a name="activatecellinexcel"></a> Activate cell in Excel worksheet

Activate a cell in the active worksheet of an Excel instance, by providing column, row, and offset.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Excel instance|No|[Excel instance](../variable-data-types.md#instances)||Specify the Excel instance to work with. This variable must have been previously specified in a Launch Excel action.|
|Activate|N/A|Absolutely specified cell, Relatively specified cell|Absolutely specified cell|Select whether to specify the cell to activate absolutely, or relatively, by using an offset distance being the number of cells between the currently activated reference cell and the actual cell activate.|
|Column|No|[Text value](../variable-data-types.md#text-value)||The numeric value or letter of the cell column.|
|Direction|N/A|Left, Right, Above, Below|Left|Select offset direction. Select where to look for the cell to activate based on the position of the currently active cell.|
|Offset from active cell|No|[Numeric value](../variable-data-types.md#numeric-value)||The distance in cells between the currently active cell and the desired cell. The numbering starts from 0.|
|Row|No|[Numeric value](../variable-data-types.md#numeric-value)||The numeric value of the cell row. The numbering starts from 1.|

### Variables produced

This action doesn't produce any variables.

### <a name="activatecellinexcel_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to activate cell|Indicates a problem activating an Excel cell|

## <a name="selectcellsfromexcel"></a> Select cells in Excel worksheet

Selects a range of cells in the active worksheet of an Excel instance.

You have three options when it comes to retrieving a range of cells through Excel with the **Select cells in Excel worksheet** action.
To begin you need a valid **Excel instance**, which you can create by using the **Launch Excel** action and providing the respective inputs.

- To select a **range of cells** by explicitly providing the coordinates of the range, select the option **Range of cells** in the **Select** property and then provide a range by inputting the number or letter of the cells defining its start and end in the following properties: **Start column**, **Start row**, **End column**, **End row**.

- To select a **range of cells**, relative to the currently active cell, first select the option **Range of cells relative to active cell** in the **Select** property. Then define the direction in the X and Y axis based on the position of the currently active cell, as well as the offset from the active cell in the two axes by modifying the properties **X-axis direction**, **X-axis offset**, **Y-axis direction** and **Y-axis offset**.

- To select a **range of cells** using the range's name, select the option **Names cells** in the property **Select**.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Excel instance|No|[Excel instance](../variable-data-types.md#instances)||The Excel instance to work with. This variable must have been previously specified in a Launch Excel action.|
|Select|N/A|Absolutely specified cell, Relatively specified cell|Absolutely specified cell|Specify whether to select an explicitly specified range of cells or a range of cells relative to the currently active cell.|
|X Axis Direction|N/A|Left, Right|Left|The X-axis offset direction. Where to look along the horizontal axis, based on currently activated cell's position.|
|Start column|No|[Text value](../variable-data-types.md#text-value)||The index or letter of the first column.|
|X Offset|No|[Numeric value](../variable-data-types.md#numeric-value)||The X-axis offset.|
|Start row|No|[Numeric value](../variable-data-types.md#numeric-value)||The first row number. The numbering starts from 1.|
|End column|No|[Text value](../variable-data-types.md#text-value)||The index or letter of the last column.|
|Y Axis Direction|N/A|Above, Below|Above|The Y-axis offset direction. Where to look along the vertical axis, based on the position of the currently active cell.|
|End row|No|[Numeric value](../variable-data-types.md#numeric-value)||The last row number. The numbering starts from 1.|
|Y Offset|No|[Numeric value](../variable-data-types.md#numeric-value)||The Y-axis offset.|

### Variables produced

This action doesn't produce any variables.

### <a name="selectcellsfromexcel_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to select cells|Indicates a problem selecting the specified cells|

## <a name="getselectedcellrange"></a> Get selected cell range from Excel worksheet

Retrieve the selected range of cells in a structure consisting of first column, first row, last column, and last row.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Excel instance|No|[Excel instance](../variable-data-types.md#instances)||The Excel instance to work with. This variable must have been previously specified in a Launch Excel action.|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|FirstColumnIndex|[Numeric value](../variable-data-types.md#numeric-value)|The numeric value of the range's first column|
|FirstRowIndex|[Numeric value](../variable-data-types.md#numeric-value)|The numeric value of the range's first row|
|LastColumnIndex|[Numeric value](../variable-data-types.md#numeric-value)|The numeric value of the range's last column|
|LastRowIndex|[Numeric value](../variable-data-types.md#numeric-value)|The numeric value of the range's last row|

### <a name="getselectedcellrange_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to retrieve the selected range of cells|Indicates a problem retrieving the selected range of cells|

## <a name="copycellsfromexcel"></a> Copy cells from Excel worksheet

Copies a range of cells from the active worksheet of an Excel instance.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Excel instance|No|[Excel instance](../variable-data-types.md#instances)||The Excel instance to work with. This variable must have been previously specified in a Launch Excel action.|
|Copy mode|N/A|Single Cell's Values, Values from a Range of Cells, Values from Selection|Single Cell's Values|Specify whether to copy a single cell, a range of cells or the current selection of cells|
|Start column|No|[Text value](../variable-data-types.md#text-value)||The index or letter of the first column|
|Start row|No|[Numeric value](../variable-data-types.md#numeric-value)||The index of the first row|
|End column|No|[Text value](../variable-data-types.md#text-value)||The index or letter of the last column|
|End row|No|[Numeric value](../variable-data-types.md#numeric-value)||The index of the last row|

### Variables produced

This action doesn't produce any variables.

### <a name="copycellsfromexcel_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to copy cells|Indicates a problem copying the cells from the Excel document|

## <a name="pastecellstoexcel"></a> Paste cells to Excel worksheet

Pastes a range of cells to the active worksheet of an Excel instance.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Excel instance|No|[Excel instance](../variable-data-types.md#instances)||Specify the Excel instance. This variable must have been previously specified in a Launch Excel action.|
|Paste mode|N/A|On specified cell, On currently active cell|On specified cell|Specify whether to paste on a specified cell or the currently active cell|
|Column|No|[Text value](../variable-data-types.md#text-value)||The index or letter of the cell column|
|Row|No|[Numeric value](../variable-data-types.md#numeric-value)||The row number|

### Variables produced

This action doesn't produce any variables.

### <a name="pastecellstoexcel_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to paste cells|Indicates a problem pasting the specified cells|

## <a name="deletecellsaction"></a> Delete from Excel worksheet

Deletes a cell or a range of cells from the active worksheet of an Excel instance.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Excel instance|No|[Excel instance](../variable-data-types.md#instances)||The Excel instance to work with. This variable must have been previously specified in a Launch Excel action.|
|Retrieve|N/A|The value of a single cell, Values from a range of cells|The value of a single cell|Whether to delete a single cell or a table from a range of cells|
|Start column|No|[Text value](../variable-data-types.md#text-value)||The cell column (single cell's value) or first column as a numeric value or a letter|
|Start row|No|[Numeric value](../variable-data-types.md#numeric-value)||The cell row (single cell's value) or first row number|
|End column|No|[Text value](../variable-data-types.md#text-value)||The last column as a numeric value or a letter|
|End row|No|[Numeric value](../variable-data-types.md#numeric-value)||The last row number|
|Shift direction|N/A|Left, Up|Left|The shift direction|

### Variables produced

This action doesn't produce any variables.

### <a name="deletecellsaction_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to delete cells|Indicates a problem deleting the specified cells|

## <a name="insertrow"></a> Insert row to Excel worksheet

Inserts a row above a selected row of an Excel instance.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Excel instance|No|[Excel instance](../variable-data-types.md#instances)||The Excel instance to work with. This variable must have been previously specified in a Launch Excel action.|
|Row index|No|[Numeric value](../variable-data-types.md#numeric-value)||The index of the row to add a new row above. The numbering starts from 1.|

### Variables produced

This action doesn't produce any variables.

### <a name="insertrow_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Can't find row|Indicates that a row with the specified index couldn't be found|
|Failed to insert row|Indicates a problem inserting a row at the specified Excel instance|

## <a name="deleterow"></a> Delete row from Excel worksheet

Deletes a selected row from an Excel instance.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Excel instance|No|[Excel instance](../variable-data-types.md#instances)||The Excel instance. This variable must have been previously specified in a Launch Excel action.|
|Delete row|No|[Numeric value](../variable-data-types.md#numeric-value)||The Index number of the row to delete. The numbering starts from 1.|

### Variables produced

This action doesn't produce any variables.

### <a name="deleterow_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Can't find row|Indicates that a row with the specified index couldn't be found|
|Failed to delete row|Indicates a problem deleting the specified row|

## <a name="insertcolumn"></a> Insert column to Excel worksheet

Inserts a column to the left of a selected column of an Excel instance.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Excel instance|No|[Excel instance](../variable-data-types.md#instances)||The Excel instance to work with. This variable must have been previously specified in a Launch Excel action.|
|Column|No|[Text value](../variable-data-types.md#text-value)||The column's index number or letter. A new column will appear on the left side of the column indicated.|

### Variables produced

This action doesn't produce any variables.

### <a name="insertcolumn_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Can't find column|Indicates that a column with the specified name couldn't be found|
|Failed to insert column|Indicates a problem inserting a column at the specified Excel instance|

## <a name="deletecolumn"></a> Delete column from Excel worksheet

Deletes a selected column from an Excel instance.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Excel instance|No|[Excel instance](../variable-data-types.md#instances)||The Excel instance to work with. This variable must have been previously specified in a Launch Excel action.|
|Delete column|No|[Text value](../variable-data-types.md#text-value)||The index number or letter of the column to delete.|

### Variables produced

This action doesn't produce any variables.

### <a name="deletecolumn_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Can't find column|Indicates that a column with the specified name couldn't be found|
|Failed to delete column|Indicates a problem deleting the specified column|

## <a name="findandreplaceaction"></a> Find and replace cells in Excel worksheet

Finds text and replaces it with another in the active worksheet of an Excel instance.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Excel instance|No|[Excel instance](../variable-data-types.md#instances)||The Excel instance to work with. This variable must have been previously specified in a Launch Excel action.|
|Search mode|N/A|Find, Find and replace|Find|The mode to search with|
|All matches|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Whether to find/replace text in all the matching cells found or in the first matching cell only|
|Text to find|No|[Text value](../variable-data-types.md#text-value)||The text to find in the worksheet|
|Text to replace with|No|[Text value](../variable-data-types.md#text-value)||The text used to replace the matching cells|
|Match case|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Whether to search for case-sensitive data|
|Match entire cell contents|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Whether to search for cells that contain just the specified text|
|Search by|N/A|Rows, Columns|Rows|The order in which to search for the text|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|FoundColumnIndex|[Numeric value](../variable-data-types.md#numeric-value)|The index of the column found|
|FoundRowIndex|[Numeric value](../variable-data-types.md#numeric-value)|The index of the row found|
|Cells|[Datatable](../variable-data-types.md#datatable)|The list of cells matching the criteria|

### <a name="findandreplaceaction_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to find and/or replace text|Indicates a problem finding and/or replacing the specified text|

## <a name="getfirstfreerowoncolumn"></a> Get first free row on column from Excel worksheet

Retrieve the first free row, given the column of the active worksheet.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Excel instance|No|[Excel instance](../variable-data-types.md#instances)||Specify the Excel instance. This variable must have been previously specified in a Launch Excel action.|
|Column|No|[Text value](../variable-data-types.md#text-value)||The index or letter that identifies the column. Column numbering starts from index 1.|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|FirstFreeRowOnColumn|[Numeric value](../variable-data-types.md#numeric-value)|The numeric value of the given column's first fully empty row|

### <a name="getfirstfreerowoncolumn_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to retrieve first free row|Indicates a problem retrieving the first free row of an Excel instance|

## <a name="readcellformula"></a> Read formula from Excel

Reads the formula inside a cell in Excel.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Excel instance|No|[Excel instance](../variable-data-types.md#instances)||The Excel instance to work with. This variable must be specified in a Launch Excel action.|
|Retrieve|N/A|The formula of a single cell, The formula of a named cell|The formula of a single cell|Specify whether to retrieve the formula from a specified cell or a named cell|
|Start column|No|[Text value](../variable-data-types.md#text-value)||The cell column (single cell's value) or first column as a numeric value or a letter|
|Start row|No|[Numeric value](../variable-data-types.md#numeric-value)||The cell row (single cell's value) or first row number|
|Name|No|[Text value](../variable-data-types.md#text-value)||The name of cells|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|CellFormula|[Text value](../variable-data-types.md#text-value)|The formula of a single cell|

### <a name="readcellformula_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to read the formula from cell|Indicates a problem when reading the formula from a cell in Excel|

## <a name="gettablerange"></a> Get table range from Excel worksheet

Retrieves the range of a table in the active worksheet of an Excel instance.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Excel instance|No|[Excel instance](../variable-data-types.md#instances)||The Excel instance to work with. This variable must be specified in a Launch Excel action.|
|Table name|No|[Text value](../variable-data-types.md#text-value)||Specify the name of the table in Excel.|
|Is pivot|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Determine whether the specified table is a pivot table.|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|FirstColumnIndex|[Numeric value](../variable-data-types.md#numeric-value)|The numeric value of the table's first column|
|FirstRowIndex|[Numeric value](../variable-data-types.md#numeric-value)|The numeric value of the table's first row|
|LastColumnIndex|[Numeric value](../variable-data-types.md#numeric-value)|The numeric value of the table's last column|
|LastRowIndex|[Numeric value](../variable-data-types.md#numeric-value)|The numeric value of the table's last row|

### <a name="gettablerange_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to get the range from table|Indicates a problem when getting the range from a table in Excel|

## <a name="autofillcells"></a> Auto fill cells in Excel worksheet

Auto fills a range with data, based on the data of another range, in the active worksheet of an Excel instance.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Excel instance|No|[Excel instance](../variable-data-types.md#instances)||The Excel instance to work with. This variable must be specified in a Launch Excel action.|
|Ranges format|N/A|Named cells, Specific ranges|Named cells|Specify how the ranges are referenced, either using named cells or absolute column/row indexes|
|Source cells name|No|[Text value](../variable-data-types.md#text-value)||Name representing the source range for auto filling|
|Destination cells name|No|[Text value](../variable-data-types.md#text-value)||Name representing the destination range to auto fill. The source range should begin from the same cell and should be included in the destination range|
|Start column|No|[Text value](../variable-data-types.md#text-value)||The index or letter of the first column of both ranges|
|Start row|No|[Numeric value](../variable-data-types.md#numeric-value)||The first row number of both ranges. The numbering starts from 1|
|Source end column|No|[Text value](../variable-data-types.md#text-value)||The index or letter of the last column of the source range|
|Source end row|No|[Numeric value](../variable-data-types.md#numeric-value)||The last row number of the source range. The numbering starts from 1|
|Destination end column|No|[Text value](../variable-data-types.md#text-value)||The index or letter of the last column of the destination range|
|Destination end row|No|[Numeric value](../variable-data-types.md#numeric-value)||The last row number of the destination range. The numbering starts from 1|

### Variables produced

This action doesn't produce any variables.

### <a name="autofillcells_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to auto fill cells|Indicates a problem when auto filling cells in Excel|

## <a name="appendcells"></a> Append cells in Excel worksheet

Appends a range of cells to the active worksheet of an Excel instance.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Excel instance|No|[Excel instance](../variable-data-types.md#instances)||The Excel instance to work with. This variable must be specified in a Launch Excel action.|
|Append mode|N/A|To active sheet, To named cells|To active sheet|Specify whether to append to a sheet or range of named cells|
|Name|No|[Text value](../variable-data-types.md#text-value)||The name of the range of cells|
|First row has headers|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Indicates that the first row of the destination contains column headers|
|Starting column|Yes|[Text value](../variable-data-types.md#text-value)||The starting column number or letter, where the data is appended beginning from the destination's first empty row. If the field is left empty, the first column of the specified destination is used instead.|
|Starting column header|Yes|[Text value](../variable-data-types.md#text-value)||The header of the starting column, where the data is appended beginning from the destination's first empty row. If the field is left empty, the first column of the specified destination is used instead.|

### Variables produced

This action doesn't produce any variables.

### <a name="appendcells_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to append cells|Indicates a problem when appending cells in Excel|

## <a name="lookuprange"></a> Lookup range in Excel worksheet

Finds and returns the result of Excel's LOOKUP function.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Excel instance|No|[Excel instance](../variable-data-types.md#instances)||The Excel instance to work with. This variable must be specified in a Launch Excel action.|
|Lookup value|No|[Text value](../variable-data-types.md#text-value)||The value to lookup in the specified range of cells.|
|Ranges format|N/A|Named cells, Specific ranges|Named cells|Specify how the ranges are referenced, either using named cells or absolute column/row indexes.|
|Cells name|No|[Text value](../variable-data-types.md#text-value)||The name of the cells range to search for the lookup value.|
|Start column|No|[Text value](../variable-data-types.md#text-value)||The index or letter of the first column of the range to search for the lookup value.|
|Start row|No|[Numeric value](../variable-data-types.md#numeric-value)||The first row number of the range to search for the lookup value. The numbering starts from 1.|
|End column|No|[Text value](../variable-data-types.md#text-value)||The index or letter of the last column of the range to search for the lookup value.|
|End row|No|[Numeric value](../variable-data-types.md#numeric-value)||The last row number of the range to search for the lookup value. The numbering starts from 1.|
|Array form|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|The array form of LOOKUP looks in the first row or column of an array for the specified value and returns a value from the same position in the last row or column of the array. Use this form of LOOKUP when the values that you want to match are in the first row or column of the array. If this option remains disabled, the vector form of LOOKUP is used instead, which looks in a one-row or one-column range (known as a vector) for a value and returns a value from the same position in a second one-row or one-column range.|
|Cells name of results source|Yes|[Text value](../variable-data-types.md#text-value)||The name of the cells range from which the matching value is returned.|
|Start column of results source|No|[Text value](../variable-data-types.md#text-value)||The index or letter of the first column of the range from which the matching value is returned.|
|Start row of results source|No|[Numeric value](../variable-data-types.md#numeric-value)||The first row number of the range from which the matching value is returned. The numbering starts from 1.|
|End column of results source|No|[Text value](../variable-data-types.md#text-value)||The index or letter of the last column of the range from which the matching value is returned.|
|End row of results source|No|[Numeric value](../variable-data-types.md#numeric-value)||The last row number of the range from which the matching value is returned. The numbering starts from 1.|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|LookupResult|[Text value](../variable-data-types.md#text-value)|The value returned by the LOOKUP function|

### <a name="lookuprange_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to lookup|Indicates a problem when looking up a value in Excel|

## <a name="setcolor"></a> Set color of cells in Excel worksheet

Fills the background of the selected cells with the specified color, in the active worksheet of an Excel instance.

You can define the color by entering a hexadecimal code, or you can choose from a selection of predefined color names provided in the list. Selecting the 'Transparent' option leaves the cells without any color fill.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Excel instance|No|[Excel instance](../variable-data-types.md#instances)||The Excel instance to work with. This variable must be specified in a Launch Excel action.|
|Set color of|N/A|Single cell, Range of cells, Named cells|Single cell|Specify whether to set the background color of a single cell, a range of cells, or named cells.|
|Start column|No|[Text value](../variable-data-types.md#text-value)||The index or letter of the cell column or range's first column.|
|Start row|No|[Numeric value](../variable-data-types.md#numeric-value)||The cell row or the range's first row number. The numbering starts from 1.|
|End column|No|[Text value](../variable-data-types.md#text-value)||The index or letter of the range's last column.|
|End row|No|[Numeric value](../variable-data-types.md#numeric-value)||The range's last row number. The numbering starts from 1.|
|Cells name|No|[Text value](../variable-data-types.md#text-value)||Name representing the range that is filled with the specified color.|
|Color format|N/A|Name, Hexadecimal value|Name|Select whether to specify a color by its name or its hexadecimal value.|
|Color name|No|[Text value](../variable-data-types.md#text-value)||Select one of the system defined colors.|
|Color hexadecimal value|No|[Text value](../variable-data-types.md#text-value)||Specify the hexadecimal (RGB) value of the color.|

### Variables produced

This action doesn't produce any variables.

### <a name="setcolor_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to set color|Indicates a problem when setting the color of cells in Excel|

## <a name="launchexcel"></a> Launch Excel

Launches a new Excel instance or opens an Excel document.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Launch Excel|N/A|With a blank document, and open the following document|With a blank document|Specify whether to open a New Excel document, or an existing document|
|Document path|No|[File](../variable-data-types.md#files-and-folders)||The full path of the existing Excel document to open|
|Make instance visible|N/A|[Boolean value](../variable-data-types.md#boolean-value)|True|Specify whether to make the Excel window visible or hidden|
|Nest under a new Excel process|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specify whether the Excel spreadsheet should be under a unique Excel process. Macros and add-ins from other spreadsheets won't be accessible.|
|Password|Yes|Direct encrypted input or [Text value](../variable-data-types.md#text-value)||The password on the Excel document, if it's password protected|
|Open as ReadOnly|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specify whether to open the stored document in read-only mode or not|
|Load add-ins and macros|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specify whether to load add-ins and macros into the new Excel instance|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|ExcelInstance|[Excel instance](../variable-data-types.md#instances)|The specific Excel instance for use with later Excel actions. This allows the user to specify which of possibly several Excel spreadsheets to access|

### <a name="launchexcel_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to launch Excel|Indicates a problem launching an Excel instance|
|Failed to open Excel document|Indicates a problem opening the specified Excel document|

## <a name="attach"></a> Attach to running Excel

Attaches to an Excel document that's already open.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Document name|No|[File](../variable-data-types.md#files-and-folders)||The name or the path of the Excel document to attach to|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|ExcelInstance|[Excel instance](../variable-data-types.md#instances)|The Excel instance this action has attached to for use with later Excel actions|

### <a name="attach_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Specified Excel document not found|Indicates that the specified Excel document couldn't be found|
|Failed to attach to Excel document|Indicates a problem attaching to the Excel document|

## <a name="readfromexcel"></a> Read from Excel worksheet

Reads the value of a cell or a range of cells from the active worksheet of an Excel instance.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Excel instance|No|[Excel instance](../variable-data-types.md#instances)||The Excel instance to work with. This variable must have been previously specified in a Launch Excel action.|
|Retrieve|N/A|The value of a single cell, Values from a range of cells, Values from selection, All available values from worksheet|The value of a single cell|Whether to retrieve the value of a single cell, a table from a range of cells or the entire worksheet|
|Start column|No|[Text value](../variable-data-types.md#text-value)||The cell column (single cell's value) or first column as a numeric value or a letter|
|Start row|No|[Numeric value](../variable-data-types.md#numeric-value)||The cell row (single cell's Value) or first row number|
|End column|No|[Text value](../variable-data-types.md#text-value)||The last column as a numeric value or a letter|
|End row|No|[Numeric value](../variable-data-types.md#numeric-value)||The last row number|
|Get cell contents as text|N/A|[Typed values,Plain text,Formatted text values]|Typed values|Specify whether to retrieve the content of the cell(s) as the closest matching type such as Date Time for dates, Numeric for numbers and so on, purely as text, or as formatted cell text.|
|First line of range contains column names|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specify whether to consider the first row as column names. In this case, the names won't be read as data into the table and later actions can search the data by column names.|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|ExcelData|[General value](../variable-data-types.md#general-value)|The value of the single cell|
|ExcelData|[Datatable](../variable-data-types.md#datatable)|The value of the range of cells as a DataTable|

### <a name="readfromexcel_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to read cell values|Indicates a problem reading the value(s) of the specified Excel cells|

## <a name="getactivecell"></a> Get active cell on Excel worksheet

Get the active cell in the active worksheet of the Excel document.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Excel instance|No|[Excel instance](../variable-data-types.md#instances)||The Excel instance to work with. This variable must have been previously specified in a Launch Excel action.|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|ActiveCellColumnIndex|[Numeric value](../variable-data-types.md#numeric-value)|The numeric value of the active cell's column|
|ActiveCellRowIndex|[Numeric value](../variable-data-types.md#numeric-value)|The numeric value of the active cell's row|

### <a name="getactivecell_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to get active cell|Indicates a problem getting the active cell|

## <a name="saveexcel"></a> Save Excel

Saves a previously launched Excel instance.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Excel instance|No|[Excel instance](../variable-data-types.md#instances)||The Excel instance to save. This variable must have been previously specified in a Launch Excel action.|
|Save mode|N/A|Save document, Save document as|Save document|How to save the document of this instance|
|Document format|N/A|Default (From Extension), Excel Workbook (.xlsx), Excel Workbook Macro Enabled (.xlsm), Excel 97-2003 Workbook (.xls), Web Page (.htm, .html), Excel Template (.xltx), Excel Template Macro Enabled (.xltm), Excel 97-2003 Template (.xlt), Text (.txt), Unicode Text (.txt), Text Macintosh (.txt), Text DOS (.txt), XML Spreadsheet (.xml), Excel 95 (.xls), CSV (.csv), DIF (.dif), SYLK (.slk), Excel add-in (.xlam), Excel 97-2003 add-In (.xla), Strict Open XML Workbook (.xlsx), OpenDocument Spreadsheet (.ods), XML Data (.xml), Excel Binary Workbook (.xlsb)|Default (From Extension)|The format to save the document as|
|Document path|No|[File](../variable-data-types.md#files-and-folders)||The full path to save the document as|

### Variables produced

This action doesn't produce any variables.

### <a name="saveexcel_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to save Excel document|Indicates a problem saving the Excel document|

## <a name="writetoexcel"></a> Write to Excel worksheet

Writes a value into a cell or a range of cells of an Excel instance.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Excel instance|No|[Excel instance](../variable-data-types.md#instances)||The Excel instance to work with. This variable must have been previously specified in a Launch Excel action.|
|Value to write|No|[General value](../variable-data-types.md#general-value)||Enter the text, number, or variable to insert. If the variable contains a table, it will fill in cells to the right and below, writing over other cell data if need be and a list will fill in cells below.|
|Write mode|N/A|On specified cell, On currently active cell|On specified cell|Whether to write into a specified cell or the currently active cell|
|Column|No|[Text value](../variable-data-types.md#text-value)||The column number or letter for the cell to write to|
|Row|No|[Numeric value](../variable-data-types.md#numeric-value)||The row of the cell to write to. The numbering starts from 1, meaning that the index of the first worksheet is 1, the second is 2, and so on.|

### Variables produced

This action doesn't produce any variables.

### <a name="writetoexcel_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to write value to Excel|Indicates a problem writing the specified value to the Excel instance|

## <a name="closeexcel"></a> Close Excel

Closes an Excel instance.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Excel instance|No|[Excel instance](../variable-data-types.md#instances)||The Excel instance to close. This variable must have been previously specified in a Launch Excel action.|
|Before closing Excel|N/A|Do not save document, Save document, Save document as|Don't save document|Whether and how to save the document of this instance before closing that instance|
|Document format|N/A|Default (From Extension), Excel Workbook (.xlsx), Excel Workbook Macro Enabled (.xlsm), Excel 97-2003 Workbook (.xls), Web Page (.htm, .html), Excel Template (.xltx), Excel Template Macro Enabled (.xltm), Excel 97-2003 Template (.xlt), Text (.txt), Unicode Text (.txt), Text Macintosh (.txt), Text DOS (.txt), XML Spreadsheet (.xml), Excel 95 (.xls), CSV (.csv), DIF (.dif), SYLK (.slk), Excel add-in (.xlam), Excel 97-2003 add-in (.xla), Strict Open XML Workbook (.xlsx), OpenDocument Spreadsheet (.ods), XML Data (.xml), Excel Binary Workbook (.xlsb)|Default (From Extension)|The format of the document|
|Document path|No|[File](../variable-data-types.md#files-and-folders)||The full path of the document|

### Variables produced

This action doesn't produce any variables.

### <a name="closeexcel_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to save Excel document|Indicates a problem saving the Excel document|
|Failed to close Excel instance|Indicates a problem closing the Excel instance|

## <a name="setactiveworksheet"></a> Set active Excel worksheet

Activates a specific worksheet of an Excel instance.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Excel instance|No|[Excel instance](../variable-data-types.md#instances)||Specify the Excel instance. This variable must have been previously specified in a Launch Excel action.|
|Activate worksheet with|N/A|Index, Name|Name|Specify whether to find the worksheet by name or index|
|Worksheet index|No|[Numeric value](../variable-data-types.md#numeric-value)||The index number of the worksheet to activate. The numbering starts from 1, meaning that the index of the first worksheet is 1, the second is 2, and so on.|
|Worksheet name|No|[Text value](../variable-data-types.md#text-value)||The name of the worksheet to activate|

### Variables produced

This action doesn't produce any variables.

### <a name="setactiveworksheet_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Can't find worksheet|Indicates that a worksheet with the specified name couldn't be found|
|Failed to activate worksheet|Indicates a problem activating the specified worksheet|

## <a name="addworksheet"></a> Add new worksheet

Adds a new worksheet to the document of an Excel instance.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Excel instance|No|[Excel instance](../variable-data-types.md#instances)||Specify the Excel instance. This variable must have been previously specified in a Launch Excel action.|
|New worksheet name|No|[Text value](../variable-data-types.md#text-value)||Specify the name of the new worksheet|
|Add worksheet as|N/A|First worksheet, Last worksheet|First worksheet|Specify whether the new Excel worksheet will be added before or after the existing worksheets|

### Variables produced

This action doesn't produce any variables.

### <a name="addworksheet_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|A worksheet with the same name already exists|Indicates that the worksheet couldn't be added because a worksheet with the same name already exists|
|Failed to add worksheet|Indicates a problem adding the worksheet|

## <a name="getfirstfreecolumnrow"></a> Get first free column/row from Excel worksheet

Retrieves the first free column and/or row of the active worksheet. This is useful for adding new data into a worksheet that already has data in it.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Excel instance|No|[Excel instance](../variable-data-types.md#instances)||Specify The Excel instance. This variable must have been previously specified in a Launch Excel action.|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|FirstFreeColumn|[Numeric value](../variable-data-types.md#numeric-value)|The numeric value of the first fully empty column. For example, if column F is the first empty column, it will be stored as '6'.|
|FirstFreeRow|[Numeric value](../variable-data-types.md#numeric-value)|The numeric value of the first fully empty row. For example, if row 7 is the first empty row, it will be stored as '7'.|

### <a name="getfirstfreecolumnrow_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to retrieve first free column/row|Indicates a problem retrieving the first free column/row of an Excel instance|

## <a name="getcolumnname"></a> Get column name on Excel worksheet

Gets the name of the column.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Column number|No|[Numeric value](../variable-data-types.md#numeric-value)||The column number|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|ColumnName|[Text value](../variable-data-types.md#text-value)|The name of the column|

#### <a name="getcolumnname_onerror"></a> Exceptions

This action doesn't include any exceptions.

## <a name="clearcellsfromexcel"></a> Clear cells in Excel worksheet

Clears a range of cells or a named cell in the active worksheet of an Excel instance.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Excel instance|No|[Excel instance](../variable-data-types.md#instances)||The Excel instance to work with. This variable must have been previously specified in a **Launch Excel** action.|
|Clear|N/A|Range of cells, Range of cells relative to active cell, Named cells, Single cell|Range of cells|Specify whether to select an explicitly specified range of cells, a range of cells relative to the currently active cell, named cells, or a single cell.|
|X Axis Direction|N/A|Left, Right|Left|The X-axis offset direction. Where to look along the horizontal axis, based on currently activated cell's position.|
|Start column|No|[Text value](../variable-data-types.md#text-value)||The index or letter of the first column.|
|X Offset|No|[Numeric value](../variable-data-types.md#numeric-value)||The X-axis offset.|
|Start row|No|[Numeric value](../variable-data-types.md#numeric-value)||The first row number. The numbering starts from 1.|
|End column|No|[Text value](../variable-data-types.md#text-value)||The index or letter of the last column.|
|Y Axis Direction|N/A|Above, Below|Above|The Y-axis offset direction. Where to look along the vertical axis, based on the position of the currently active cell.|
|End row|No|[Numeric value](../variable-data-types.md#numeric-value)||The last row number. The numbering starts from 1.|
|Y Offset|No|[Numeric value](../variable-data-types.md#numeric-value)||The Y-axis offset.|
|Name|No|[Text value](../variable-data-types.md#text-value)||The name of cells.|
|Column|No|[Text value](../variable-data-types.md#text-value)||The index or letter of the column.|
|Row|No|[Numeric value](../variable-data-types.md#numeric-value)||The row number. Enumeration starts from 1.|

### Variables produced

This action doesn't produce any variables.

#### <a name="clearcellsfromexcel_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to clear cells|Indicates a problem occurred while trying to clear the specified cells in the Excel instance.|

## <a name="sortcellsfromexcel"></a> Sort cells in Excel worksheet

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Excel instance|No|[Excel instance](../variable-data-types.md#instances)||The Excel instance to work with. This variable must have been previously specified in a Launch Excel action.|
|Sort column in|N/A|Active sheet, Table, Range|Active sheet|Specify whether the column to be sorted is part of a table, a specified range, either by name or absolute coordinates or if it's part of the general active worksheet.|
|Table name|No|[Text value](../variable-data-types.md#text-value)||The name of the table.|
|Range|N/A|Named cells, Specific range|Named cells|Specify the range to be sorted, either using named cell or absolute column and row index.|
|Cells name|No|[Text value](../variable-data-types.md#text-value)||Name representing the range.|
|Start column|No|[Text value](../variable-data-types.md#text-value)||The index or letter of the first column.|
|Start row|No|[Numeric value](../variable-data-types.md#numeric-value)||The first row number. The numbering starts from 1.|
|End column|No|[Text value](../variable-data-types.md#text-value)||The index or letter of the last column.|
|End row|No|[Numeric value](../variable-data-types.md#numeric-value)||The last row number. The numbering starts from 1.|
|Sort by|Yes|Sorting rules as defined by the user|N/A|Sorting rules to apply.|
|First row is header|Yes|[Boolean value](../variable-data-types.md#boolean-value)||Indicates that the first row of the worksheet is a header.|

### Variables produced

This action doesn't produce any variables.

### <a name="sortcellsfromexcel_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to sort cells in worksheet|Indicates a problem sorting cells in the worksheet.|

## <a name="filtercellsfromexcel"></a> Filter cells in Excel worksheet

**Filter cells in Excel worksheet** allows makers to create and apply a filter in the active sheet, table, or range on the values of a specified column. To filter multiple columns in an active sheet/table/range, multiple **Filter cells in Excel worksheet** actions must be used, each one applying the respective filter.

>[!IMPORTANT]
>To apply multiple filters in a specific active sheet/table/range, make sure that all **Filter cells in Excel worksheet** actions used target the same source (active sheet/table/range).

When using the **Filter cells in Excel worksheet** in an active sheet/range with already existing/applied filters:

* If the targeted range is the same as the one the previous filters were applied on, all filters are applied.
* If the targeted range isn't the same as the range previous filters were applied on, previous filters are cleared, and only the latest filter is applied.
* If the targeted range is a table, all filters are applied.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Excel instance|No|[Excel instance](../variable-data-types.md#instances)||The Excel instance to work with. This variable must have been previously specified in a Launch Excel action.|
|Filter column in|N/A|Active sheet, Table, Range|Active sheet|Specify whether the column to be filtered is part of a table, a specified range, either by name or absolute coordinates or if it's part of the general active worksheet|
|Table name|No|[Text value](../variable-data-types.md#text-value)||The name of the table.|
|Range|N/A|Named cells, Specific range|Named cells|Specify the range to be filtered, either using named cell or absolute column/row index|
|Cells name|No|[Text value](../variable-data-types.md#text-value)||Name representing the range|
|Start column|No|[Text value](../variable-data-types.md#text-value)||The index or letter of the first column.|
|Start row|No|[Numeric value](../variable-data-types.md#numeric-value)||The first row number. The numbering starts from 1.|
|End column|No|[Text value](../variable-data-types.md#text-value)||The index or letter of the last column.|
|End row|No|[Numeric value](../variable-data-types.md#numeric-value)||The last row number. The numbering starts from 1.|
|Column to filter|No|[Text value](../variable-data-types.md#text-value)||Name or index of the column to be filtered. If the column is part of a table use the header name.|
|Filters to apply|Yes|Filtering rules as defined by the user|N/A|Filtering rules applied to the defined column|

### Variables produced

This action doesn't produce any variables.

### <a name="filtercellsfromexcel_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to apply filter on cells in worksheet|Indicates a problem applying the specified filter on cells in the worksheet|

## <a name="clearfilterfromexcel"></a> Clear filters in Excel worksheet

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Excel instance|No|[Excel instance](../variable-data-types.md#instances)||The Excel instance to work with. This variable must have been previously specified in a Launch Excel action.|
|Clear filters in|N/A|Active sheet, Table|Active sheet|Specify whether to clear filters from the entire active worksheet or from a specific table.|
|Table name|No|[Text value](../variable-data-types.md#text-value)||The name of the table.|
|Clear filters from specific column|Yes|[Boolean value](../variable-data-types.md#boolean-value)||Clear filters from specific column.|
|Clear filter in column|No|[Text value](../variable-data-types.md#text-value)||The column name to clear applied filter.|

### Variables produced

This action doesn't produce any variables.

### <a name="clearfilterfromexcel_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to clear filter on cells in worksheet|Indicates a problem applying the specified filter on cells in the worksheet|

## <a name="getemptycellfromexcel"></a> Get empty cell

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Excel instance|No|[Excel instance](../variable-data-types.md#instances)||The Excel instance to work with. This variable must have been previously specified in a Launch Excel action.|
|Operation|N/A|First empty cell, First empty cell in column, First empty cell in row, All empty cells|First empty cell|Specify whether to search for the first empty cell, the first empty cell on column, the first empty cell on row, or all empty cells inside a specific range.|
|Search direction|N/A|By row, By column|By row|Specify whether to search by rows or columns to find the first empty cell inside a specific range.|
|Search in|N/A|Named cells, Specific range|Named cells|Search for empty cell in a named cell or a range defined by start column/row and end column/row.|
|Cells name|No|[Text value](../variable-data-types.md#text-value)||Name representing the range.|
|Column|No|[Text value](../variable-data-types.md#text-value)||Column.|
|Row|No|[Numeric value](../variable-data-types.md#numeric-value)||Row.|
|Start column|No|[Text value](../variable-data-types.md#text-value)||The index or letter of the first column.|
|Start row|No|[Numeric value](../variable-data-types.md#numeric-value)||The first row number. The numbering starts from 1.|
|End column|No|[Text value](../variable-data-types.md#text-value)||The index or letter of the last column.|
|End row|No|[Numeric value](../variable-data-types.md#numeric-value)||The last row number. The numbering starts from 1.|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|EmptyCellColumnIndex|[Numeric value](../variable-data-types.md#numeric-value)|The index of the column the first empty cell is found.|
|EmptyCellRowIndex|[Numeric value](../variable-data-types.md#numeric-value)|The index of the row the first empty cell is found.|
|EmptyCells|[Datatable](../variable-data-types.md#datatable)|The list of empty cells found.|

### <a name="getemptycellfromexcel_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Get empty cells failed|Indicates a problem retrieving the empty cells from the worksheet.|

## Known limitations

### Using Excel files synchronized through OneDrive or SharePoint

Interaction with Microsoft Excel files that are contained in folders synchronized in OneDrive or SharePoint might result in an erroneous flow. Power Automate for desktop utilizes COM objects for Excel interactions. OneDrive and SharePoint aren't fully compatible with Excel instances launched through COM.

For this reason, when you try to open an Excel file stored under a OneDrive or SharePoint directory, you might encounter a **file not found** error. To resolve this issue, use one of the following workarounds:

#### Workaround 1

* Make a local copy of the respective Excel file.
* Modify the local copy of the Excel file using Power Automate for desktop's Excel automation actions.
* Override the Excel file copy synchronized through OneDrive/ Sharepoint with the local copy that includes the latest changes.

#### Workaround 2

> [!NOTE]
> This workaround can be used in general when the **Launch Excel** action fails to execute.

- Open a new Excel instance using the **Run application** action. Make sure that you provide enough wait time between actions, allowing the Excel process to load completely, including any add-ins.
- Use the action **Attach to Excel** to attach to the new process.

### Case with Read from Excel worksheet

When the **Get cell contents as text** option is enabled in the **Read from Excel worksheet** action, the data is retrieved exactly as it appears in the Excel worksheet. This means that if the column width is too narrow and the data is displayed as ### in Excel, these symbols will also appear in the result.

**Workaround:**

To avoid this, use the **Resize columns/rows** action. If the **Get cell contents as text** option is not used, the data fetched is the raw cell values, regardless of how they are displayed or formatted in the worksheet. This means there is no need to use the **Resize columns/rows** action. For date values, the time will be appended because the date data type includes time.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]


