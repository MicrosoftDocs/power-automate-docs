---
title: Excel | Microsoft Docs
description: Excel Actions Reference
author: mariosleon
ms.service: flow
ms.topic: article
ms.date: 09/30/2020
ms.author: marleon
ms.reviewer:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Excel

[!INCLUDE [cc-beta-prerelease-disclaimer.md](../../../includes/cc-beta-prerelease-disclaimer.md)]

Automate any Excel related activity

|<!-- --> |
|-----|
|[Run Excel Macro](#runmacro)|
|[Get active Excel worksheet](#getactiveworksheet)|
|[Get all Excel worksheets](#getallworksheets)|
|[Delete Excel worksheet](#deleteworksheet)|
|[Rename Excel worksheet](#renameworksheet)|
|[Activate Cell in Excel Worksheet](#activatecellinexcel)|
|[Select cells in Excel worksheet](#selectcellsfromexcel)|
|[Get selected cell range from Excel worksheet](#getselectedcellrange)|
|[Copy cells from Excel worksheet](#copycellsfromexcel)|
|[Paste cells to Excel worksheet](#pastecellstoexcel)|
|[Insert row to Excel worksheet](#insertrow)|
|[Delete row from Excel worksheet](#deleterow)|
|[Insert column to Excel worksheet](#insertcolumn)|
|[Delete column from Excel worksheet](#deletecolumn)|
|[Get first free row on column from Excel worksheet](#getfirstfreerowoncolumn)|
|[Launch Excel](#launchexcel)|
|[Attach to running Excel](#attach)|
|[Read from Excel worksheet](#readfromexcel)|
|[Save Excel](#saveexcel)|
|[Write to Excel worksheet](#writetoexcel)|
|[Close Excel](#closeexcel)|
|[Set active Excel worksheet](#setactiveworksheet)|
|[Add new worksheet](#addworksheet)|
|[Get first free column/row from Excel worksheet](#getfirstfreecolumnrow)|

## Advanced
Advanced Excel automation actions
### <a name="runmacro"></a> Run Excel Macro
Runs a specified macro on the document of an Excel instance

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Excel instance|No|Excel instance||The Excel instance to work with. This variable must have been previously specified in a Launch Excel action|
|Macro|No|Text value||The macro to run. The text should consist of the name of the macro, followed by any arguments (optional), all separated by semicolons|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="runmacro_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Failed to run macro|Indicates a problem running the specified macro|

### <a name="getactiveworksheet"></a> Get active Excel worksheet
Retrieves an Excel document's active worksheet

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Excel instance|No|Excel instance||The Excel instance to work with. This variable must have been previously specified in a Launch Excel action|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|SheetName|Text value|The name of the active worksheet|
|SheetIndex|Numeric value|The index of the active worksheet|


##### <a name="getactiveworksheet_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Failed to retrieve active worksheet|Indicates a problem retrieving the active worksheet|

### <a name="getallworksheets"></a> Get all Excel worksheets
Retrieves all worksheet names of an Excel document

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Excel instance|No|Excel instance||Specify the Excel instance. This variable must have been previously specified in a Launch Excel action|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|SheetNames|List of Text values|The names of all worksheets|


##### <a name="getallworksheets_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Failed to retrieve all worksheet names|Indicates a problem retrieving the names of the Excel worksheet|

### <a name="deleteworksheet"></a> Delete Excel worksheet
Deletes a specific worksheet from an Excel instance

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Excel instance|No|Excel instance||The Excel instance to work with. This variable must have been previously specified in a Launch Excel action|
|Delete worksheet with|N/A|Index, Name|Name|Whether to find the worksheet by name or index|
|Worksheet index|No|Numeric value||The Index number of the worksheet to delete. The numbering starts from 1, meaning that the index of the fist worksheet is 1, the second one is 2 etc.|
|Worksheet name|No|Text value||The name of the worksheet to delete|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="deleteworksheet_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Can't find worksheet|Indicates that a worksheet with the specified name could not be found|
|Failed to delete worksheet|Indicates a problem deleting the specified worksheet|

### <a name="renameworksheet"></a> Rename Excel worksheet
Renames a specific worksheet of an Excel instance

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Excel instance|No|Excel instance||Specify the Excel instance. This variable must have been previously specified in a Launch Excel action|
|Rename worksheet with|N/A|Index, Name|Name|Specify whether to find the worksheet by name or index|
|Worksheet index|No|Numeric value||The index of the worksheet to rename. The numbering starts from 1, meaning that the index of the fist worksheet is 1, of the second is 2 etc.|
|Worksheet name|No|Text value||The name of the worksheet to rename|
|Worksheet new name|No|Text value||The new name of the worksheet|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="renameworksheet_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Can't find worksheet|Indicates that a worksheet with the specified name could not be found|
|Failed to rename worksheet|Indicates a problem renaming the specified worksheet|

### <a name="activatecellinexcel"></a> Activate Cell in Excel Worksheet
Activate a cell in the active worksheet of an Excel instance, by providing column, row and offset

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Excel instance|No|Excel instance||Specify the Excel instance to work with. This variable must have been previously specified in a Launch Excel action|
|Activate|N/A|Absolutely specified cell, Relatively specified cell|Absolutely specified cell|Select whether to specify the cell to activate absolutely, or relatively, by using an offset distance being the number of cells between the currently activated reference cell and the actual cell activate|
|Column|No|Text value||The numeric value or letter of the cell column|
|Direction|N/A|Left, Right, Above, Below|Left|Select offset direction. Select where to look for the cell to activate based on the position of the currently active cell|
|Offset from active cell|No|Numeric value||The distance in cells between the currently active cell and the desired cell. The numbering starts from 0|
|Row|No|Numeric value||The numeric value of the cell row. The numbering starts from 1|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="activatecellinexcel_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Failed to activate cell|Indicates a problem activating an Excel cell|

### <a name="selectcellsfromexcel"></a> Select cells in Excel worksheet
Selects a range of cells in the active worksheet of an Excel instance

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Excel instance|No|Excel instance||The Excel instance to work with. This variable must have been previously specified in a Launch Excel action|
|Select|N/A|Absolutely specified cell, Relatively specified cell|Absolutely specified cell|Specify whether to select an explicitly specified range of cells or a range of cells relatively to the currently active cell|
|X Axis Direction|N/A|Left, Right|Left|The X-axis offset direction. Where to look along the horizontal axis, based on currently activated cell's position|
|Start column|No|Text value||The index or letter of the first column|
|X Offset|No|Numeric value||The X-axis offset|
|Start row|No|Numeric value||The first row number. The numbering starts from 1|
|End column|No|Text value||The index or letter of the last column|
|Y Axis Direction|N/A|Above, Below|Above|The Y-axis offset direction. Where to look along the vertical axis, based on the position of the currently active cell|
|End row|No|Numeric value||The last row number. The numbering starts from 1|
|Y Offset|No|Numeric value||The Y-axis offset|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="selectcellsfromexcel_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Failed to select cells|Indicates a problem selecting the specified cells|

### <a name="getselectedcellrange"></a> Get selected cell range from Excel worksheet
Retrieve the selected range of cells in a structure consisting of first column, first row, last column and last row

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Excel instance|No|Excel instance||The Excel instance to work with. This variable must have been previously specified in a Launch Excel action|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|FirstColumnIndex|Numeric value|The numeric value of the range's first column|
|FirstRowIndex|Numeric value|The numeric value of the range's first row|
|LastColumnIndex|Numeric value|The numeric value of the range's last column|
|LastRowIndex|Numeric value|The numeric value of the range's last row|


##### <a name="getselectedcellrange_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Failed to retrieve the selected range of cells|Indicates a problem retrieving the selected range of cells|

### <a name="copycellsfromexcel"></a> Copy cells from Excel worksheet
Copies a range of cells from the active worksheet of an Excel instance

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Excel instance|No|Excel instance||The Excel instance to work with. This variable must have been previously specified in a Launch Excel action|
|Copy mode|N/A|Single Cell's Values, Values from a Range of Cells, Values from Selection|Single Cell's Values|Specify whether to copy a single cell, a range of cells or the current selection of cells|
|Column|No|Text value||The index or letter of the first column|
|Row|No|Numeric value||The index of the first row|
|Column|No|Text value||The index or letter of the last column|
|Row|No|Numeric value||The index of the last row|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="copycellsfromexcel_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Failed to copy cells|Indicates a problem copying the cells from the Excel document|

### <a name="pastecellstoexcel"></a> Paste cells to Excel worksheet
Pastes a range of cells to the active worksheet of an Excel instance

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Excel instance|No|Excel instance||Specify the Excel instance. This variable must have been previously specified in a Launch Excel action|
|Paste mode|N/A|On specified cell, On currently active cell|On specified cell|Specify whether to paste on a specified cell or the currently active cell|
|Column|No|Text value||The index or letter of the cell column|
|Row|No|Numeric value||The row number|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="pastecellstoexcel_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Failed to paste cells|Indicates a problem pasting the specified cells|

### <a name="insertrow"></a> Insert row to Excel worksheet
Inserts a row above a selected row of an Excel instance

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Excel instance|No|Excel instance||The Excel instance to work with. This variable must have been previously specified in a Launch Excel action|
|Row index|No|Numeric value||The index of the row to add a new row above. The numbering starts from 1|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="insertrow_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Can't find row|Indicates that a row with the specified index could not be found|
|Failed to insert row|Indicates a problem inserting a row at the specified Excel instance|

### <a name="deleterow"></a> Delete row from Excel worksheet
Deletes a selected row from an Excel instance

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Excel instance|No|Excel instance||The Excel instance. This variable must have been previously specified in a Launch Excel action|
|Delete row|No|Numeric value||The Index number of the row to delete. The numbering starts from 1|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="deleterow_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Can't find row|Indicates that a row with the specified index could not be found|
|Failed to delete row|Indicates a problem deleting the specified row|

### <a name="insertcolumn"></a> Insert column to Excel worksheet
Inserts a column to the left of a selected column of an Excel instance

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Excel instance|No|Excel instance||The Excel instance to work with. This variable must have been previously specified in a Launch Excel action|
|Column|No|Text value||The column's index number or letter. A new column will appear on the left side of the column indicated|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="insertcolumn_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Can't find column|Indicates that a column with the specified name could not be found|
|Failed to insert column|Indicates a problem inserting a column at the specified Excel instance|

### <a name="deletecolumn"></a> Delete column from Excel worksheet
Deletes a selected column from an Excel instance

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Excel instance|No|Excel instance||The Excel instance to work with. This variable must have been previously specified in a Launch Excel action|
|Delete column|No|Text value||The index number or letter of the column to delete|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="deletecolumn_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Can't find column|Indicates that a column with the specified name could not be found|
|Failed to delete column|Indicates a problem deleting the specified column|

### <a name="getfirstfreerowoncolumn"></a> Get first free row on column from Excel worksheet
Retrieve the first free row, given the column of the active worksheet

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Excel instance|No|Excel instance||Specify the Excel instance. This variable must have been previously specified in a Launch Excel action|
|Column|No|Text value||The index or letter that identifies the column. Column numbering starts from index 1|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|FirstFreeRowOnColumn|Numeric value|The numeric value of the given column's first fully empty row|


##### <a name="getfirstfreerowoncolumn_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Failed to retrieve first free row|Indicates a problem retrieving the first free row of an Excel instance|

### <a name="launchexcel"></a> Launch Excel
Launches a new Excel instance or opens an Excel document

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Launch Excel|N/A|with a blank document, and open the following document|with a blank document|Specify whether to open a New Excel document, or an existing one|
|Document path|No|File||The full path of the existing Excel document to open|
|Make instance visible|N/A|Boolean value|True|Specify whether to make the Excel window visible or hide it|
|Password|Yes|Text value||The password on the Excel document, if it is password protected|
|Open as ReadOnly|N/A|Boolean value|False|Specify whether to open the stored document in read-only mode or not|
|Load add-ins and macros|N/A|Boolean value|False|Specify whether to load add-ins and macros into the new Excel instance|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|ExcelInstance|Excel instance|The specific Excel instance for use with later Excel actions. This allows the user to specify which of possibly several Excel spreadsheets to access|


##### <a name="launchexcel_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Failed to launch Excel|Indicates a problem launching an Excel instance|
|Failed to open Excel document|Indicates a problem opening the specified Excel document|

### <a name="attach"></a> Attach to running Excel
Attaches to an Excel document that's already open

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Document name|No|File||The name or the path of the Excel document to attach to|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|ExcelInstance|Excel instance|The Excel instance this action has attached to for use with later Excel actions|


##### <a name="attach_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Specified Excel document not found|Indicates that the specified Excel document could not be found|
|Failed to attach to Excel document|Indicates a problem attaching to the Excel document|

### <a name="readfromexcel"></a> Read from Excel worksheet
Reads the value of a cell or a range of cells from the active worksheet of an Excel instance

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Excel instance|No|Excel instance||The Excel instance to work with. This variable must have been previously specified in a Launch Excel action|
|Retrieve|N/A|Single Cell's Values, Values from a Range of Cells, Values from Selection|Single Cell's Values|Whether to retrieve the value of a single cell or a table from a range of cells|
|Start Column|No|Text value||The cell column (single cell's value) or first column as a numeric value or a letter|
|Start Row|No|Numeric value||The cell row (single cell's Value) or first row number|
|End Column|No|Text value||The last column as a numeric value or a letter|
|End Row|No|Numeric value||The last row number|
|Get Cell Contents as Text|N/A|Boolean value|False|Specify whether to retrieve the content of the cell(s) purely as text or as the closest matching type such as Date Time for dates, Numeric for numbers and so on|
|First line of range contains column names|N/A|Boolean value|False|Specify whether to consider the first row as column names. In this case, the names won't be read as data into the table and later actions can search the data by column names|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|ExcelData|General value|The value of the single cell|
|ExcelData|Datatable|The value of the range of cells as a DataTable|


##### <a name="readfromexcel_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Failed to read cell value(s)|Indicates a problem reading the value(s) of the specified Excel cell(s)|

### <a name="saveexcel"></a> Save Excel
Saves a previously launched Excel instance

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Excel instance|No|Excel instance||The Excel instance to save. This variable must have been previously specified in a Launch Excel action|
|Save mode|N/A|Save document, Save document as|Save document|How to save the document of this instance|
|Document format|N/A|Default (From Extension), Excel Workbook (.xlsx), Excel Workbook Macro Enabled (.xlsm), Excel 97-2003 Workbook (.xls), Web Page (.htm, .html), Excel Template (.xltx), Excel Template Macro Enabled (.xltm), Excel 97-2003 Template (.xlt), Text (.txt), Unicode Text (.txt), Text Macintosh (.txt), Text DOS (.txt), XML Spreadsheet (.xml), Excel 95 (.xls), CSV (.csv), DIF (.dif), SYLK (.slk), Excel Add-In (.xlam), Excel 97-2003 Add-In (.xla), Strict Open XML Workbook (.xlsx), OpenDocument Spreadsheet (.ods)|Default (From Extension)|The format to save the document as|
|Document path|No|File||The full path to save the document as|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="saveexcel_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Failed to save Excel document|Indicates a problem saving the Excel document|

### <a name="writetoexcel"></a> Write to Excel worksheet
Writes a value into a cell or a range of cells of an Excel instance

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Excel instance|No|Excel instance||The Excel instance to work with. This variable must have been previously specified in a Launch Excel action|
|Value to write|No|General value||Enter the text, number or variable to insert. If the variable contains a table, it will fill in cells to the right and below writing over other cell data if need be and a list will fill in cells below|
|Write mode|N/A|On specified cell, On currently active cell|On specified cell|Whether to write into a specified cell or the currently active cell|
|Column|No|Text value||The column number or letter for the cell to write to|
|Row|No|Numeric value||The row of the cell to write to. The numbering starts from 1, meaning that the index of the fist worksheet is 1, of the second is 2 etc.|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="writetoexcel_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Failed to write value to Excel|Indicates a problem writing the specified value to the Excel instance|

### <a name="closeexcel"></a> Close Excel
Closes an Excel instance

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Excel instance|No|Excel instance||The Excel instance to close. This variable must have been previously specified in a Launch Excel action|
|Before closing Excel|N/A|Do not save document, Save document, Save document as|Do not save document|Whether and how to save the document of this instance before closing that instance|
|Document format|N/A|Default (From Extension), Excel Workbook (.xlsx), Excel Workbook Macro Enabled (.xlsm), Excel 97-2003 Workbook (.xls), Web Page (.htm, .html), Excel Template (.xltx), Excel Template Macro Enabled (.xltm), Excel 97-2003 Template (.xlt), Text (.txt), Unicode Text (.txt), Text Macintosh (.txt), Text DOS (.txt), XML Spreadsheet (.xml), Excel 95 (.xls), CSV (.csv), DIF (.dif), SYLK (.slk), Excel Add-In (.xlam), Excel 97-2003 Add-In (.xla), Strict Open XML Workbook (.xlsx), OpenDocument Spreadsheet (.ods)|Default (From Extension)|The format of the document|
|Document path|No|File||The full path of the document|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="closeexcel_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Failed to save Excel document|Indicates a problem saving the Excel document|
|Failed to close Excel instance|Indicates a problem closing the Excel instance|

### <a name="setactiveworksheet"></a> Set active Excel worksheet
Activates a specific worksheet of an Excel instance

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Excel instance|No|Excel instance||Specify the Excel instance. This variable must have been previously specified in a Launch Excel action|
|Activate worksheet with|N/A|Index, Name|Name|Specify whether to find the worksheet by name or index|
|Worksheet index|No|Numeric value||The index number of the worksheet to activate. The numbering starts from 1, meaning that the index of the fist worksheet is 1, of the second is 2, etc.|
|Worksheet name|No|Text value||The name of the worksheet to activate|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="setactiveworksheet_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Can't find worksheet|Indicates that a worksheet with the specified name could not be found|
|Failed to activate worksheet|Indicates a problem activating the specified worksheet|

### <a name="addworksheet"></a> Add new worksheet
Adds a new worksheet to the document of an Excel instance

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Excel instance|No|Excel instance||Specify the Excel instance. This variable must have been previously specified in a Launch Excel action|
|New worksheet name|No|Text value||Specify the name of the new worksheet|
|Add worksheet as|N/A|First worksheet, Last worksheet|First worksheet|Specify whether the new Excel worksheet will be added before or after the existing worksheets|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="addworksheet_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|A worksheet with the same name already exists|Indicates that the worksheet could not be added because a worksheet with the same name already exists|
|Failed to add worksheet|Indicates a problem adding the worksheet|

### <a name="getfirstfreecolumnrow"></a> Get first free column/row from Excel worksheet
Retrieves the first free column and/or row of the active worksheet. This is useful for adding new data into a worksheet that already has data in it

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Excel instance|No|Excel instance||Specify The Excel instance. This variable must have been previously specified in a Launch Excel action|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|FirstFreeColumn|Numeric value|The numeric value of the first fully empty column. For example, if column F is the first empty column, it will be stored as '6'|
|FirstFreeRow|Numeric value|The numeric value of the first fully empty column. For example, if column F is the first empty column, it will be stored as '6'|


##### <a name="getfirstfreecolumnrow_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Failed to retrieve first free column/row|Indicates a problem retrieving the first free column/row of an Excel instance|


