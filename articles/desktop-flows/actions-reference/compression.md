---
title: Compression actions reference
description: See all the available compression actions.
author: HeatherOrt
ms.subservice: desktop-flow
ms.topic: reference
ms.date: 11/23/2022
ms.author: samathur
ms.reviewer: matp
contributors:
- Yiannismavridis
- NikosMoutzourakis
- PetrosFeleskouras
search.audienceType: 
  - flowmaker
  - enduser
---

# Compression actions

To compress (or zip) a file, use the **ZIP files** action and specify a path to archive. If the archive already exists, the action will add the selected files.

The following example uses a variable to specify the path to archive. **Best compression** ensures maximum file size reduction, and a password adds a layer of security to the archive.

:::image type="content" source="media/compression/zip-example.png" alt-text="Screenshot of the ZIP files action.":::

The **Unzip files** action works similarly, requiring a path to archive and a destination folder. The following example uses the **Include mask** option to only unzip files with the extensions **.txt** and **.xlsx**.

:::image type="content" source="media/compression/unzip-example.png" alt-text="Screenshot of the Unzip files action.":::

## <a name="zipfiles"></a> ZIP files

Compress one or more files or folders into a ZIP archive.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Archive path|No|[File](../variable-data-types.md#files-and-folders)||The full path of ZIP file to create. If the file already exists, this action adds the new zipped files and/or to the existing ZIP file. If the ZIP file already contains a file or folder with the same name, it overwrites it. |
|File(s) to zip|No|[List](../variable-data-types.md#list) of [FileSystemObject](../variable-data-types.md#files-and-folders)||The full path of the file(s) or folder(s) to include in the ZIP file|
|Compression level|N/A|None, Best speed, Best balance of speed and compression, Best compression|Best balance of speed and compression|The level of compression to use. The higher the compression the smaller the file, though it takes longer to create or access|
|Password|Yes|Direct encrypted input or [Text value](../variable-data-types.md#text-value)||The password to use for protecting the ZIP. Leave this attribute blank to create a non password-protected ZIP|
|Archive comment|Yes|[Text value](../variable-data-types.md#text-value)||The comment to include in the ZIP file as a file property|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|ZipFile|[File](../variable-data-types.md#files-and-folders)|The ZIP file created by this action|

### <a name="zipfiles_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|File or folder doesn't exist|Indicates that the specified file or folder doesn't exist|
|File or folder name is invalid|Indicates that the file or folder name is invalid|
|Archive already exists but it isn't a valid ZIP archive|Indicates that the archive already exists but it isn't a valid ZIP archive|
|Failed to zip files|Indicates a problem zipping the files|

## <a name="unzipfiles"></a> Unzip files

Uncompress one or more files or folders contained in a ZIP archive.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Archive path|No|[File](../variable-data-types.md#files-and-folders)||The full path of a ZIP file to extract|
|Destination folder|No|[Folder](../variable-data-types.md#files-and-folders)||The full path of the folder to extract the archive to. This action overwrites files in the folder with the same name as a file in the archive|
|Password|Yes|Direct encrypted input or [Text value](../variable-data-types.md#text-value)||The password, if any, that is used for this archive. If the ZIP file isn't password-protected, leave this blank|
|Include mask|Yes|[Text value](../variable-data-types.md#text-value)||The filter to limit the files extracted to the files entered here. This parameter allows wild cards, for example '*.txt' or 'document?.doc' (without the quotes). To allow multiple file filters, separate the choices with a semi-colon, for instance, '*.txt;*.exe'|
|Exclude mask|Yes|[Text value](../variable-data-types.md#text-value)||The filter to limit the files extracted by excluding the file entered here. This parameter allows wild cards, for example, '*.txt' or 'document?.doc' (without the quotes). To allow multiple file filters, separate the choices with a semi-colon, for instance, '*.txt;*.exe'|

### Variables produced

This action doesn't produce any variables.

### <a name="unzipfiles_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Can't create destination folder|Indicates that the destination folder couldn't be created|
|Archive not found|Indicates that the archive doesn't exist|
|Archive isn't a valid ZIP file|Indicates that the archive isn't a valid ZIP file|
|Failed to unzip files|Indicates a problem unzipping the files|

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
