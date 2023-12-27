---
title: Word actions reference
description: See all the available Word actions.
author: NikosMoutzourakis
ms.subservice: desktop-flow
ms.topic: reference
ms.date: 12/27/2023
ms.author: nimoutzo
ms.reviewer: matp
contributors:
- jpapadimitriou
- Yiannismavridis
- NikosMoutzourakis
- PetrosFeleskouras
search.audienceType: 
  - flowmaker
  - enduser
---

# Word actions

++++++++++++++++++++++++++++

## <a name="launchword"></a> Launch Word

Launches a new Word instance or opens a Word document.

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

### <a name="launchword_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to resize columns/rows|Indicates a problem while resizing columns/rows|

## <a name="attach"></a> Attach to running Word

Attaches to a Word document that's already open.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Excel instance|No|[Excel instance](../variable-data-types.md#instances)||The Excel instance to work with. This variable must have been previously specified in a Launch Excel action.|
|Macro|No|[Text value](../variable-data-types.md#text-value)||The macro to run. The text should consist of the name of the macro, followed by any arguments (optional), all separated by semicolons.|

### Variables produced

This action doesn't produce any variables.

### <a name="attach_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to run macro|Indicates a problem running the specified macro|

## <a name="closeword"></a> Close Word

Closes a Word instance.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Excel instance|No|[Excel instance](../variable-data-types.md#instances)||The Excel instance to work with. This variable must have been previously specified in a Launch Excel action.|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|SheetName|[Text value](../variable-data-types.md#text-value)|The name of the active worksheet|
|SheetIndex|[Numeric value](../variable-data-types.md#numeric-value)|The index of the active worksheet|

### <a name="closeword_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to retrieve active worksheet|Indicates a problem retrieving the active worksheet|

## <a name="saveword"></a> Save Word

Saves a previously launched Word instance.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Excel instance|No|[Excel instance](../variable-data-types.md#instances)||Specify the Excel instance. This variable must have been previously specified in a Launch Excel action.|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|SheetNames|[List](../variable-data-types.md#list) of [Text values](../variable-data-types.md#text-value)|The names of all worksheets|

### <a name="saveword_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to retrieve all worksheet names|Indicates a problem retrieving the names of the Excel worksheet|

## <a name="findandreplaceword"></a> Find and replace words in Word document

Finds text and replaces it with another in the active worksheet of an Excel instance.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Excel instance|No|[Excel instance](../variable-data-types.md#instances)||The Excel instance to work with. This variable must have been previously specified in a Launch Excel action.|
|Delete worksheet with|N/A|Index, Name|Name|Whether to find the worksheet by name or index|
|Worksheet index|No|[Numeric value](../variable-data-types.md#numeric-value)||The Index number of the worksheet to delete. The numbering starts from 1, meaning that the index of the first worksheet is 1, the second is 2, and so on.|
|Worksheet name|No|[Text value](../variable-data-types.md#text-value)||The name of the worksheet to delete|

### Variables produced

This action doesn't produce any variables.

### <a name="findandreplaceword_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Can't find worksheet|Indicates that a worksheet with the specified name couldn't be found|
|Failed to delete worksheet|Indicates a problem deleting the specified worksheet|

## <a name="readfromword"></a> Read from Word document

Reads the text content from a document of a Word instance.

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

### <a name="readfromword_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Can't find worksheet|Indicates that a worksheet with the specified name couldn't be found|
|Failed to rename worksheet|Indicates a problem renaming the specified worksheet|

## <a name="writetoword"></a> Write to Word document

Write or append text to a Word file.

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

### <a name="writetoword_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to activate cell|Indicates a problem activating an Excel cell|

## <a name="insertimagetoword"></a> Insert image in Word document

Insert an image to a Word file.

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

### <a name="insertimagetoword_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to select cells|Indicates a problem selecting the specified cells|


## Known limitations

### Using Excel files synchronized through OneDrive or SharePoint

Interaction with Microsoft Excel files that are contained in folders synchronized in OneDrive or SharePoint might result in an erroneous flow. Power Automate for desktop utilizes COM objects for Excel interactions. OneDrive and SharePoint aren't fully compatible with Excel instances launched through COM.

For this reason, when you try to open an Excel file stored under a OneDrive or SharePoint directory, you might encounter a **file not found** error. To resolve this issue, use one of the following workarounds:

#### Workaround 1

* Make a local copy of the respective Excel file.
* Modify the local copy of the Excel file using Power Automate for desktop's Excel automation actions.
* Override the Excel file copy synchronized through OneDrive/ Sharepoint with the local copy that includes the latest changes.

#### Workaround 2
>[!NOTE]
> This workaround can be used in general when the **Launch Excel** action fails to execute.
* Open a new Excel instance using the **Run application** action. Make sure that you provide enough wait time between actions, allowing the Excel process to load completely, including any add-ins.
* Use the action **Attach to Excel** to attach to the new process.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
