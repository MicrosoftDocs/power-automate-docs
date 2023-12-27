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
|Launch Word|N/A|With a blank document, and open the following document|With a blank document|Specify whether to open a New Word document, or an existing one|
|Document path|No|File||The full path of the existing Word document to open|
|Make instance visible|N/A|Boolean value|True|Specify whether to make the Word window visible or hide it|
|Open as ReadOnly|N/A|Boolean value|False|Specify whether to open the stored document in read-only mode or not|
|Read protection password|Yes|Direct encrypted input or Text value||The read protection password on the Word document, if it's password protected|
|Write protection password|Yes|Direct encrypted input or Text value||The write protection password on the Word document, if it's password protected|


### Variables produced
|Argument|Type|Description|
|-----|-----|-----|
|WordInstance|Word instance|The specific Word instance for use with later Word actions. This allows the user to specify which of possibly several Word spreadsheets to access|

### <a name="launchword_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to launch Word|Indicates a problem launching a Word instance|
|The Word document was not found|Indicates that the specific Word document could not be found in the provided location|
|Failed to open existing Word document|Indicates a problem opening the specified Word document|
|Failed to launch Word application|Indicates that Word application could not be launched due to an internal error|
|Word application is not installed|Indicates that Word application is not installed in the specific machine|

## <a name="closeword"></a> Close Word

Closes a Word instance.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Word instance|No|Word instance||The Word instance to close. This variable must have been previously specified in a Launch Word or Attach to running Word action.|
|Before closing Word|N/A|Do not save document, Save document, Save document as|Don't save document|Specify whether and how to save the document of this instance before closing that instance.| 
|Document format|N/A|All available formats from Word app|Default (From Extension)|The format of the document.|
|Document path|No|File||The full path of the document. Insert the desired document file extension according to the selection in the Document format parameter.|

### Variables produced

This action doesn't produce any variables.

### <a name="closeword_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to close Word|Indicates a problem closing the Word doucument|
|Failed to save Word|Indicates a problem saving the Word document|
|The operation cannot be performed on a read-only document|Indicates that Word document cannot be saved as it has been opened as read-only|




## <a name="attach"></a> Attach to running Word

Attaches to a Word document that's already open.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Document name|No|File||The name or the path of the Word document to attach to|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|WordInstance|Word instance|The Word instance this action has attached to for use with later Word actions|



### <a name="attach_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to attach to Word document|Indicates a problem attaching to the specified Word doucument|
|Specified Word document not found|Indicates that the specific Word document could not be found in the provided location|
|Failed to launch Word|Indicates that Word application could not be launched due to an internal error|


## <a name="saveword"></a> Save Word

Saves a previously launched Word instance.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Word instance|No|Word instance||The Word instance to save. This variable must have been previously specified in a Launch Word or Attach to running Word action.|
|Save mode|N/A|Save document, Save document as|Save document|How to save the document of this instance.|
|Document format|N/A|All available formats from Word app|Default (From Extension)|The format of the document.|
|Document path|No|File||The full path of the document. Insert the desired document file extension according to the selection in the Document format parameter.|

### Variables produced

This action doesn't produce any variables.


### <a name="saveword_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to save Word|Indicates a problem saving the Word doucument|
|The Word instance or the Word document is not initialized|Indicates that Word instance or Word document specified in action is not initiliazed|
|The operation cannot be performed on a read-only document|Indicates that Word document cannot be saved as it has been opened as read-only|

## <a name="findandreplaceword"></a> Find and replace words in Word document

Finds text and replaces it with another in the active worksheet of an Excel instance.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Word instance|No|Word instance||The Word instance to work with|This variable must have been previously specified in a Launch Word or Attach to running Word action|
|All matches|N/A|Boolean value|False|Whether to find/ and replace text in all the matching occurrences found or in the first matching occurrence only|
|Text to find|No|Text value||The text to find in the worksheet|
|Text to replace with|No|Text value||The text used to replace the matching cells|
|Use wildcards|N/A|Boolean value|False|Whether to use wildcards for the text to find|
|Match case|N/A|Boolean value|False|Whether to search for case-sensitive data|
|Match whole words only|N/A|Boolean value|False|Whether to search for words that are the same as the specified text|

### Variables produced

This action doesn't produce any variables.

### <a name="findandreplaceword_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to replace text in Word document|Indicates a problem replacing the specified text with the provided input|
|The Word instance or the Word document is not initialized|Indicates that Word instance or Word document specified in action is not initiliazed|
|The operation cannot be performed on a read-only document|Indicates that Word document cannot be edited as it has been opened as read-only|

## <a name="readfromword"></a> Read from Word document

Reads the text content from a document of a Word instance.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Word instance|No|Word instance||The Word instance to work with|This variable must have been previously specified in a Launch Word or Attach to running Word action|
|Retrieve|N/A|Whole document/Pages/Bookmark|Whole document|Whether to retrieve the content of the whole document, of a specific page or pages, or of a bookmark|
|Page|No|Numeric value||The pages of the Word document to be read|A range of pages or a list can be provided as 2-5, which will retrieve content from page 2 to page 5 or 2,3,7, retrieve content from 2,3,7 pages|
|Bookmark|No|Text value||The bookmark of the Word document to be read|

### Variables produced
|Argument|Type|Description|
|-----|-----|-----|
|WordData|Text value|The value of the retrieved content|

### <a name="readfromword_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to read the content from a Word document|Indicates a problem retrieving the content from the specified Word document|
|The Word instance or the Word document is not initialized|Indicates that Word instance or Word document specified in action is not initiliazed|

## <a name="writetoword"></a> Write to Word document

Write or append text to a Word file.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Word instance|No|Word instance||The Word instance to work with|This variable must have been previously specified in a Launch Word or Attach to running Word action|
|Text to write|Yes|General value||The text to write in the specified Word document|
|Append new line|N/A|Boolean value|True|Specifies whether to append a new line at the start of the overall text to write to the document|
|Write text to|No|Beginning of Word file/End of Word file/Before of Bookmark/After of Bookmark||Specifies the position of the Word document tha text will be appended|
|Bookmark|Yes|Text value||The target bookmark in the Word document where the text will be appended|This action appends text before or after of the specified bookmark in the Word document|

### Variables produced

This action doesn't produce any variables.

### <a name="writetoword_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|The Word instance or the Word document is not initialized|Indicates that Word instance or Word document specified in action is not initiliazed|
|The operation cannot be performed on a read-only document|Indicates that Word document cannot be edited as it has been opened as read-only|
|The write operation on the Word document instance failed|Indicates a problem writing content in the specified Word document|

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
