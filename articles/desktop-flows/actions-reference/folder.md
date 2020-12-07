---
title: Folder | Microsoft Docs
description: Folder Actions Reference
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

# Folder

[!INCLUDE [cc-beta-prerelease-disclaimer.md](../../../includes/cc-beta-prerelease-disclaimer.md)]

Manage and manipulate folders

|<!-- --> |
|-----|
|[Get files in folder](#getfiles)|
|[Get subfolders in folder](#getsubfolders)|
|[Create folder](#create)|
|[Delete folder](#delete)|
|[Empty folder](#empty)|
|[Copy folder](#copy)|
|[Move folder](#move)|
|[Rename folder](#rename)|
|[Get special folder](#getspecialfolder)|

### <a name="getfiles"></a> Get files in folder
Retrieve the list of files in a folder

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Folder|No|Folder||Enter or choose the full path of the folder, or a variable containing the folder, to retrieve the list of files from|
|File filter|Yes|Text value|*|Choose a filter to limit the files retrieved. This allows wild cards, for example, *.txt or document?.doc. To allow for multiple file filters, separate the choices with a semi-colon, for example, *.txt;*.exe.|
|Include subfolders|N/A|Boolean value|False|Specify whether to look into subfolders as well|
|Fail upon denied access to any subfolder|N/A|Boolean value|True|Specify whether to throw an error when trying to get files of a folder with no access rights or ignore those folders|
|Sort by|N/A|No sort, Full name, Root path, Directory, Name, Name without extension, Extension, Size, Creation time, Last accessed, Last modified, Is hidden, Is system, Is read-only, Is archive, Exists|No sort|Specify whether to sort the results and by which criterion|
|Descending|N/A|Boolean value|False|Specify whether to sort the items in descending or ascending order|
|Then by|N/A|No sort, Full name, Root path, Directory, Name, Name without extension, Extension, Size, Creation time, Last accessed, Last modified, Is hidden, Is system, Is read-only, Is archive, Exists|No sort|Specify whether to sort the results by a second criterion|
|Descending|N/A|Boolean value|False|Specify whether to sort the items in descending or ascending order|
|Then by|N/A|No sort, Full name, Root path, Directory, Name, Name without extension, Extension, Size, Creation time, Last accessed, Last modified, Is hidden, Is system, Is read-only, Is archive, Exists|No sort|Specify whether to sort the results by a third criterion|
|Descending|N/A|Boolean value|False|Specify whether to sort the items in descending or ascending order|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|Files|List of Files|The retrieved files as a list of file objects|


##### <a name="getfiles_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Folder doesn't exist|Indicates that the folder was not found|
|Can't retrieve list of files|Indicates a problem retrieving the list of files|

### <a name="getsubfolders"></a> Get subfolders in folder
Retrieve the list of subfolders in a folder

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Folder|No|Folder||Enter or choose the full path of the folder, or a variable containing the folder, to retrieve the list of subfolders from|
|Folder filter|Yes|Text value|*|Choose a filter to limit the subfolders retrieved. This allows wild cards, for example, Doc* or Document?. To allow for multiple folder filters, separate the choices with a semi-colon, for example, Doc*;*.|
|Include subfolders|N/A|Boolean value|False|Specify whether to look into the subfolders and retrieve their subfolders (and so on) as well|
|Fail upon denied access to any subfolder|N/A|Boolean value|True|Specify whether to throw an error when trying to get subfolders of a folder with no access rights or ignore those folders|
|Sort by|N/A|No sort, Full name, Root path, Directory, Name, Name without extension, Extension, Size, Creation time, Last accessed, Last modified, Is hidden, Is system, Is read-only, Is archive, Exists|No sort|Specify whether to sort the results and by which criterion|
|Descending|N/A|Boolean value|False|Specify whether to sort the items in descending or ascending order|
|Then by|N/A|No sort, Full name, Root path, Directory, Name, Name without extension, Extension, Size, Creation time, Last accessed, Last modified, Is hidden, Is system, Is read-only, Is archive, Exists|No sort|Specify whether to sort the results by a second criterion|
|Descending|N/A|Boolean value|False|Specify whether to sort the items in descending or ascending order|
|Then by|N/A|No sort, Full name, Root path, Directory, Name, Name without extension, Extension, Size, Creation time, Last accessed, Last modified, Is hidden, Is system, Is read-only, Is archive, Exists|No sort|Specify whether to sort the results by a third criterion|
|Descending|N/A|Boolean value|False|Specify whether to sort the items in descending or ascending order|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|Folders|List of Folders|The retrieved subfolders as a list of folder objects|


##### <a name="getsubfolders_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Folder doesn't exist|Indicates that the folder was not found|
|Can't retrieve list of subfolders|Indicates a problem retrieving the list of subfolders|

### <a name="create"></a> Create folder
Create a new folder

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Create new folder into|No|Folder||Enter or choose the full path of the folder, or a variable containing the folder, to create a new folder in|
|New folder name|No|Text value||Enter the text, or a text variable, to be the name of the new folder|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|NewFolder|Folder|The created folder object (which is a representation and can access the folder and all its information)|


##### <a name="create_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Folder doesn't exist|Indicates that the folder was not found|
|Can't create folder|Indicates a problem creating the folder|
|New folder path and name are empty|Indicates that both the new folder path and folder name do not have value|

### <a name="delete"></a> Delete folder
Delete an existing folder and its contents (files and subfolders)

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Folder to delete|No|Folder||Enter or choose the full path of the folder, or a variable containing the folder, to delete. Remember that all contents of that folder and its subfolders are deleted too.|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="delete_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Folder doesn't exist|Indicates that the folder was not found|
|Can't delete folder|Indicates a problem deleting the folder|

### <a name="empty"></a> Empty folder
Delete all the contents of a folder (files and subfolders) without deleting the folder itself

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Folder to empty|No|Folder||Enter or choose the full path of the folder, or a variable containing the folder, to delete its contents|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="empty_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Folder doesn't exist|Indicates that the folder was not found|
|Can't delete folder's contents|Indicates a problem clearing the folder's contents|

### <a name="copy"></a> Copy folder
Copy a folder into a destination folder

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Folder to copy|No|Folder||Enter or choose the full path of the folder, or a variable containing the folder, to copy. If the folder path ends with a \ only the contents of the folder (files + subfolders) are copied. Otherwise, the folder itself (along with its contents) is copied as a subfolder into the destination folder.|
|Destination folder|No|Folder||Enter or choose the full path of the folder, or a variable containing the folder, to be the destination folder|
|If folder exists|N/A|Do nothing, Overwrite|Do nothing|Specify whether to overwrite files or not copy them at all, if the destination folder already exists. If the folder exists, but the files have different names, the old files still remain in the folder.|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|CopiedFolder|Folder|The copied folder object (which is a representation and can access the folder and all its information)|


##### <a name="copy_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Folder doesn't exist|Indicates that the folder was not found|
|Destination folder doesn't exist|Indicates that the destination folder was not found|
|Can't copy folder|Indicates a problem copying the folder|

### <a name="move"></a> Move folder
Move an existing folder into a destination folder

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Folder to move|No|Folder||Enter or choose the full path of the folder, or a variable containing the folder, to move|
|Destination folder|No|Folder||Enter or choose the full path of the folder, or a variable containing the folder, to be the destination folder|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|MovedFolder|Folder|The moved folder object (which is a representation and can access the folder and all its information)|


##### <a name="move_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Folder doesn't exist|Indicates that the folder was not found|
|Destination folder doesn't exist|Indicates that the destination folder was not found|
|Can't move folder|Indicates a problem moving the folder|

### <a name="rename"></a> Rename folder
Change the name of a folder

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Folder to rename|No|Folder||Enter or choose the full path of the folder, or a variable containing the folder, to change its name|
|New folder name|No|Text value||Enter the text, or a text variable, to be the new folder name|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|RenamedFolder|Folder|The renamed folder object (which is a representation and can access the folder and all its information)|


##### <a name="rename_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Folder doesn't exist|Indicates that the folder was not found|
|Can't rename folder|Indicates a problem renaming the folder|

### <a name="getspecialfolder"></a> Get special folder
Retrieve the path of a Windows' special folder (such as Desktop, My Pictures, Internet Cache, etc.)

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Special folder name|N/A|Programs, Personal, Favorites, Startup, Recent, Send To, Start Menu, Music, Desktop, Templates, Application Data, Local Application Data, Internet Cache, Cookies, History, Common Application Data, System, Program Files, Pictures, Common Program Files|Desktop|Choose the name of the special folder (like My Documents or Desktop). This will be independent of path, to find the special folder on any computer regardless of path specifics.|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|SpecialFolderPath|Folder|The special folder object (which is a representation and can access the folder and all its information)|


##### <a name="getspecialfolder_onerror"></a> Exceptions
- This action doesn't include any exceptions

