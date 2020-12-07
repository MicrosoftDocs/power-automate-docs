---
title: Compression | Microsoft Docs
description: Compression Actions Reference
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

# Compression

[!INCLUDE [cc-beta-prerelease-disclaimer.md](../../../includes/cc-beta-prerelease-disclaimer.md)]

Zip or unzip files from archives

|<!-- --> |
|-----|
|[ZIP files](#zipfiles)|
|[Unzip files](#unzipfiles)|

### <a name="zipfiles"></a> ZIP files
Compress one or more files or folders into a ZIP archive

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Archive path|No|File||The full path of ZIP file to create. If the file already exists, this action adds the new zipped files and/or to the existing ZIP file. If the ZIP file already contains a file or folder with the same name, it overwrites it. |
|File(s) to zip|No|List of FileSystemObject||The full path of the file(s) or folder(s) to include in the ZIP file|
|Compression level|N/A|None, Best speed, Best balance of speed and compression, Best compression|Best balance of speed and compression|The level of compression to use. The higher the compression the smaller the file, though it takes longer to create or access|
|Password|Yes|Text value||The password to use for protecting the ZIP. Leave this attribute blank to create a non password-protected ZIP|
|Archive comment|Yes|Text value||The comment to include in the ZIP file as a file property|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|ZipFile|File|The ZIP file created by this action|


##### <a name="zipfiles_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|File or folder doesn't exist|Indicates that the specified file or folder doesn't exist|
|File or folder name is invalid|Indicates that the file or folder name is invalid|
|Archive already exists but it isn't a valid ZIP archive|Indicates that the archive already exists but it isn't a valid ZIP archive|
|Failed to zip files|Indicates a problem zipping the files|

### <a name="unzipfiles"></a> Unzip files
Uncompress one or more files or folders contained in a ZIP archive

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Archive path|No|File||The full path of a ZIP file to extract|
|Destination folder|No|Folder||The full path of the folder to extract the archive to. This overwrites files in the folder with the same name as a file in the archive|
|Password|Yes|Text value||The password, if any, that is used for this archive. If the ZIP file isn't password-protected, leave this blank|
|Include mask|Yes|Text value||The filter to limit the files extracted to those entered here. This allows wild cards, for example '*.txt' or 'document?.doc' (without the quotes). To allow multiple file filters, separate the choices with a semi-colon, for instance, '*.txt;*.exe'|
|Exclude mask|Yes|Text value||The filter to limit the files extracted by excluding those entered here. This allows wild cards, for example, '*.txt' or 'document?.doc' (without the quotes). To allow multiple file filters, separate the choices with a semi-colon, for instance, '*.txt;*.exe'|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="unzipfiles_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Can't create destination folder|Indicates that the destination folder couldn't be created|
|Archive not found|Indicates that the archive doesn't exist|
|Archive isn't a valid ZIP file|Indicates that the archive isn't a valid ZIP file|
|Failed to unzip files|Indicates a problem unzipping the files|


