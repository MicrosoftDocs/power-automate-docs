---
title: FTP | Microsoft Docs
description: FTP Actions Reference
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

# FTP

[!INCLUDE [cc-beta-prerelease-disclaimer.md](../../../includes/cc-beta-prerelease-disclaimer.md)]

Manage files and folders on an FTP server

|<!-- --> |
|-----|
|[Open FTP connection](#openconnection)|
|[List FTP directory](#listdirectory)|
|[Open secure FTP connection](#opensecureconnection)|
|[Close connection](#closeconnection)|
|[Change working directory](#changeworkingdirectory)|
|[Download file(s) from FTP](#downloadfiles)|
|[Download folder(s) from FTP](#downloadfolders)|
|[Upload File(s) to FTP](#uploadfiles)|
|[Upload folder(s) to FTP](#uploadfolders)|
|[Delete FTP file](#deletefiles)|
|[Rename FTP File](#renamefile)|
|[Create FTP directory](#createdirectory)|
|[Delete FTP directory](#deletedirectory)|
|[Invoke FTP command](#invokecommand)|
|[Synchronize directories](#synchronizedirectoryaction)|

### <a name="openconnection"></a> Open FTP connection
This action establishes a specific connection to a remote FTP server, and stores that connection as a variable for later use.

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Host|No|Text value||Enter the FTP server address here.|
|Port|Yes|Numeric value|21|Enter the FTP server port here.|
|Active mode|N/A|Boolean value|False|Specify the mode of the connection|
|Username|No|Text value||Specify the username of the FTP account to use|
|Password|Yes|Text value||Specify the password of the FTP account to use|
|Timeout|Yes|Numeric value|10|Set the time in seconds that you want to wait for the connection to be established before the action fails|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|FTPConnection|FTP connection|The FTP connection|


##### <a name="openconnection_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Login failure error|Indicated that the login failed|
|Connection error|Indicates that there is a problem with the connection|

### <a name="listdirectory"></a> List FTP directory
This action returns the subdirectories and files contained in the current directory of an FTP connection

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Connection|No|FTP connection||The FTP connection|
|Path|Yes|Text value||The path that you want to list.|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|Directories|List of FTP directories|The listed directories|
|Files|List of FTP Files|The listed files|


##### <a name="listdirectory_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Listing error|Indicates that the listing of the folder couldn't be performed|
|Not connected error|Indicates that there is no open connection with the FTP server|
|Directory doesn't exist error|Indicates that the directory couldn't be found|

### <a name="opensecureconnection"></a> Open secure FTP connection
This action establishes a specific secure connection to a remote FTP server, and stores that connection as a variable for later use

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Host|No|Text value||Enter the FTP server address here.|
|Port|Yes|Numeric value|22|Enter the FTP server port here.|
|Active mode|N/A|Boolean value|True|Specify the mode of the connection|
|Secure FTP Protocol|N/A|SFTP, FTPS explicit, FTPS implicit|SFTP|Choose the FTP protocol you wish to use to encrypt your connection|
|Authentication method|N/A|Username and password, Private key, Private key and passphrase|Username and password|Choose the method you wish to use to authenticate yourself on the FTP server|
|User name|No|Text value||Specify the username of the FTP account to use|
|Password|Yes|Text value||Specify the password of the FTP account you wish to use|
|Path to private key|No|Text value||Enter the file path to the private-key to be used for authentication|
|Private key pass phrase|No|Text value||Enter a variable containing the private-key pass phrase here|
|Timeout|Yes|Numeric value|10|Set the time in seconds that you want to wait for the connection to be established before the action fails|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|SftpConnection|FTP connection|SFTP connection|


##### <a name="opensecureconnection_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Login failure error|Indicated that the login failed|
|Connection error|Indicates that there is a problem with the connection|

### <a name="closeconnection"></a> Close connection
This action closes an open FTP connection

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Connection|No|FTP connection||The FTP connection|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="closeconnection_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Not connected error|Indicates that there is no open connection with the FTP server|

### <a name="changeworkingdirectory"></a> Change working directory
This action sets the current working directory for an FTP connection

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Connection|No|FTP connection||The FTP connection|
|Set working directory to|No|Text value||Set the path to be set as the working directory|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="changeworkingdirectory_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Not connected error|Indicates that there is no open connection with the FTP server|
|Directory doesn't exist error|Indicates that the directory couldn't be found|
|Can't change working directory error|Indicates that it isn't possible to change the working directory|

### <a name="downloadfiles"></a> Download file(s) from FTP
Downloads one or more files from an FTP server

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|FTP connection|No|FTP connection||The FTP connection to work with. This variable must have been previously specified in an Open FTP connection action|
|Download into folder|No|Folder||The folder to be the destination of the file(s) that will be downloaded|
|File(s) to download|No|List of FTP Files||The file(s) to download|
|Transfer type|N/A|Auto, Binary, ASCII|Auto|Enter ASCII or binary to specify the method for downloading a single file. If the file type is uncertain, or more than one is downloaded, choose Auto to follow the transfer rules specified in options|
|If file exists|N/A|Overwrite, Do not download, Download with unique name|Overwrite|Specify what to do if the file already exists. Overwrite writes over the original file so you can't access it any more, and download with unique name adds an underscore and a sequential number to the end|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="downloadfiles_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Not connected error|Indicates that there is no open connection with the FTP server|
|Remote file doesn't exist error|Indicates that the file doesn't exist on the FTP server|
|Directory doesn't exist error|Indicates that the directory couldn't be found|
|FTP connection aborted error|Indicates that the FTP connection was aborted|
|Can't download file error|Indicates that it wasn't possible to download the file|

### <a name="downloadfolders"></a> Download folder(s) from FTP
Downloads one or more folders from an FTP server

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|FTP connection|No|FTP connection||The FTP connection to work with. This variable must have been previously specified in an Open FTP connection action|
|Folder(s) to download|No|List of FTP directories||The name of the folder path(s), or FTP folder(s) to download|
|Download into local folder|No|Folder||The full path of the destination of the FTP folder(s) you are downloading|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="downloadfolders_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Not connected error|Indicates that there is no open connection with the FTP server|
|Remote directory doesn't exist error|Indicates that the directory doesn't exist on the FTP server|
|Directory doesn't exist error|Indicates that the directory couldn't be found|
|FTP connection aborted error|Indicates that the FTP connection was aborted|
|Can't download directory error|Indicates that it wasn't possible to download the directory|

### <a name="uploadfiles"></a> Upload File(s) to FTP
Uploads one or more files to an FTP server

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|FTP connection|No|FTP connection||The FTP connection to work with. This variable must have been previously specified in an Open FTP connection action|
|File(s) to upload|No|List of Files||The file(s) to upload|
|Remote location|Yes|Text value||The location where the files should be uploaded|
|Transfer type|N/A|Auto, Binary, ASCII|Auto|Enter ASCII or binary to specify the method for downloading a single file. If you're not sure what type the file will be, or if you are downloading more than one, choose Auto to follow the transfer rules specified in Options|
|If file exists|N/A|Overwrite, Do not download, Download with unique name|Overwrite|Specify what to do if the file already exists. Overwrite writes over the original file so you can't access it any more, and Download with Unique Name adds an underscore and a sequential number to the end|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="uploadfiles_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Not connected error|Indicates that there is no open connection with the FTP server|
|File not found error|Indicates that the file wasn't found|
|FTP connection aborted error|Indicates that the FTP connection was aborted|
|Upload file error|Indicates that the file couldn't be uploaded|

### <a name="uploadfolders"></a> Upload folder(s) to FTP
Uploads one or more folders to an FTP server

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|FTP connection|No|FTP connection||The FTP connection to work with. This variable must have been previously specified in an Open FTP connection action|
|Folder(s) to upload|No|List of Folders||The folder(s) to upload. The folders being uploaded should not already exist within the active directory of the FTP server|
|Remote location|No|Text value||The location where the folders should be uploaded|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="uploadfolders_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Not connected error|Indicates that there is no open connection with the FTP server|
|Remote directory doesn't exist error|Indicates that the directory doesn't exist on the FTP server|
|FTP connection aborted error|Indicates that the FTP connection was aborted|
|Upload directory error|Indicates that the directory couldn't be uploaded|

### <a name="deletefiles"></a> Delete FTP file
Deletes one or more files from an FTP server

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|FTP connection|No|FTP connection||The FTP connection to work with. This variable must have been previously specified in an Open FTP connection action|
|Files to delete|No|List of FTP Files||The files to delete|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="deletefiles_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Not connected error|Indicates that there is no open connection with the FTP server|
|File not found error|Indicates that the file wasn't found|
|Can't delete file error|Indicates that the deletion of the file wasn't possible|

### <a name="renamefile"></a> Rename FTP File
Renames a file that resides on an FTP server

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|FTP connection|No|FTP connection||The FTP connection to work with. This variable must have been previously specified in an Open FTP connection action|
|File to rename|No|FTP File||The file to rename|
|New file name|No|Text value||The new name for the file. If you enter a name with a path, the file will also be moved to that location. If the location doesn't exist, it will throw an exception|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="renamefile_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Not connected error|Indicates that there is no open connection with the FTP server|
|Can't rename file error|Indicates that it wasn't possible to rename the file|
|File not found error|Indicates that the file wasn't found|

### <a name="createdirectory"></a> Create FTP directory
Creates a directory on an FTP server

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|FTP connection|No|FTP connection||The FTP connection to work with. This variable must have been previously specified in an Open FTP connection action|
|New directory|No|FTP directory||The new directory. If a path is specified, all of the new folders leading to the new directory will be created|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="createdirectory_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Access denied error|Indicates that this account doesn't have access for an operation|
|File exists error|Indicates that the file already exists|
|Create directory error|Indicates that it wasn't possible creating the directory|
|Directory doesn't exist error|Indicates that the directory couldn't be found|
|Not connected error|Indicates that there is no open connection with the FTP server|

### <a name="deletedirectory"></a> Delete FTP directory
Deletes a directory from an FTP server

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|FTP connection|No|FTP connection||The FTP connection to work with. This variable must have been previously specified in an Open FTP connection action|
|Directory to delete|No|FTP directory||The folder to be deleted. Everything in the folder will be deleted as well|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="deletedirectory_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Delete directory error|Indicates that it wasn't possible to delete the directory|
|Remote directory doesn't exist error|Indicates that the directory doesn't exist on the FTP server|
|Working directory change error|Indicates that the working directory couldn't be changed|
|Not connected error|Indicates that there is no open connection with the FTP server|

### <a name="invokecommand"></a> Invoke FTP command
Invokes the given literal FTP command on the server

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|FTP connection|No|FTP connection||The FTP connection to work with. This variable must have been previously specified in an open FTP connection action|
|FTP command|No|Text value||The command to run along with any arguments. For example, you could run FEAT, or CHMOD here|
|Valid reply code(s)|Yes|Text value||The code(s) that could be returned by the command, separated by semi-colon. If the FTP command returns a code that wasn't entered here, this action will throw an exception. Only applies over simple FTP or FTPS connections|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|ReplyCode|Text value|The actual code that was returned. Only applies over simple FTP or FTPS connections|
|ReplyText|Text value|The text returned by the FTP server|


##### <a name="invokecommand_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Invoke command error|Indicates that an error occurred while invoking an FTP command|
|Not connected error|Indicates that there is no open connection with the FTP server|

### <a name="synchronizedirectoryaction"></a> Synchronize directories
Synchronize the files and subdirectories of a given Folder with a given remote FTP directory

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|FTP connection|No|FTP connection||The FTP connection to work with. This variable must have been previously specified in an Open FTP connection action|
|Synchronization direction|N/A|Remote -> local (Download), Local -> remote (Upload)|Remote -> local (Download)|Direction of the Synchronization method. Whether the local folder will be synchronized to the remote directory (DOWNLOAD) or the remote directory will be synchronized to the local folder (UPLOAD)|
|Files to sync|N/A|All files, Only files matching the file filter, Only files not matching the file filter|All files|Choose whether you want to synchronize all files, or you want to use a file filter to include or exclude a specific set of files|
|File filter|Yes|Text value|*|File-name pattern that controls which files will be included or excluded. This option allows wildcards such as "*.txt" , "document?.doc". The option also allows for multiple filters by using coma as a separator, "*.txt,*.pdf,document?"|
|Local folder|No|Folder||Name of the local folder to be synchronized|
|FTP directory|Yes|FTP directory|/|Name of the FTP directory to be synchronized|
|Delete if source is absent|N/A|Boolean value|False|This option will delete a file or folder which exists in the target directory and not the source.|
|Include subdirectories|N/A|Boolean value|True|This option will include subdirectories in the synchronization process.|
|Time difference in hours|Yes|Numeric value|0|Time difference in hours of the remote server in case it operates on a different Time Zone.|
|Time difference in minutes|Yes|Numeric value|0|Time difference in Minutes of the remote server in case it operates on a different Time Zone.|
|Time difference ahead|N/A|Boolean value|True|Specify whether the server's time zone is ahead or not.|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|FtpFilesAdded|List of FTP Files|List of FTP files that initially existed in the source and after the synchronization process were added to the target.|
|FtpFilesModified|List of FTP Files|List of FTP files that initially existed in both the source and the target and after the synchronization process were added to the target.|
|FtpFilesDeleted|List of FTP Files|List of FTP files that initially existed in the target directory and after the synchronization process were deleted.|
|FilesAdded|List of Files|List of files that initially existed in the source and after the synchronization process were added to the target.|
|FilesModified|List of Files|List of files that initially existed in both the source and the target and after the synchronization process were added to the target.|
|FilesDeleted|List of Files|List of files that initially existed in the target directory and after the synchronization process were deleted.|


##### <a name="synchronizedirectoryaction_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Listing error|Indicates that the listing of the folder couldn't be performed|
|Not connected error|Indicates that there is no open connection with the FTP server|
|File not found error|Indicates that the file wasn't found|
|FTP connection aborted error|Indicates that the FTP connection was aborted|
|Upload file error|Indicates that the file couldn't be uploaded|
|Remote file doesn't exist error|Indicates that the file doesn't exist on the FTP server|
|Can't download file error|Indicates that it wasn't possible to download the file|
|Delete directory error|Indicates that it wasn't possible to delete the directory|
|Synchronization failed error|Indicates that the synchronization process failed due to an unexpected error.|


