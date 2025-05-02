---
title: FTP actions reference
description: See all the available FTP actions.
author: mattp123

ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: reference
ms.date: 05/02/2025
ms.author: matp
ms.reviewer: matp
contributors:
- Yiannismavridis
- NikosMoutzourakis
- PetrosFeleskouras
search.audienceType: 
  - flowmaker
  - enduser
---

# FTP

Use the FTP action group to upload and download files and manipulate directories on FTP servers.

To establish an FTP connection, use the **Open FTP connection** action. The following example has a specified host, port, and credentials. Additionally, the set timeout makes the action fail if the connection isn't established on time.

:::image type="content" source="media/ftp/open-ftp-connection-example.png" alt-text="Screenshot of the Open FTP connection action.":::

Download files using the **Download file(s) from FTP** action. The following example shows the connection variable in use and the selected destination folder. The remote file has also been specified and set to overwrite existing files in the same location.

:::image type="content" source="media/ftp/download-files-ftp-example.png" alt-text="Screenshot of the Download files from FTP action.":::

Upload files using the **Upload file(s) to FTP** action and specifying the file and the remote location.

> [!IMPORTANT]
> Starting from version 2.56, Power Automate for desktop will no longer support legacy cipher algorithms that have been deprecated in Secure FTP (SFTP) actions. This update is intended to enhance security by removing outdated cryptographic methods.
> 
> More specifically, the below algorithms will no longer be supported: 
> * blowfish-cbc
> * twofish-cbc
> * twofish192-cbc
> * twofish128-cbc
> * twofish256-cbc
> * arcfour
> * arcfour128
> * arcfour256
> * cast128-cbc
> * hmac-sha2-512-96
> * hmac-sha2-256-96
> * hmac-sha1-96
> * hmac-md5
> * hmac-md5-96
> * hmac-sha1-96-etm
> * hmac-md5-etm
> * hmac-md5-96-etm 
>
> Users using SFTP servers that rely exclusively on deprecated cipher algorithms may experience failed flows when attempting to perform SFTP actions using version 2.56 Power Automate for desktop, as these servers will no longer be compatible with the updated library.
> 
> To ensure a seamless experience and avoid disruptions in your workflows, we recommend the following steps: 
> * Verify the cipher algorithms supported by your SFTP server. 
> * If your server uses deprecated cipher algorithms, consider updating your server to support modern and secure cipher algorithms. 
> * Consult with your IT team or SFTP server provider for guidance on upgrading your server’s cryptographic capabilities. 
> * Avoid installing version 2.56 (or later) until the migration of SFTP servers to the correct version is complete. 

## <a name="openconnection"></a> Open FTP connection

