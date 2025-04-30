---
title: File actions reference
description: See all the available file actions.
author: mattp123

ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: reference
ms.date: 10/24/2023
ms.author: iomavrid
ms.reviewer: matp
contributors:
- Yiannismavridis
- NikosMoutzourakis
- PetrosFeleskouras
search.audienceType: 
  - flowmaker
  - enduser
---


# File actions

> [!IMPORTANT]
> To prevent unauthorized access, Windows requires administrator rights to access protected files. To access these resources using the file actions, run Power Automate with administrator rights. For more information about running Power Automate as an administrator, go to [Run Power Automate with elevated rights](../setup.md#run-power-automate-with-elevated-rights).

Handling files and their content is essential for most automation scenarios. You can use the file actions to manage files, retrieve their properties, read and write data, and convert them to other types.

Most file actions require paths that specify the files you want to manipulate. These paths can be hard-coded values or [file datatype variables](../variable-data-types.md#files-and-folders).

>[!NOTE]
>To provide many files as input, use a [list variable](../variable-data-types.md#list) with file items. A method to create a list of files is the **Get files in folder** action.

Similarly, you can populate a hard-coded value or a [folder datatype variable](../variable-data-types.md#files-and-folders) to specify a destination folder in the actions that need one.

:::image type="content" source="media/file/move-files-example.png" alt-text="Screenshot of the Move files action.":::

Some file actions provide an extensive configuration, allowing you to automate virtually any scenario. For example, the **Rename file(s)** action includes options to set a new name or add, replace or remove a text string to the existing file name.

:::image type="content" source="media/file/rename-files-example.png" alt-text="Screenshot of the Rename files action.":::

To append text content or overwrite text files, deploy the **Write text to file** action. To read the content of a text file, use the **Read text from file** action.

Likewise, if you need to read or write content to CSV files, use the **Read from CSV file** and **Write to CSV file** actions. You can find an example desktop flow that handles CSV files in [Convert a CSV file into an Excel spreadsheet](../how-to/convert-csv-excel.md).

If you want to check if a file exists in a specific folder, use the **If file exists** action. This action is a conditional and allows you to run different blocks of code depending on whether the file exists. To find more information about conditionals, go to [Use conditionals](../use-conditionals.md).

## <a name="iffileaction"></a> If file exists

Marks the beginning of a conditional block of actions depending on whether a file exists or not.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|If file|N/A|Exists, Doesn't exist|Exists|The state of the file to check|
|File path|No|[File](../variable-data-types.md#files-and-folders)||The full path to look for the file|

### Variables produced

This action doesn't produce any variables.

### <a name="iffileaction_onerror"></a> Exceptions

This action doesn't include any exceptions.

## <a name="waitforfileaction"></a> Wait for file

Suspend the execution of the automation until a file is created or deleted.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Wait for file to be|N/A|Created, Deleted|Created|Specifies whether to pause the flow on the creation or deletion of a certain file|
|File path|No|[File](../variable-data-types.md#files-and-folders)||The full path to look for the file|

### Variables produced

This action doesn't produce any variables.

### <a name="waitforfileaction_onerror"></a> Exceptions

This action doesn't include any exceptions.

## <a name="copy"></a> Copy file(s)

Copy one or more files into a destination folder.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|File(s) to copy|No|[List](../variable-data-types.md#list) of [Files](../variable-data-types.md#files-and-folders)||The file(s) to copy. This value can be a file path, or a variable containing a file, a list of files, a text path, or a list of text paths. Use the 'Get files in folder' action to populate a variable with a list of files.|
|Destination folder|No|[Folder](../variable-data-types.md#files-and-folders)||The destination folder for the copied files|
|If file exists|N/A|Do nothing, Overwrite|Do nothing|Specifies what to do if a file with the same name already exists in the destination folder|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|CopiedFiles|[List](../variable-data-types.md#list) of [Files](../variable-data-types.md#files-and-folders)|The copied file(s) as a list of files|

### <a name="copy_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Source folder doesn't exist|Indicates that the source folder doesn't exist|
|Destination folder doesn't exist|Indicates that the destination folder doesn't exist|
|File not found|Indicates that the file doesn't exist|
|Can't copy file|Indicates a problem copying the file|

## <a name="move"></a> Move file(s)

Move one or more files into a destination folder.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|File(s) to move|No|[List](../variable-data-types.md#list) of [Files](../variable-data-types.md#files-and-folders)||The file(s) to move. This value can be a file path, or a variable containing a file, a list of files, a textual path, or a list of text paths. Use the 'Get files in folder' action to populate a variable with a list of files.|
|Destination folder|No|[Folder](../variable-data-types.md#files-and-folders)||The destination folder for the moved files|
|If file exists|N/A|Do nothing, Overwrite|Do nothing|Specifies what to do if a file with the same name already exists in the destination folder|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|MovedFiles|[List](../variable-data-types.md#list) of [Files](../variable-data-types.md#files-and-folders)|The moved file(s) as a list of files|

### <a name="move_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Source folder doesn't exist|Indicates that the source folder doesn't exist|
|Destination folder doesn't exist|Indicates that the destination folder doesn't exist|
|File not found|Indicates that the file doesn't exist|
|Can't move file|Indicates a problem moving the file|

## <a name="delete"></a> Delete file(s)

Delete one or more files.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|File(s) to delete|No|[List](../variable-data-types.md#list) of [Files](../variable-data-types.md#files-and-folders)||The file(s) to delete. This value can be a file path, or a variable containing a file, a list of files, a text path, or a list of text paths. Use the 'Get files in folder' to populate a variable with a list of files|

### Variables produced

This action doesn't produce any variables.

### <a name="delete_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|File path doesn't exist|Indicates that the file path doesn't exist|
|File not found|Indicates that the file doesn't exist|
|Can't delete file|Indicates a problem deleting the file|

## <a name="renamefiles"></a> Rename file(s)

Change the name of one or more files.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|File to rename|No|[List](../variable-data-types.md#list) of [Files](../variable-data-types.md#files-and-folders)||The file(s) to rename. This value can be a file path, or a variable containing a file, a list of files, a text path, or a list of text paths. Use the 'Get files in folder' action to populate a variable with a list of files.|
|Add number to|N/A|[Boolean value](../variable-data-types.md#boolean-value)|True|Specifies whether to add the number to the existing file name(s) or a new name|
|Rename scheme|N/A|Set new name, Add text, Remove text, Replace text, Change extension, Add datetime, Make sequential|Set new name|Specifies how to rename the file(s)|
|New file name|No|[Text value](../variable-data-types.md#text-value)||The new name of the file(s)|
|New extension|Yes|[Text value](../variable-data-types.md#text-value)||The text to add as the new extension for the file(s)|
|New file name|No|[Text value](../variable-data-types.md#text-value)||The new name of the file(s)|
|Add number to|N/A|After name, Before name|After name|Specifies whether to add the number before or after the original name(s) or a new base name|
|Text to add|Yes|[Text value](../variable-data-types.md#text-value)||The text to add to the original file name(s)|
|Text to remove|Yes|[Text value](../variable-data-types.md#text-value)||The text to remove from the original file name(s). This rename scheme searches each file name, and removes the entered text anywhere in the name, each time it occurs.|
|Text to replace|No|[Text value](../variable-data-types.md#text-value)||The text to replace in the original file name(s). This rename scheme searches each file name, and replaces the entered text anywhere in the name, each time it occurs|
|Use custom datetime|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specifies whether to use a custom datetime|
|Datetime to add|N/A|Current datetime, Creation time, Last accessed, Last modified|Current datetime|Specifies what datetime value to add to the file name(s)|
|Keep extension|N/A|[Boolean value](../variable-data-types.md#boolean-value)|True|Specifies whether to include the previous extension with the file name(s). Disable this option to add the extension to the file(s) manually.|
|Replace with|Yes|[Text value](../variable-data-types.md#text-value)||The text to replace the original text with|
|Start numbering at|No|[Numeric value](../variable-data-types.md#numeric-value)||The starting number value|
|Add text|N/A|After name, Before name|After name|Specifies whether to add the text before or after the original name(s)|
|Custom datetime|No|[Datetime](../variable-data-types.md#dates-and-time)||The datetime to add to the file name(s)|
|Increment by|No|[Numeric value](../variable-data-types.md#numeric-value)||The number to increment the starting value by|
|Add datetime|N/A|After name, Before name|After name|Specifies whether to add the datetime before or after the original name(s)|
|Separator|N/A|Nothing, Space, Dash, Period, Underscore|Space|Specifies what to use to separate the original file name and the number added, including the option to not use a separator|
|Separator|N/A|Nothing, Space, Dash, Period, Underscore|Space|Specifies what to use to separate the original file name and the datetime value added, including the option to not use a separator|
|Use padding|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specifies whether to use padding|
|Datetime format|No|[Text value](../variable-data-types.md#text-value)|yyyyMMdd|The format of the datetime value to add to the file name, such as MM/dd/yyyy for date, and hh:mm:sstt for time|
|Make each number at least|Yes|[Numeric value](../variable-data-types.md#numeric-value)|3|The minimum length for each number added|
|If file exists|N/A|Do nothing, Overwrite|Do nothing|Specifies what to do if a file with the same name already exists in the folder|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|RenamedFiles|[List](../variable-data-types.md#list) of [Files](../variable-data-types.md#files-and-folders)|The renamed file(s) as a list of files|

### <a name="renamefiles_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Directory not found|Indicates that the directory wasn't found|
|File not found|Indicates that the file doesn't exist|
|Can't rename file|Indicates a problem renaming the file|

## <a name="readtextfromfile"></a> Read text from file

Read the contents of a text file.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|File path|No|[File](../variable-data-types.md#files-and-folders)||The file to read|
|Store content as|N/A|Single text value, List (each is a list item)|Single text value|Specifies how to store the text. Choose 'Single text value' to store the entire text as a single text value. Choose 'List' to store each line of the original text as a text item in a list.|
|Encoding|N/A|System default, ASCII, Unicode, Unicode (big-endian), UTF-8|UTF-8|The encoding to read the specified text from the text file with.|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|FileContents|[Text value](../variable-data-types.md#text-value)|The contents as a text|
|FileContents|[List](../variable-data-types.md#list) of [Text values](../variable-data-types.md#text-value)|The contents as a list of texts|

### <a name="readtextfromfile_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Directory not found|Indicates that the directory wasn't found|
|File not found|Indicates that the file doesn't exist|
|Failed to read from file|Indicates a problem reading from the file|

## <a name="writetext"></a> Write text to file

Write or appends text to a file.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|File path|No|[File](../variable-data-types.md#files-and-folders)||The file to write the text. This value can be a file path, or a variable containing a file or a textual path.|
|Text to write|Yes|[General value](../variable-data-types.md#general-value)||The text to write in the specified file|
|Append new line|N/A|[Boolean value](../variable-data-types.md#boolean-value)|True|Specifies whether to append a new line at the end of the overall text to write to the file|
|If file exists|N/A|Overwrite existing content, Append content|Overwrite existing content|Specifies whether to overwrite the existing content, or to append to the end of the existing content. If the file doesn't exist, this action automatically creates it.|
|Encoding|N/A|System default, ASCII, Unicode, Unicode (big-endian), UTF-8, Unicode (without byte order mask), UTF-8 (without byte order mask)|Unicode|The encoding to use for the specified text to write into the text file|

### Variables produced

This action doesn't produce any variables.

### <a name="writetext_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to write text to file|Indicates a problem writing to the file|
|Invalid directory for file|Indicates that the directory is invalid|

## <a name="readfromcsvfile"></a> Read from CSV file

Read a CSV file into a data table.

You can use the **Read from CSV file** action to create a datatable variable with the file's contents. You need to define the path to the CSV file and the encoding to use for reading it, while you can also trim any whitespaces from the extracted cells, handle the first line as column headers, and specify the columns separator.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|File path|No|[File](../variable-data-types.md#files-and-folders)||The CSV file to read. This value can be a file path, or a variable containing a file or a textual path|
|Encoding|N/A|UTF-8, Unicode, Unicode (big-endian), UTF-8 (No byte order mark), Unicode (no byte order mark), System default, ASCII|UTF-8|The encoding to be used for reading the specified CSV file|
|Trim fields|N/A|[Boolean value](../variable-data-types.md#boolean-value)|True|Specifies whether to automatically trim off the leading and trailing whitespaces of the extracted cells|
|First line contains column names|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specifies whether to use the first row of the CSV resource to set the column names of the resulting data table variant. Enable this option to avoid reading the names as data into the table. Subsequent actions may access the data held by the data table using column names (instead of column numbers).|
|Columns separator|N/A|Predefined, Custom, Fixed column widths|Predefined|Specifies whether to use a predefined columns separator, a custom one or fixed column widths|
|Separator|N/A|System default, Comma, Semicolon, Tab|System default|The column-separator to parse the CSV file|
|Custom separator|No|[Text value](../variable-data-types.md#text-value)||The custom column-separator to use for parsing the CSV resource specified|
|Fixed column widths|No|[Text value](../variable-data-types.md#text-value)||The fixed column-widths to use for parsing the CSV resource specified. Separate the widths using commas, spaces, tabs or newlines.|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|CSVTable|[Datatable](../variable-data-types.md#datatable)|The contents of the CSV file as a data table|

### <a name="readfromcsvfile_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Read from CSV failed|Indicates a problem reading from the CSV file|

## <a name="writetocsvfile"></a> Write to CSV file

Write a data table, data row or list to a CSV file.

Use the **Write to CSV file** action to write a data table, data row or list variable to a target CSV file. In the **File path** parameter, specify the file path or variable containing a file or textual path where the data will be exported to.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Variable to write|No|[General value](../variable-data-types.md#general-value)||The data table, data row variable or list variable to write into the target CSV file|
|File path|No|[File](../variable-data-types.md#files-and-folders)||The CSV file to export the variable to. This value can be a file path, or a variable containing a file or a textual path.|
|Encoding|N/A|UTF-8, Unicode, Unicode (big-endian), UTF-8 (No byte order mark), Unicode (no byte order mark), System default, ASCII|UTF-8|The encoding to use for writing to the specified CSV file |
|Include column names|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specifies whether the column names of the variant specified should become the first row of the CSV file. This option takes effect if and only if the target CSV file either doesn't initially exist or exists but is otherwise empty of text.|
|If file exists|N/A|Overwrite existing content, Append content|Overwrite existing content|Specifies the desired behavior when the targeted CSV file already exists in the filesystem|
|Separator|N/A|System default, Comma, Semicolon, Tab|System default|The column separator to use in the specified CSV file|
|Custom columns separator|No|[Text value](../variable-data-types.md#text-value)||The custom column separator to use in the CSV file|
|Use custom columns separator|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specifies whether to use a custom columns separator or a predefined one|

### Variables produced

This action doesn't produce any variables.

### <a name="writetocsvfile_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Write failed|Indicates a problem writing to the CSV file|

## <a name="getpathpart"></a> Get file path part

Retrieve one or more parts (directory, filename, extension, etc.) from a text that represents a file path.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|File path|No|[File](../variable-data-types.md#files-and-folders)||The file path to use as the source|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|RootPath|[File](../variable-data-types.md#files-and-folders)|The root path of the source file|
|Directory|[Folder](../variable-data-types.md#files-and-folders)|The directory of the source file|
|FileName|[Text value](../variable-data-types.md#text-value)|The name of the source file|
|FileNameNoExtension|[Text value](../variable-data-types.md#text-value)|The file name (without the extension) of the source file|
|FileExtension|[Text value](../variable-data-types.md#text-value)|The extension (for example, .doc) of the source file|

### <a name="getpathpart_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|File path contains invalid characters|Indicates that the file path doesn't exist|

## <a name="gettemppath"></a> Get temporary file

Create a uniquely named, empty temporary file on disk, and get the file object (which is a representation, and can access the file and all its information).

### Input parameters

This action doesn't require any input.

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|TempFile|[File](../variable-data-types.md#files-and-folders)|The temporary file object|

### <a name="gettemppath_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to create temporary file|Indicates a problem creating a temporary file|

## <a name="convertfiletobase64action"></a> Convert file to Base64

Convert a file to Base64 encoded text.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|File path|No|[File](../variable-data-types.md#files-and-folders)||The file path to read from|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|Base64Text|[Text value](../variable-data-types.md#text-value)|The Base64 encoded text|

### <a name="gettemppath_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|File not found|Indicates that the file doesn't exist|
|Can't convert file to Base64|Indicates that the provided file can't be converted into Base64 encoded text|

## <a name="convertbase64tofileaction"></a> Convert Base64 to file

Convert a Base64 encoded text to file.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Base64 encoded text|No|[Text value](../variable-data-types.md#text-value)||The Base64 encoded text|
|File path|No|[File](../variable-data-types.md#files-and-folders)||The file to write to|
|If file exists|N/A|Do nothing, Overwrite|Do nothing|Specifies what to do if a file with the same name already exists in the destination folder|

### Variables produced

This action doesn't produce any variables.

### <a name="gettemppath_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Invalid directory for file|Indicates that the directory is invalid|
|Can't convert Base64 to file|Indicates that the provided Base64 encoded text can't be converted into a file|

## <a name="convertfiletobinaryaction"></a> Convert file to binary data

Convert a file to binary data.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|File path|No|[File](../variable-data-types.md#files-and-folders)||The file to read from|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|BinaryData|[Text value](../variable-data-types.md#text-value)|The binary data to write|

### <a name="convertfiletobinaryaction_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|File not found|Indicates that the file doesn't exist|
|Can't convert file to binary data|Indicates that the provided file can't be converted to binary data|

## <a name="convertbinarytofileaction"></a> Convert binary data to file

Convert binary data to file.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Binary data|No|[Text value](../variable-data-types.md#text-value)||The binary data|
|File path|No|[File](../variable-data-types.md#files-and-folders)||The file to write to|
|If file exists|N/A|Do nothing, Overwrite|Do nothing|Specifies what to do if a file with the same name already exists in the destination folder|

### Variables produced

This action doesn't produce any variables.

### <a name="convertbinarytofileaction_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Invalid directory for file|Indicates that the directory is invalid|
|Can't convert binary file to file|Indicates that the provided binary data can't be converted into a file|

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
