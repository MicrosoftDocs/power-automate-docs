---
title: Folder actions reference
description: See all the available folder actions.
author: mattp123
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: reference
ms.date: 10/20/2023
ms.author: matp
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

# Folder actions

> [!IMPORTANT]
> To prevent unauthorized access, Windows require administrator rights to access protected folders. To access these resources using the folder actions, run Power Automate with administrator rights. For more information about running Power Automate as an administrator, go to [Run Power Automate with elevated rights](../setup.md#run-power-automate-with-elevated-rights).

Power Automate folder actions enable you to manipulate and organize folders.

The **Get special folder** action retrieves the paths for commonly used directories that vary among users and machines. The following example retrieves the desktop directory and stores it in a variable.

You can now use the **%SpecialFolderPath%** variable any time it's necessary, regardless of the user who runs the flow or the computer on which it runs.

:::image type="content" source="media/folder/get-special-folder-example.png" alt-text="Screenshot of the Get special folder action.":::

Create new folders with the **Create folder** action.

To get a list of a folder's contents, use the **Get subfolders in folder** action. This action retrieves a list of folders located within the specified folder. The following example retrieves all the subfolders of a specified special folder. In the **Advanced** section, you can see that the action sorts the results by creation time in ascending order and name in descending order.

:::image type="content" source="media/folder/get-subfolders-example.png" alt-text="Screenshot of the Get subfolders in folder action.":::

You can also copy, move, rename, and delete or empty folders using the appropriate actions.

## <a name="iffolderexistsaction"></a> If folder exists

Mark the beginning of a conditional block of actions depending on whether a folder exists or not.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|If folder|N/A|Exists, Doesn't exist|Exists|Choose the state of the folder to check|
|Folder path|No|[Folder](../variable-data-types.md#files-and-folders)||Enter or choose the full path of the folder, or a variable containing the folder, to check its state|

### Variables produced

This action doesn't produce any variables.

### <a name="iffolderexistsaction_onerror"></a> Exceptions

This action doesn't include any exceptions.

## <a name="getfiles"></a> Get files in folder

Retrieve the list of files in a folder.

To retrieve all files in a specific folder, use the action **Get files in folder**. Specify the folder path in the **Folder** property and then use the * character in the **File filter** property (included by default). In case you want to also include all files included in the subfolder inside the specified folder, enable the **Include subfolders** toggle. The retrieved filepaths are then stored in the output of the action.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Folder|No|[Folder](../variable-data-types.md#files-and-folders)||Enter or choose the full path of the folder, or a variable containing the folder, to retrieve the list of files from|
|File filter|No|[Text value](../variable-data-types.md#text-value)|*|Choose a filter to limit the files retrieved. This parameter allows wild cards, for example, *.txt or document?.doc. To allow for multiple file filters, separate the choices with a semi-colon, for example, *.txt;*.exe.|
|Include subfolders|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specify whether to look into subfolders as well|
|Fail upon denied access to any subfolder|N/A|[Boolean value](../variable-data-types.md#boolean-value)|True|Specify whether to throw an error when trying to get files of a folder with no access rights or ignore those folders|
|Sort by|N/A|No sort, Full name, Root path, Directory, Name, Name without extension, Extension, Size, Creation time, Last accessed, Last modified, Is hidden, Is system, Is read-only, Is archive, Exists|No sort|Specify whether to sort the results and by which criterion|
|Descending|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specify whether to sort the items in descending or ascending order|
|Then by|N/A|No sort, Full name, Root path, Directory, Name, Name without extension, Extension, Size, Creation time, Last accessed, Last modified, Is hidden, Is system, Is read-only, Is archive, Exists|No sort|Specify whether to sort the results by a second criterion|
|Descending|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specify whether to sort the items in descending or ascending order|
|Then by|N/A|No sort, Full name, Root path, Directory, Name, Name without extension, Extension, Size, Creation time, Last accessed, Last modified, Is hidden, Is system, Is read-only, Is archive, Exists|No sort|Specify whether to sort the results by a third criterion|
|Descending|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specify whether to sort the items in descending or ascending order|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|Files|[List](../variable-data-types.md#list) of [Files](../variable-data-types.md#files-and-folders)|The retrieved files as a list of file objects|

### <a name="getfiles_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Folder doesn't exist|Indicates that the folder wasn't found|
|Can't retrieve list of files|Indicates a problem retrieving the list of files|

## <a name="getsubfolders"></a> Get subfolders in folder

Retrieve the list of subfolders in a folder.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Folder|No|[Folder](../variable-data-types.md#files-and-folders)||Enter or choose the full path of the folder, or a variable containing the folder, to retrieve the list of subfolders from|
|Folder filter|No|[Text value](../variable-data-types.md#text-value)|*|Choose a filter to limit the subfolders retrieved. This parameter allows wild cards, for example, Doc* or Document?. To allow for multiple folder filters, separate the choices with a semi-colon, for example, Doc*;*.|
|Include subfolders|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specify whether to look into the subfolders and retrieve their subfolders (and so on) as well|
|Fail upon denied access to any subfolder|N/A|[Boolean value](../variable-data-types.md#boolean-value)|True|Specify whether to throw an error when trying to get subfolders of a folder with no access rights or ignore those folders|
|Sort by|N/A|No sort, Full name, Root path, Directory, Name, Name without extension, Extension, Size, Creation time, Last accessed, Last modified, Is hidden, Is system, Is read-only, Is archive, Exists|No sort|Specify whether to sort the results and by which criterion|
|Descending|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specify whether to sort the items in descending or ascending order|
|Then by|N/A|No sort, Full name, Root path, Directory, Name, Name without extension, Extension, Size, Creation time, Last accessed, Last modified, Is hidden, Is system, Is read-only, Is archive, Exists|No sort|Specify whether to sort the results by a second criterion|
|Descending|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specify whether to sort the items in descending or ascending order|
|Then by|N/A|No sort, Full name, Root path, Directory, Name, Name without extension, Extension, Size, Creation time, Last accessed, Last modified, Is hidden, Is system, Is read-only, Is archive, Exists|No sort|Specify whether to sort the results by a third criterion|
|Descending|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specify whether to sort the items in descending or ascending order|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|Folders|[List](../variable-data-types.md#list) of [Folders](../variable-data-types.md#files-and-folders)|The retrieved subfolders as a list of folder objects|

### <a name="getsubfolders_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Folder doesn't exist|Indicates that the folder wasn't found|
|Can't retrieve list of subfolders|Indicates a problem retrieving the list of subfolders|

## <a name="create"></a> Create folder

Create a new folder.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Create new folder into|No|[Folder](../variable-data-types.md#files-and-folders)||Enter or choose the full path of the folder, or a variable containing the folder, to create a new folder in|
|New folder name|No|[Text value](../variable-data-types.md#text-value)||Enter the text, or a text variable, to be the name of the new folder|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|NewFolder|[Folder](../variable-data-types.md#files-and-folders)|The created folder object (which is a representation and can access the folder and all its information)|

### <a name="create_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Folder doesn't exist|Indicates that the folder wasn't found|
|Can't create folder|Indicates a problem creating the folder|
|New folder path and name are empty|Indicates that both the new folder path and folder name don't have value|

## <a name="delete"></a> Delete folder

Delete an existing folder and its contents (files and subfolders).

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Folder to delete|No|[Folder](../variable-data-types.md#files-and-folders)||Enter or choose the full path of the folder, or a variable containing the folder, to delete. Remember that all contents of that folder and its subfolders are deleted too.|

### Variables produced

This action doesn't produce any variables.

### <a name="delete_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Folder doesn't exist|Indicates that the folder wasn't found|
|Can't delete folder|Indicates a problem deleting the folder|

## <a name="empty"></a> Empty folder

Delete all the contents of a folder (files and subfolders) without deleting the folder itself.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Folder to empty|No|[Folder](../variable-data-types.md#files-and-folders)||Enter or choose the full path of the folder, or a variable containing the folder, to delete its contents|

### Variables produced

This action doesn't produce any variables.

### <a name="empty_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Folder doesn't exist|Indicates that the folder wasn't found|
|Can't delete folder's contents|Indicates a problem clearing the folder's contents|

## <a name="copy"></a> Copy folder

Copy a folder into a destination folder.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Folder to copy|No|[Folder](../variable-data-types.md#files-and-folders)||Enter or choose the full path of the folder, or a variable containing the folder, to copy. If the folder path ends with a \ only the contents of the folder (files + subfolders) are copied. Otherwise, the folder itself (along with its contents) is copied as a subfolder into the destination folder.|
|Destination folder|No|[Folder](../variable-data-types.md#files-and-folders)||Enter or choose the full path of the folder, or a variable containing the folder, to be the destination folder|
|If folder exists|N/A|Do nothing, Overwrite|Do nothing|Specify whether to overwrite files or not copy them at all, if the destination folder already exists. If the folder exists, but the files have different names, the old files still remain in the folder.|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|CopiedFolder|[Folder](../variable-data-types.md#files-and-folders)|The copied folder object (which is a representation and can access the folder and all its information)|

### <a name="copy_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Folder doesn't exist|Indicates that the folder wasn't found|
|Destination folder doesn't exist|Indicates that the destination folder wasn't found|
|Can't copy folder|Indicates a problem copying the folder|

## <a name="move"></a> Move folder

Move an existing folder into a destination folder.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Folder to move|No|[Folder](../variable-data-types.md#files-and-folders)||Enter or choose the full path of the folder, or a variable containing the folder, to move|
|Destination folder|No|[Folder](../variable-data-types.md#files-and-folders)||Enter or choose the full path of the folder, or a variable containing the folder, to be the destination folder|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|MovedFolder|[Folder](../variable-data-types.md#files-and-folders)|The moved folder object (which is a representation and can access the folder and all its information)|

### <a name="move_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Folder doesn't exist|Indicates that the folder wasn't found|
|Destination folder doesn't exist|Indicates that the destination folder wasn't found|
|Can't move folder|Indicates a problem moving the folder|

## <a name="rename"></a> Rename folder

Change the name of a folder.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Folder to rename|No|[Folder](../variable-data-types.md#files-and-folders)||Enter or choose the full path of the folder, or a variable containing the folder, to change its name|
|New folder name|No|[Text value](../variable-data-types.md#text-value)||Enter the text, or a text variable, to be the new folder name|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|RenamedFolder|[Folder](../variable-data-types.md#files-and-folders)|The renamed folder object (which is a representation and can access the folder and all its information)|

### <a name="rename_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Folder doesn't exist|Indicates that the folder wasn't found|
|Can't rename folder|Indicates a problem renaming the folder|

## <a name="getspecialfolder"></a> Get special folder

Retrieve the path of a Windows' special folder (such as Desktop, My Pictures, Internet Cache etc.).

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Special folder name|N/A|Programs, Personal, Favorites, Startup, Recent, Send To, Start Menu, Music, Desktop, Templates, Application Data, Local Application Data, Internet Cache, Cookies, History, Common Application Data, System, Program Files, Pictures, Common Program Files|Desktop|Choose the name of the special folder (like My Documents or Desktop). This option is independent of path, to find the special folder on any computer regardless of path specifics.|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|SpecialFolderPath|[Folder](../variable-data-types.md#files-and-folders)|The special folder object (which is a representation and can access the folder and all its information)|

### <a name="getspecialfolder_onerror"></a> Exceptions

This action doesn't include any exceptions.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