This action establishes a specific connection to a remote FTP server, and stores that connection as a variable for later use.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Host|No|[Text value](../variable-data-types.md#text-value)||Enter the FTP server address here.|
|Port|Yes|[Numeric value](../variable-data-types.md#numeric-value)|21|Enter the FTP server port here.|
|Active mode|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specify the mode of the connection|
|Username|No|[Text value](../variable-data-types.md#text-value)||Specify the username of the FTP account to use|
|Password|Yes|Direct encrypted input or [Text value](../variable-data-types.md#text-value)||Specify the password of the FTP account to use|
|Timeout|Yes|[Numeric value](../variable-data-types.md#numeric-value)|10|Set the time in seconds that you want to wait for the connection to be established before the action fails|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|FTPConnection|[FTP connection](../variable-data-types.md#connections)|The FTP connection|

### <a name="openconnection_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Login failure error|Indicated that the login failed|
|Connection error|Indicates that there's a problem with the connection|

## <a name="listdirectory"></a> List FTP directory

This action returns the subdirectories and files contained in the current directory of an FTP connection.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Connection|No|[FTP connection](../variable-data-types.md#connections)||The FTP connection|
|Path|Yes|[Text value](../variable-data-types.md#text-value)||The path that you want to list.|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|Directories|[List](../variable-data-types.md#list) of [FTP directories](../variable-data-types.md#ftp)|The listed directories|
|Files|[List](../variable-data-types.md#list) of [FTP files](../variable-data-types.md#ftp)|The listed files|

### <a name="listdirectory_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Listing error|Indicates that the listing of the folder couldn't be performed|
|Not connected error|Indicates that there's no open connection with the FTP server|
|Directory doesn't exist error|Indicates that the directory couldn't be found|

## <a name="opensecureconnection"></a> Open secure FTP connection

This action establishes a specific secure connection to a remote FTP server, and stores that connection as a variable for later use.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Host|No|[Text value](../variable-data-types.md#text-value)||Enter the FTP server address here.|
|Port|Yes|[Numeric value](../variable-data-types.md#numeric-value)|22|Enter the FTP server port here.|
|Active mode|N/A|[Boolean value](../variable-data-types.md#boolean-value)|True|Specify the mode of the connection|
|Secure FTP Protocol|N/A|SFTP, FTPS explicit, FTPS implicit|SFTP|Choose the FTP protocol you wish to use to encrypt your connection|
|Authentication method|N/A|Username and password, Private key, Private key and passphrase|Username and password|Choose the method you wish to use to authenticate yourself on the FTP server|
|User name|No|[Text value](../variable-data-types.md#text-value)||Specify the username of the FTP account to use|
|Password|Yes|Direct encrypted input or [Text value](../variable-data-types.md#text-value)||Specify the password of the FTP account you wish to use|
|Path to private key|No|[Text value](../variable-data-types.md#text-value)||Enter the file path to the private-key to be used for authentication|
|Private key pass phrase|Yes|Direct encrypted input or [Text value](../variable-data-types.md#text-value)||Enter a variable containing the private-key pass phrase here|
|Timeout|Yes|[Numeric value](../variable-data-types.md#numeric-value)|10|Set the time in seconds that you want to wait for the connection to be established before the action fails|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|SftpConnection|[FTP connection](../variable-data-types.md#connections)|SFTP connection|

### <a name="opensecureconnection_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Login failure error|Indicated that the login failed|
|Connection error|Indicates that there's a problem with the connection|

## <a name="closeconnection"></a> Close connection

This action closes an open FTP connection.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Connection|No|[FTP connection](../variable-data-types.md#connections)||The FTP connection|

### Variables produced

This action doesn't produce any variables.

### <a name="closeconnection_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Not connected error|Indicates that there's no open connection with the FTP server|

## <a name="changeworkingdirectory"></a> Change working directory

This action sets the current working directory for an FTP connection.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Connection|No|[FTP connection](../variable-data-types.md#connections)||The FTP connection|
|Set working directory to|No|[Text value](../variable-data-types.md#text-value)||Set the path to be set as the working directory|

### Variables produced

This action doesn't produce any variables.

### <a name="changeworkingdirectory_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Not connected error|Indicates that there's no open connection with the FTP server|
|Directory doesn't exist error|Indicates that the directory couldn't be found|
|Can't change working directory error|Indicates that it isn't possible to change the working directory|

## <a name="downloadfiles"></a> Download file(s) from FTP

Downloads one or more files from an FTP server.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|FTP connection|No|[FTP connection](../variable-data-types.md#connections)||The FTP connection to work with. This variable must have been previously specified in an Open FTP connection action|
|Download into folder|No|[Folder](../variable-data-types.md#files-and-folders)||The folder to be the destination of the file(s) that will be downloaded|
|File(s) to download|No|[List](../variable-data-types.md#list) of [FTP files](../variable-data-types.md#ftp)||The file(s) to download|
|Transfer type|N/A|Auto, Binary, ASCII|Auto|Enter ASCII or binary to specify the method for downloading a single file. If the file type is uncertain, or more than one is downloaded, choose Auto to follow the transfer rules specified in options|
|If file exists|N/A|Overwrite, Do not download, Download with unique name|Overwrite|Specify what to do if the file already exists. Overwrite writes over the original file so you can't access it anymore, and download with unique name adds an underscore and a sequential number to the end|

### Variables produced

This action doesn't produce any variables.

### <a name="downloadfiles_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Not connected error|Indicates that there's no open connection with the FTP server|
|Remote file doesn't exist error|Indicates that the file doesn't exist on the FTP server|
|Directory doesn't exist error|Indicates that the directory couldn't be found|
|FTP connection aborted error|Indicates that the FTP connection was aborted|
|Can't download file error|Indicates that it wasn't possible to download the file|

## <a name="downloadfolders"></a> Download folder(s) from FTP

Downloads one or more folders from an FTP server.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|FTP connection|No|[FTP connection](../variable-data-types.md#connections)||The FTP connection to work with. This variable must have been previously specified in an Open FTP connection action|
|Folder(s) to download|No|[List](../variable-data-types.md#list) of [FTP directories](../variable-data-types.md#ftp)||The name of the folder path(s), or FTP folder(s) to download|
|Download into local folder|No|[Folder](../variable-data-types.md#files-and-folders)||The full path of the destination of the FTP folder(s) you're downloading|

### Variables produced

This action doesn't produce any variables.

### <a name="downloadfolders_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Not connected error|Indicates that there's no open connection with the FTP server|
|Remote directory doesn't exist error|Indicates that the directory doesn't exist on the FTP server|
|Directory doesn't exist error|Indicates that the directory couldn't be found|
|FTP connection aborted error|Indicates that the FTP connection was aborted|
|Can't download directory error|Indicates that it wasn't possible to download the directory|

## <a name="uploadfiles"></a> Upload File(s) to FTP

Uploads one or more files to an FTP server.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|FTP connection|No|[FTP connection](../variable-data-types.md#connections)||The FTP connection to work with. This variable must have been previously specified in an Open FTP connection action|
|File(s) to upload|No|[List](../variable-data-types.md#list) of [Files](../variable-data-types.md#files-and-folders)||The file(s) to upload|
|Remote location|Yes|[Text value](../variable-data-types.md#text-value)||The location where the files should be uploaded|
|Transfer type|N/A|Auto, Binary, ASCII|Auto|Enter ASCII or binary to specify the method for downloading a single file. If you're not sure what type the file will be, or if you're downloading more than one, choose Auto to follow the transfer rules specified in Options|
|If file exists|N/A|Overwrite, Do not download, Download with unique name|Overwrite|Specify what to do if the file already exists. Overwrite writes over the original file so you can't access it anymore, and Download with Unique Name adds an underscore and a sequential number to the end|

### Variables produced

This action doesn't produce any variables.

### <a name="uploadfiles_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Not connected error|Indicates that there's no open connection with the FTP server|
|File not found error|Indicates that the file wasn't found|
|FTP connection aborted error|Indicates that the FTP connection was aborted|
|Upload file error|Indicates that the file couldn't be uploaded|

## <a name="uploadfolders"></a> Upload folder(s) to FTP

Uploads one or more folders to an FTP server.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|FTP connection|No|[FTP connection](../variable-data-types.md#connections)||The FTP connection to work with. This variable must have been previously specified in an Open FTP connection action|
|Folder(s) to upload|No|[List](../variable-data-types.md#list) of [Folders](../variable-data-types.md#files-and-folders)||The folder(s) to upload. The folders being uploaded shouldn't already exist within the active directory of the FTP server|
|Remote location|No|[Text value](../variable-data-types.md#text-value)||The location where the folders should be uploaded|

### Variables produced

This action doesn't produce any variables.

### <a name="uploadfolders_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Not connected error|Indicates that there's no open connection with the FTP server|
|Remote directory doesn't exist error|Indicates that the directory doesn't exist on the FTP server|
|FTP connection aborted error|Indicates that the FTP connection was aborted|
|Upload directory error|Indicates that the directory couldn't be uploaded|

## <a name="deletefiles"></a> Delete FTP file

Deletes one or more files from an FTP server.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|FTP connection|No|[FTP connection](../variable-data-types.md#connections)||The FTP connection to work with. This variable must have been previously specified in an Open FTP connection action|
|Files to delete|No|[List](../variable-data-types.md#list) of [FTP files](../variable-data-types.md#ftp)||The files to delete|

### Variables produced

This action doesn't produce any variables.

### <a name="deletefiles_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Not connected error|Indicates that there's no open connection with the FTP server|
|File not found error|Indicates that the file wasn't found|
|Can't delete file error|Indicates that the deletion of the file wasn't possible|

## <a name="renamefile"></a> Rename FTP File

Renames a file that resides on an FTP server.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|FTP connection|No|[FTP connection](../variable-data-types.md#connections)||The FTP connection to work with. This variable must have been previously specified in an Open FTP connection action|
|File to rename|No|[FTP file](../variable-data-types.md#ftp)||The file to rename|
|New file name|No|[Text value](../variable-data-types.md#text-value)||The new name for the file. If you enter a name with a path, the file will also be moved to that location. If the location doesn't exist, it will throw an exception|

### Variables produced

This action doesn't produce any variables.

### <a name="renamefile_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Not connected error|Indicates that there's no open connection with the FTP server|
|Can't rename file error|Indicates that it wasn't possible to rename the file|
|File not found error|Indicates that the file wasn't found|

## <a name="createdirectory"></a> Create FTP directory

Creates a directory on an FTP server.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|FTP connection|No|[FTP connection](../variable-data-types.md#connections)||The FTP connection to work with. This variable must have been previously specified in an Open FTP connection action|
|New directory|No|[FTP directory](../variable-data-types.md#ftp)||The new directory. If a path is specified, all of the new folders leading to the new directory will be created|

### Variables produced

This action doesn't produce any variables.

### <a name="createdirectory_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Access denied error|Indicates that this account doesn't have access for an operation|
|File exists error|Indicates that the file already exists|
|Create directory error|Indicates that it wasn't possible creating the directory|
|Directory doesn't exist error|Indicates that the directory couldn't be found|
|Not connected error|Indicates that there's no open connection with the FTP server|

## <a name="deletedirectory"></a> Delete FTP directory

Deletes a directory from an FTP server.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|FTP connection|No|[FTP connection](../variable-data-types.md#connections)||The FTP connection to work with. This variable must have been previously specified in an Open FTP connection action|
|Directory to delete|No|[FTP directory](../variable-data-types.md#ftp)||The folder to be deleted. Everything in the folder will be deleted as well|

### Variables produced

This action doesn't produce any variables.

### <a name="deletedirectory_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Delete directory error|Indicates that it wasn't possible to delete the directory|
|Remote directory doesn't exist error|Indicates that the directory doesn't exist on the FTP server|
|Working directory change error|Indicates that the working directory couldn't be changed|
|Not connected error|Indicates that there's no open connection with the FTP server|

## <a name="invokecommand"></a> Invoke FTP command

Invokes the given literal FTP command on the server.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|FTP connection|No|[FTP connection](../variable-data-types.md#connections)||The FTP connection to work with. This variable must have been previously specified in an open FTP connection action|
|FTP command|No|[Text value](../variable-data-types.md#text-value)||The command to run along with any arguments. For example, you could run FEAT, or CHMOD here|
|Valid reply code(s)|Yes|[Text value](../variable-data-types.md#text-value)||The code(s) that could be returned by the command, separated by semi-colon. If the FTP command returns a code that wasn't entered here, this action will throw an exception. Only applies over simple FTP or FTPS connections|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|ReplyCode|[Text value](../variable-data-types.md#text-value)|The actual code that was returned. Only applies over simple FTP or FTPS connections|
|ReplyText|[Text value](../variable-data-types.md#text-value)|The text returned by the FTP server|

### <a name="invokecommand_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Invoke command error|Indicates that an error occurred while invoking an FTP command|
|Not connected error|Indicates that there's no open connection with the FTP server|

## <a name="synchronizedirectoryaction"></a> Synchronize directories

Synchronize the files and subdirectories of a given Folder with a given remote FTP directory.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|FTP connection|No|[FTP connection](../variable-data-types.md#connections)||The FTP connection to work with. This variable must have been previously specified in an Open FTP connection action|
|Synchronization direction|N/A|Remote -> local (Download), Local -> remote (Upload)|Remote -> local (Download)|Direction of the Synchronization method. Whether the local folder will be synchronized to the remote directory (DOWNLOAD) or the remote directory will be synchronized to the local folder (UPLOAD)|
|Files to sync|N/A|All files, Only files matching the file filter, Only files not matching the file filter|All files|Choose whether you want to synchronize all files, or you want to use a file filter to include or exclude a specific set of files|
|File filter|No|[Text value](../variable-data-types.md#text-value)|*|File-name pattern that controls which files will be included or excluded. This option allows wildcards such as "*.txt", "document?.doc". The option also allows for multiple filters by using coma as a separator, "*.txt,*.pdf,document?"|
|Local folder|No|[Folder](../variable-data-types.md#files-and-folders)||Name of the local folder to be synchronized|
|FTP directory|Yes|[FTP directory](../variable-data-types.md#ftp)|/|Name of the FTP directory to be synchronized|
|Delete if source is absent|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|This option will delete a file or folder that exists in the target directory and not the source.|
|Include subdirectories|N/A|[Boolean value](../variable-data-types.md#boolean-value)|True|This option will include subdirectories in the synchronization process.|
|Time difference in hours|Yes|[Numeric value](../variable-data-types.md#numeric-value)|0|Time difference in hours of the remote server in case it operates on a different Time Zone.|
|Time difference in minutes|Yes|[Numeric value](../variable-data-types.md#numeric-value)|0|Time difference in Minutes of the remote server in case it operates on a different Time Zone.|
|Time difference ahead|N/A|[Boolean value](../variable-data-types.md#boolean-value)|True|Specify whether the server's time zone is ahead or not.|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|FtpFilesAdded|[List](../variable-data-types.md#list) of [FTP files](../variable-data-types.md#ftp)|List of FTP files that initially existed in the source and after the synchronization process were added to the target.|
|FtpFilesModified|[List](../variable-data-types.md#list) of [FTP files](../variable-data-types.md#ftp)|List of FTP files that initially existed in both the source and the target and after the synchronization process were added to the target.|
|FtpFilesDeleted|[List](../variable-data-types.md#list) of [FTP files](../variable-data-types.md#ftp)|List of FTP files that initially existed in the target directory and after the synchronization process were deleted.|
|FilesAdded|[List](../variable-data-types.md#list) of [Files](../variable-data-types.md#files-and-folders)|List of files that initially existed in the source and after the synchronization process were added to the target.|
|FilesModified|[List](../variable-data-types.md#list) of [Files](../variable-data-types.md#files-and-folders)|List of files that initially existed in both the source and the target and after the synchronization process were added to the target.|
|FilesDeleted|[List](../variable-data-types.md#list) of [Files](../variable-data-types.md#files-and-folders)|List of files that initially existed in the target directory and after the synchronization process were deleted.|

### <a name="synchronizedirectoryaction_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Listing error|Indicates that the listing of the folder couldn't be performed|
|Not connected error|Indicates that there's no open connection with the FTP server|
|File not found error|Indicates that the file wasn't found|
|FTP connection aborted error|Indicates that the FTP connection was aborted|
|Upload file error|Indicates that the file couldn't be uploaded|
|Remote file doesn't exist error|Indicates that the file doesn't exist on the FTP server|
|Can't download file error|Indicates that it wasn't possible to download the file|
|Delete directory error|Indicates that it wasn't possible to delete the directory|
|Synchronization failed error|Indicates that the synchronization process failed due to an unexpected error.|

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
