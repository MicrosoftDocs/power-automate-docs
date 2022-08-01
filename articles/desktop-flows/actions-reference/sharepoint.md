---
title: SharePoint (preview) | Microsoft Docs
description: SharePoint (preview) Actions Reference
author: georgiostrantzas
ms.subservice: desktop-flow
ms.topic: reference
ms.date: 07/29/2022
ms.author: v-gtrantzas
ms.reviewer:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# SharePoint (preview)

SharePoint is a type of actions that invokes the [SharePoint connector](/connectors/sharepointonline) from within desktop flows instead of running locally on the desktop. This connector is the same as the one used across Power Automate cloud flows, PowerApps, and Logic Apps. It uses the same parameters and returns the same type of data. 

## Prerequisites and limitations

- During preview, you need an Attended RPA license.

- Sharing desktop flows with SharePoint cloud actions isn't supported. Co-owners won't be able to run such desktop flows unless they overwrite the connection references with their own. **Users** with read access are unable to run such flows. 

- DLPs that include SharePoint cloud actions aren't enforced within desktop flows. During preview, machine administrators can disable the SharePoint actions by modifying the [appropriate registry setting](../governance.md#prevent-power-automate-for-desktop-from-running-flows-containing-cloud-connectors). 

## Why should I use SharePoint actions inside desktop flows instead of cloud flows? 

Users can still combine SharePoint actions with the **Run a flow built with Power Automate for desktop** action. However, SharePoint actions inside desktop flows improve performance and ease of use for users that need to loop between cloud and desktop actions. 

## List of SharePoint actions

