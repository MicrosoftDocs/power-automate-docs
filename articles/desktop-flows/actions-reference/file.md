---
title: File | Microsoft Docs
description: File Actions Reference
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

# File

[!INCLUDE [cc-beta-prerelease-disclaimer.md](../../../includes/cc-beta-prerelease-disclaimer.md)]

Manage and manipulate files

|<!-- --> |
|-----|
|[Copy file(s)](#copy)|
|[Move file(s)](#move)|
|[Delete file(s)](#delete)|
|[Rename file(s)](#renamefiles)|
|[Read text from file](#readtextfromfile)|
|[Write text to file](#writetext)|
|[Read from CSV file](#readfromcsvfile)|
|[Write to CSV file](#writetocsvfile)|
|[Get filepath part](#getpathpart)|
|[Get temporary file](#gettemppath)|

### <a name="copy"></a> Copy file(s)
Copy one or more files into a destination folder

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|File(s) to copy|No|List of Files||The file(s) to copy. This can be a file path, or a variable containing a file, a list of files, a text path, or a list of text paths. Use the 'Get files in folder' action to populate a variable with a list of files|
|Destination folder|No|Folder||The destination folder for the copied files|
|If file exists|N/A|Do nothing, Overwrite|Do nothing|Specifies what to do if a file with the same name already exists in the destination folder|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|CopiedFiles|List of Files|The copied file(s) as a list of files|


##### <a name="copy_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Source folder doesn't exist|Indicates that the source folder doesn't exist|
|Destination folder doesn't exist|Indicates that the destination folder doesn't exist|
|File not found|Indicates that the file doesn't exist|
|Can't copy file|Indicates a problem copying the file|

### <a name="move"></a> Move file(s)
Move one or more files into a destination folder

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|File(s) to move|No|List of Files||The file(s) to move. This can be a file path, or a variable containing a file, a list of files, a textual path, or a list of text paths. Use the 'Get files in folder' action to populate a variable with a list of files|
|Destination folder|No|Folder||The destination folder for the moved files|
|If file exists|N/A|Do nothing, Overwrite|Do nothing|Specifies what to do if a file with the same name already exists in the destination folder|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|MovedFiles|List of Files|The moved file(s) as a list of files|


##### <a name="move_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Source folder doesn't exist|Indicates that the source folder doesn't exist|
|Destination folder doesn't exist|Indicates that the destination folder doesn't exist|
|File not found|Indicates that the file doesn't exist|
|Can't move file|Indicates a problem moving the file|

### <a name="delete"></a> Delete file(s)
Delete one or more files

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|File(s) to delete|No|List of Files||The file(s) to delete. This can be a file path, or a variable containing a file, a list of files, a text path, or a list of text paths. Use the 'Get files in folder' to populate a variable with a list of files|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="delete_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|File path doesn't exist|Indicates that the file path doesn't exist|
|File not found|Indicates that the file doesn't exist|
|Can't delete file|Indicates a problem deleting the file|

### <a name="renamefiles"></a> Rename file(s)
Change the name of one or more files

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|File to rename|No|List of Files||The file(s) to rename. This can be a file path, or a variable containing a file, a list of files, a text path, or a list of text paths. Use the 'Get files in folder' action to populate a variable with a list of files|
|Add number to|N/A|Boolean value|True|Specifies whether to add the number to the existing file name(s) or a new name|
|Rename scheme|N/A|Set new name, Add text, Remove text, Replace text, Change extension, Add datetime, Make sequential|Set new name|Specifies how to rename the file(s)|
|New file name|No|Text value||The new name of the file(s)|
|New extension|Yes|Text value||The text to add as the new extension for the file(s)|
|New file name|No|Text value||The new name of the file(s)|
|Add number to|N/A|After name, Before name|After name|Specifies whether to add the number before or after the original name(s) or a new base name|
|Text to add|Yes|Text value||The text to add to the original file name(s)|
|Text to remove|Yes|Text value||The text to remove from the original file name(s). This rename scheme searches each file name, and removes the entered text anywhere in the name, each time it occurs|
|Text to replace|No|Text value||The text to replace in the original file name(s). This rename scheme searches each file name, and replaces the entered text anywhere in the name, each time it occurs|
|Use custom datetime|N/A|Boolean value|False|Specifies whether to use a custom datetime|
|Datetime to add|N/A|Current datetime, Creation time, Last accessed, Last modified|Current datetime|Specifies what datetime value to add to the file name(s)|
|Keep extension|N/A|Boolean value|True|Specifies whether to include the previous extension with the file name(s). Disable this option to add the extension to the file(s) manually|
|Replace with|Yes|Text value||The text to replace the original text with|
|Start numbering at|No|Numeric value||The starting number value|
|Add text|N/A|After name, Before name|After name|Specifies whether to add the text before or after the original name(s)|
|Custom datetime|No|Datetime||The datetime to add to the file name(s)|
|Increment by|No|Numeric value||The number to increment the starting value by|
|Add datetime|N/A|After name, Before name|After name|Specifies whether to add the datetime before or after the original name(s)|
|Separator|N/A|Nothing, Space, Dash, Period, Underscore|Space|Specifies what to use to separate the original file name and the number added, including the option to not use a separator|
|Separator|N/A|Nothing, Space, Dash, Period, Underscore|Space|Specifies what to use to separate the original file name and the datetime value added, including the option to not use a separator|
|Use padding|N/A|Boolean value|False|Specifies whether to use padding|
|Datetime format|Yes|Text value|yyyyMMdd|The format of the datetime value to add to the file name, such as MM/dd/yyyy for date, and hh:mm:sstt for time|
|Make each number at least|Yes|Numeric value|3|The minimum length for each number added|
|If file exists|N/A|Do nothing, Overwrite|Do nothing|Specifies what to do if a file with the same name already exists in the folder|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|RenamedFiles|List of Files|The renamed file(s) as a list of files|


##### <a name="renamefiles_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Directory not found|Indicates that the directory wasn't found|
|File not found|Indicates that the file doesn't exist|
|Can't rename file|Indicates a problem renaming the file|

### <a name="readtextfromfile"></a> Read text from file
Read the contents of a text file

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|File path|No|File||The file to read|
|Store content as|N/A|Single text value, List (each is a list item)|Single text value|Specifies how to store the text. Choose 'Single text value' to store the entire text as a single text value. Choose 'List' to store each line of the original text as a text item in a list|
|Encoding|N/A|Default, ANSI, Unicode, Unicode (big-endian), UTF-8|UTF-8|The encoding to read the specified text from the text file with.|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|FileContents|Text value|The contents as a text|
|FileContents|List of Text values|The contents as a list of texts|


##### <a name="readtextfromfile_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Directory not found|Indicates that the directory wasn't found|
|File not found|Indicates that the file doesn't exist|
|Failed to read from file|Indicates a problem reading from the file|

### <a name="writetext"></a> Write text to file
Write or appends text to a file

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|File path|No|File||The file to write the text. This can be a file path, or a variable containing a file or a textual path|
|Text to write|Yes|General value||The text to write in the specified file|
|Append new line|N/A|Boolean value|True|Specifies whether to append a new line at the end of the overall text to write to the file|
|If file exists|N/A|Overwrite existing content, Append content|Overwrite existing content|Specifies whether to overwrite the existing content, or to append to the end of the existing content. If the file doesn't exist, this action automatically creates it|
|Encoding|N/A|Default, ANSI, Unicode, Unicode (big-endian), UTF-8, Unicode (without byte order mask), UTF-8 (without byte order mask)|Unicode|The encoding to use for the specified text to write into the text file|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="writetext_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Failed to write text to file|Indicates a problem writing to the file|
|Invalid directory for file|Indicates that the directory is invalid|

### <a name="readfromcsvfile"></a> Read from CSV file
Read a CSV file into a data table

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|File path|No|File||The CSV file to read. This can be a file path, or a variable containing a file or a textual path|
|Encoding|N/A|UTF-8, Unicode, Unicode (big-endian), UTF-8 (No byte order mark), Unicode (no byte οrder mark), System default, ANSI|UTF-8|The encoding be use for reading the specified CSV file|
|Trim fields|N/A|Boolean value|True|Specifies whether to automatically trim off the leading and trailing whitespaces of the extracted cells|
|First line contains column names|N/A|Boolean value|False|Specifies whether to use the first row of the CSV resource to set the column names of the resulting data table variant. Enable this option to avoid reading the names as data into the table. Subsequent actions may access the data held by the data table using column names (instead of column numbers)|
|Columns separator|N/A|Predefined, Custom, Fixed column widths|Predefined|Specifies whether to use a predefined columns separator, a custom one or fixed column widths|
|Separator|N/A|System default, Comma, Semicolon, Tab|System default|The column-separator to parse the the CSV file|
|Custom separator|No|Text value||The custom column-separator to use for parsing the CSV resource specified|
|Fixed column widths|No|Text value||The fixed column-widths to use for parsing the CSV resource specified. Separate the widths using commas, spaces, tabs or newlines|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|CSVTable|Datatable|The contents of the CSV file as a data table|


##### <a name="readfromcsvfile_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Read from CSV failed|Indicates a problem reading from the CSV file|

### <a name="writetocsvfile"></a> Write to CSV file
Write a data table, data row or list to a CSV file

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Variable to write|No|General value||The data table, data row variable or list variable to write into the target CSV file|
|File path|No|File||The CSV file to export the variable to. This can be a file path, or a variable containing a file or a textual path|
|Encoding|N/A|UTF-8, Unicode, Unicode (big-endian), UTF-8 (No byte order mark), Unicode (no byte οrder mark), System default, ANSI|UTF-8|The encoding to use for writing to the specified CSV file |
|Include column names|N/A|Boolean value|False|Specifies whether the column names of the variant specified should become the very first row of the CSV file. This option takes effect if and only if the target CSV file either doesn't initially exist or exists but is otherwise empty of text|
|If file exists|N/A|Overwrite existing content, Append content|Overwrite existing content|Specifies the desired behavior when the targeted CSV file already exists in the filesystem|
|Separator|N/A|System default, Comma, Semicolon, Tab|System default|The column separator to use in the specified CSV file|
|Custom columns separator|No|Text value||The custom column separator to use in the CSV file|
|Use custom columns separator|N/A|Boolean value|False|Specifies whether to use a custom columns separator or a predefined one|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="writetocsvfile_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Write failed|Indicates a problem writing to the CSV file|

### <a name="getpathpart"></a> Get filepath part
Retrieve one or more parts (directory, filename, extension, etc.) from a text that represents a file path

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|File path|No|File||The file path to use as the source|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|RootPath|File|The root path of the source file|
|Directory|Folder|The directory of the source file|
|FileName|Text value|The name of the source file|
|FileNameNoExtension|Text value|The file name (without the extension) of the source file|
|FileExtension|Text value|The extension (for example, .doc) of the source file|


##### <a name="getpathpart_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|File path doesn't exist|Indicates that the file path doesn't exist|

### <a name="gettemppath"></a> Get temporary file
Create a uniquely named, empty temporary file on disk, and get the file object (which is a representation, and can access the file and all its information)

##### Input Parameters
- This action doesn't require any input

##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|TempFile|File|The temporary file object|


##### <a name="gettemppath_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Failed to create temporary file|Indicates a problem creating a temporary file|


