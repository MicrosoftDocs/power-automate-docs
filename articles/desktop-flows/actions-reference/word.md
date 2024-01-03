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

Our Word automation feature enables you to seamlessly interact with Word files stored either locally or in the cloud. To begin, you'll need to create a Word instance using either the 'Launch Word' or 'Attach to running Word' action. This instance will serve as the input parameter for the rest of the actions in the group, allowing you to easily perform actions on the desired Word file.

Currently, the below actions are available:
* **Launch Word:** When this action is triggered in Power Automate for desktop, it launches a Word document and creates a Word instance that can be used in subsequent Word actions within the same desktop flow. The user can choose to open either a new, blank Word document or an existing one located in the local machine or the cloud (through OneDrive or SharePoint). Depending on the action's configuration, the Word application may be launched visibly or invisibly, and the document may be opened in Read-only mode. It's important to note that if the document is opened in Read-only mode, it cannot be edited either through Power Automate for desktop actions or manually.
* **Attach to running Word:** This action provide the capability to attach to an existing Word document that is currently open and creates a Word instance that can be used in subsequent Word actions within the same desktop flow. The user has the option to insert a Word document that is already open on the same machine at the time of design through a drop-down menu, or select an existing Word document located in the local machine or the cloud (through OneDrive or SharePoint).
* **Save Word:** This action enables the users to save a Word document in any format that currently Word application supports. Note that the default document format is 'Default (From Extension)' which means that the user must set the document format in the 'Document path' parameter, i.e., set the value to 'C:\TestWord.pdf' to save it as PDF. 
* **Close Word:** This action will close a Word document and make the specific Word instance in Power Automate as inactive. User may save the Word document befaure closing it in any format that currently Word application supports. Note that the default document format is 'Default (From Extension)' which means that the user must set the document format in the 'Document path' parameter, i.e., set the value to 'C:\TestWord.pdf' to save it as PDF. 
* **Read from Word document:** This action enables users to retrieve content from a Word document and use it in a subsequent action of the flow. You have the flexibility to read the entire document, specific pages, or the content of a bookmark. For pages, you can specify a specific page or a list of pages. For example, you can insert the value '2-5' in the respective 'Pages' parameter to retrieve the content of pages 2 to 5 (i.e., pages 2, 3, 4, and 5), or insert the value '3,5,6,7' to retrieve the content of the respective pages or use a combination of both ways, i.e., '2-4,6,8,9'. It's important to note that the Word document format cannot be retrieved, and the output parameter will be in plain text.
:::image type="content" source="media/word/readword.png" alt-text="Screenshot of action to read from a Word instance":::
* **Find and replace words in Word document:** Users can now leverage a new functionality with this action, which is the ability to find and replace specific text within a Word document. Users have the option to replace only the first occurrence of the text or all matches. Additionally, the use of wildcards allows for dynamic text finding, with the wildcard being inserted in the 'Text to find' input parameter. To further refine the search, users can configure the tool to match the case of the text or match whole words only. These settings are available when the 'Use wildcards' parameter is set to off.
:::image type="content" source="media/word/findandreplaceword.png" alt-text="Screenshot of action to find a text and replace it in a Word instance":::
* **Write to Word document:** This action enables users to insert text in specific positions within a Word document. This can be done at the beginning or end of the file, or before or after a specific bookmark. Additionally, users have the option to append a new line before the inserted text or not, depending on their preferences.
:::image type="content" source="media/word/writeword.png" alt-text="Screenshot of action to write in a Word instance":::
* **Insert image in Word document:** This action allows users to insert images in specific positions within a Word document. This can be done at the beginning or end of the file, before or after a specific bookmark, or before or after specific text. Note that no spaces or new lines will be added. Furthermore, users have the option to retrieve the image either as a file stored in their local machine or as content from the clipboard.
:::image type="content" source="media/word/insertimageword.png" alt-text="Screenshot of action to insert an image in a Word instance":::

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

## <a name="readfromword"></a> Read from Word document

Reads the text content from a document of a Word instance.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Word instance|No|Word instance||The Word instance to work with|This variable must have been previously specified in a Launch Word or Attach to running Word action|
|Retrieve|N/A|Whole document/Pages/Bookmark|Whole document|Whether to retrieve the content of the whole document, of specific pages, or a bookmark|
|Page|No|Numeric value|1|The pages of the Word document to be read. A range of pages or a list can be provided as 2-5, which will retrieve content from page 2 to page 5 or 2,3,7, retrieve content from 2,3,7 pages|
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
|Write text to|N/A|Beginning of Word file/End of Word file/Before of Bookmark/After of Bookmark|Beginning of Word file|Specifies the position of the Word document tha text will be appended|
|Bookmark|No|Text value||The target bookmark in the Word document where the text will be appended|This action appends text before or after of the specified bookmark in the Word document|

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
|Word instance|No|Word instance||The Word instance to work with|This variable must have been previously specified in a Launch Word or Attach to running Word action|
|Insert image to|N/A|Beginning of Word file/End of Word file/Before of Bookmark/After of Bookmark/Before specific text /After specific text|Beginning of Word file|Specifies the position of the Word document that image will be appended|
|Insert image from|N/A|File/Clipboard|File|The location of the image to be inserted in the specified Word document|
|Image path|No|File||The full path of the image to be inserted|
|Text to find|No|Text value||The text to find in the Word document for inserting image|Image will be appended before or after any occurrence of the specified text|
|Bookmark|No|Text value||The target bookmark in the Word document where the image will be appended| 

### Variables produced

This action doesn't produce any variables.

### <a name="insertimagetoword_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|The Word instance or the Word document is not initialized|Indicates that Word instance or Word document specified in action is not initiliazed|
|The operation cannot be performed on a read-only document|Indicates that Word document cannot be edited as it has been opened as read-only|
|Failed to insert image|Indicates a problem inserting the image in the specified Word document|

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


## Known limitations

### Using Word files synchronized through OneDrive or SharePoint

Interaction with Microsoft Word files that are contained in folders synchronized in OneDrive or SharePoint might result in an erroneous flow. Power Automate for desktop utilizes COM objects for Word interactions. OneDrive and SharePoint aren't fully compatible with Word instances launched through COM.

For this reason, when you try to open an Word file stored under a OneDrive or SharePoint directory, you might encounter a **file not found** error. To resolve this issue, use one of the following workarounds:

#### Workaround 1

* Make a local copy of the respective Word file.
* Modify the local copy of the Word file using Power Automate for desktop's Word automation actions.
* Override the Word file copy synchronized through OneDrive/ Sharepoint with the local copy that includes the latest changes.

#### Workaround 2
>[!NOTE]
> This workaround can be used in general when the **Launch Word** action fails to execute.
* Open a new Word instance using the **Run application** action. Make sure that you provide enough wait time between actions, allowing the Word process to load completely, including any add-ins.
* Use the action **Attach to running Word** to attach to the new process.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