- [Get file content by path](#get-file-content-using-path)
- [Get folder by path](#get-folder-metadata-using-path)
- [Get file metadata by path](#get-file-metadata-using-path)
- [Create file](#create-file)
- [Update file](#update-file)
- [Delete file](#delete-file)
- [List folder](#list-folder)

## Getting started with SharePoint actions in desktop flows

### How to download the content of a SharePoint folder 

> [!IMPORTANT]
> Before replicating the following steps, ensure that you are familiar with [lists](../variable-data-types.md#list), [custom objects](../variable-data-types.md#custom-object), [loops](../use-loops.md), [conditionals](../use-conditionals.md), and the [percentage notation](../variable-manipulation.md).

1. Create a SharePoint connection reference in any solution. You can find information regarding how to create connection references in [Use a connection reference in a solution](/power-apps/maker/data-platform/create-connection-reference).

1. Ensure tha you've installed the [latest version of Power Automate for desktop ](../install.md).

1. Create a new desktop flow.

1. If the identifier of the target folder is unknown, use the **Get folder metadata using path** SharePoint action to retrieve it. This action requires the folder's path and produces a custom object containing the folder's metadata. You can access the identifier using the **Id** property.

1. Deploy the **List folder** SharePoint action and populate the appropriate SharePoint URL and the previously retrieved identifier. The produced list contains custom objects representing each item in the target folder.

1. After retrieving the list, use a **For each** loop to iterate through the objects inside it.

1. If the items in the target folder are only files, use the **Get file content using path** action and the **Path** property to retrieve the selected file's contents.

1. Then, deploy the **Convert binary data to file** action to store the retrieved data in a local file. You can use the **Name** property to name the new files with the same name as the original SharePoint file.

The previous steps cover the case where the target folder contains only files. However, if the folder contains subfolders with files inside them, modify your desktop flow accordingly:   

1. Add an **If** condition inside the previously deployed loop to check whether the currently selected item is a folder. To perform this check, use the **IsFolder** property of the current item. 

1. Inside the if-block, use the **Get folder metadata using path** action to get the identifier of the currently selected folder. The folder path is the same as the one you used at the beginning of the flow, plus the folder's name. You can access the folder using the **Name** property of the current item.

1.  As you did before, deploy the **List folder** SharePoint action and populate the appropriate SharePoint URL and the previously retrieved identifier.

1. Deploy a **For each** loop to iterate through the files inside the selected subfolder, and use the **Get file content using path** and the **Convert binary data to file** actions to retrieve and save locally the contents of each file.

If you want to download files of specific subfolders, modify the previously deployed conditional to check the desired condition. For example, the following condition checks whether the current item's name is any other than 2022.

> [!NOTE]
> Although you could use a new nested **If** action, combining the checks in only one conditional makes the desktop flow easier to read.  

If you want to download only files of a specific type, add a conditional before retrieving the file contents that check whether the file name contains a particular extension.

### How to upload a local file to SharePoint 

1. Create a SharePoint connection reference in any solution. You can find information regarding how to create connection references in [Use a connection reference in a solution](/power-apps/maker/data-platform/create-connection-reference).

1. Ensure tha you've installed the [latest version of Power Automate for desktop ](../install.md).

1. Create a new desktop flow.

1. Deploy the **Convert file to binary data** action and select the desired file on your local drive. The action stores the converted file in the **BinaryData** variable.

    ![Screenshot of the Convert file to binary data action.](media\sharepoint\convert-file-binary-data-action.png)

1. Find the **SharePoint (preview)** group of actions in the flow designer and deploy the **Create file** action in the workspace. 

1. Select an existing connection reference and fill in the required parameters. Here's an example about how to fill the fields: 

      > [!IMPORTANT]
      > Don't forget to add the appropriate file extension after the file name.

      ![Screenshot of the Create file Sharepoint action.](media\sharepoint\sharepoint-create-file-action.png)

## How to fill action’s input fields

Until dynamic suggestions of input fields become available, here's guidance on what data to fill in for each action. 

> [!NOTE]
> Another way to see which properties are expected as input and output is to create a cloud flow with the same action and observe its dynamic data properties. To find more information regarding the SharePoint cloud actions, refer to [SharePoint](/connectors/sharepointonline).

### Get file content using path 

Gets file contents using the file path.

#### Parameters 

|Name               |Key             |Required |Type   |Description                                                                                      |
|-------------------|----------------|---------|-------|-------------------------------------------------------------------------------------------------|
|Site Address       |dataset         |True     |String |The URL of the SharePoint site, for example: <br>https://contoso.sharepoint.com/sites/sitename   |
|File Path          |path            |True     |String |The path of the target file, for example: "/Shared Documents/MyFolderName/myfilename.xlsx"       |
|Infer Content Type |inferContentType|         |Boolean|This parameter isn't needed when using the **Get file content using path** action in desktop flows, as the maker can define the file extension to use with the **Convert binary data to file** action. |

#### Returns 

|Name         |Path         |Type      |Description                                                             |
|-------------|-------------|----------|------------------------------------------------------------------------|
|ItemId       |ItemId       |Integer   |The value to use to get or update file properties in libraries.         |
|Id           |Id           |String    |The unique id of the file or folder.                                    |
|Name         |Name         |String    |The name of the file or folder.                                         |
|DisplayName  |DisplayName  |String    |The display name of the file or folder.                                 |
|Path         |Path         |String    |The path of the file or folder.                                         |
|LastModified |LastModified |Date-time |The date and time the file or folder was last modified.                 |
|Size         |Size         |Integer   |The size of the file or folder.                                         |
|MediaType    |MediaType    |String    |The media type of the file or folder.                                   |
|IsFolder     |IsFolder     |Boolean   |A boolean value (true, false) to indicate whether the blob is a folder. |
|ETag         |ETag         |String    |The etag of the file or folder.                                         |
|FileLocator  |FileLocator  |String    |The filelocator of the file or folder.                                  |

### Get folder metadata using path 

Gets information about the folder. Uses a folder path to pick the folder. 

#### Parameters 

|Name               |Key             |Required |Type   |Description                                                                                      |
|-------------------|----------------|---------|-------|-------------------------------------------------------------------------------------------------|
|Site Address       |dataset         |True     |String |The URL of the SharePoint site, for example: <br>https://contoso.sharepoint.com/sites/sitename   |
|Folder Path        |path            |True     |String |The path of the target folder, for example: "/Shared Documents/MyFolderName                      |

#### Returns 

|Name         |Path         |Type      |Description                                                             |
|-------------|-------------|----------|------------------------------------------------------------------------|
|ItemId       |ItemId       |Integer   |The value to use to get or update file properties in libraries.         |
|Id           |Id           |String    |The unique id of the file or folder.                                    |
|Name         |Name         |String    |The name of the file or folder.                                         |
|DisplayName  |DisplayName  |String    |The display name of the file or folder.                                 |
|Path         |Path         |String    |The path of the file or folder.                                         |
|LastModified |LastModified |Date-time |The date and time the file or folder was last modified.                 |
|Size         |Size         |Integer   |The size of the file or folder.                                         |
|MediaType    |MediaType    |String    |The media type of the file or folder.                                   |
|IsFolder     |IsFolder     |Boolean   |A boolean value (true, false) to indicate whether the blob is a folder. |
|ETag         |ETag         |String    |The etag of the file or folder.                                         |
|FileLocator  |FileLocator  |String    |The filelocator of the file or folder.                                  |

### Get file metadata using path 

Gets information about the file such as size, etag, created date, etc. Uses a file path to pick the file. Use **Get file properties** action to get to the values stored in the columns in the library. 

#### Parameters 

|Name               |Key             |Required |Type   |Description                                                                                      |
|-------------------|----------------|---------|-------|-------------------------------------------------------------------------------------------------|
|Site Address       |dataset         |True     |String |The URL of the SharePoint site, for example: <br>https://contoso.sharepoint.com/sites/sitename   |
|File Path          |path            |True     |String |The path of the target file, for example: "/Shared Documents/MyFolderName/myfilename.xlsx"       |

#### Returns 

|Name         |Path         |Type      |Description                                                             |
|-------------|-------------|----------|------------------------------------------------------------------------|
|ItemId       |ItemId       |Integer   |The value to use to get or update file properties in libraries.         |
|Id           |Id           |String    |The unique id of the file or folder.                                    |
|Name         |Name         |String    |The name of the file or folder.                                         |
|DisplayName  |DisplayName  |String    |The display name of the file or folder.                                 |
|Path         |Path         |String    |The path of the file or folder.                                         |
|LastModified |LastModified |Date-time |The date and time the file or folder was last modified.                 |
|Size         |Size         |Integer   |The size of the file or folder.                                         |
|MediaType    |MediaType    |String    |The media type of the file or folder.                                   |
|IsFolder     |IsFolder     |Boolean   |A boolean value (true, false) to indicate whether the blob is a folder. |
|ETag         |ETag         |String    |The etag of the file or folder.                                         |
|FileLocator  |FileLocator  |String    |The filelocator of the file or folder.                                  |

### Create file

Uploads a file to a SharePoint site. Make sure to pick an existing library.

#### Parameters 

|Name               |Key             |Required |Type   |Description                                                                                      |
|-------------------|----------------|---------|-------|-------------------------------------------------------------------------------------------------|
|Site Address       |dataset         |True     |String |The URL of the SharePoint site, for example: <br>https://contoso.sharepoint.com/sites/sitename   |
|Folder Path        |folderPath      |True     |String |Must start with an existing library. Add folders if needed.                                      |
|File Name          |name            |True     |String |The name of the file.                                                                            |
|File Content       |body            |True     |Binary |The content of the file.                                                                         |

#### Returns 

|Name         |Path         |Type      |Description                                                             |
|-------------|-------------|----------|------------------------------------------------------------------------|
|ItemId       |ItemId       |Integer   |The value to use to get or update file properties in libraries.         |
|Id           |Id           |String    |The unique id of the file or folder.                                    |
|Name         |Name         |String    |The name of the file or folder.                                         |
|DisplayName  |DisplayName  |String    |The display name of the file or folder.                                 |
|Path         |Path         |String    |The path of the file or folder.                                         |
|LastModified |LastModified |Date-time |The date and time the file or folder was last modified.                 |
|Size         |Size         |Integer   |The size of the file or folder.                                         |
|MediaType    |MediaType    |String    |The media type of the file or folder.                                   |
|IsFolder     |IsFolder     |Boolean   |A boolean value (true, false) to indicate whether the blob is a folder. |
|ETag         |ETag         |String    |The etag of the file or folder.                                         |
|FileLocator  |FileLocator  |String    |The filelocator of the file or folder.                                  |

### Update file

Updates the contents of the file specified by the file identifier. 

#### Parameters 

|Name               |Key             |Required |Type   |Description                                                                                      |
|-------------------|----------------|---------|-------|-------------------------------------------------------------------------------------------------|
|Site Address       |dataset         |True     |String |The URL of the SharePoint site, for example: <br>https://contoso.sharepoint.com/sites/sitename   |
|File Identifier    |id              |True     |String |The unique id of the file to select.                                                             |
|File Content       |body            |True     |Binary |The content of the file.                                                                         |

#### Returns 

|Name         |Path         |Type      |Description                                                             |
|-------------|-------------|----------|------------------------------------------------------------------------|
|Id           |Id           |String    |The unique id of the file or folder.                                    |
|Name         |Name         |String    |The name of the file or folder.                                         |
|DisplayName  |DisplayName  |String    |The display name of the file or folder.                                 |
|Path         |Path         |String    |The path of the file or folder.                                         |
|LastModified |LastModified |Date-time |The date and time the file or folder was last modified.                 |
|Size         |Size         |Integer   |The size of the file or folder.                                         |
|MediaType    |MediaType    |String    |The media type of the file or folder.                                   |
|IsFolder     |IsFolder     |Boolean   |A boolean value (true, false) to indicate whether the blob is a folder. |
|ETag         |ETag         |String    |The etag of the file or folder.                                         |
|FileLocator  |FileLocator  |String    |The filelocator of the file or folder.                                  |

### Delete file 

Deletes the file specified by the file identifier. 

#### Parameters 

|Name               |Key             |Required |Type   |Description                                                                                      |
|-------------------|----------------|---------|-------|-------------------------------------------------------------------------------------------------|
|Site Address       |dataset         |True     |String |The URL of the SharePoint site, for example: <br>https://contoso.sharepoint.com/sites/sitename   |
|File Identifier    |id              |True     |String |The unique id of the file to select.                                                             |

### List folder 

Returns files contained in a SharePoint folder.

#### Parameters 

|Name               |Key             |Required |Type   |Description                                                                                      |
|-------------------|----------------|---------|-------|-------------------------------------------------------------------------------------------------|
|Site Address       |dataset         |True     |String |The URL of the SharePoint site, for example: <br>https://contoso.sharepoint.com/sites/sitename   |
|File Identifier    |id              |True     |String |The unique id of the folder.                                                                     |

#### Returns 

|Name         |Path         |Type      |Description                                                             |
|-------------|-------------|----------|------------------------------------------------------------------------|
|Id           |Id           |String    |The unique id of the file or folder.                                    |
|Name         |Name         |String    |The name of the file or folder.                                         |
|DisplayName  |DisplayName  |String    |The display name of the file or folder.                                 |
|Path         |Path         |String    |The path of the file or folder.                                         |
|LastModified |LastModified |Date-time |The date and time the file or folder was last modified.                 |
|Size         |Size         |Integer   |The size of the file or folder.                                         |
|MediaType    |MediaType    |String    |The media type of the file or folder.                                   |
|IsFolder     |IsFolder     |Boolean   |A boolean value (true, false) to indicate whether the blob is a folder. |
|ETag         |ETag         |String    |The etag of the file or folder.                                         |
|FileLocator  |FileLocator  |String    |The filelocator of the file or folder.                                  |

## Upcoming features 

- Dynamic suggestion of input fields 
- Dynamic content for output variables: cloud actions’ output variables can be expanded to show its underlying properties
- Create new connection reference from within Power Automate for desktop
- Share to **users** brings their own connection references upon each run
- Co-owners can use the same connection references
- ALM dependencies management (dependency checker upon import, add required objects, show dependencies)
- Connection references are visible in desktop flows details pages
- Exponential/manual retry policies in case the connector responds an error
- DLPs that include SharePoint cloud actions are enforced in desktop flows
- New SharePoint actions
- New actions from other connectors