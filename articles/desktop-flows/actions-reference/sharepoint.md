---
title: SharePoint (preview) | Microsoft Docs
description: SharePoint (preview) Actions Reference
author: mariosleon
ms.subservice: desktop-flow
ms.topic: reference
ms.date: 07/29/2022
ms.author: marleon
ms.reviewer:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# SharePoint (preview)

SharePoint is a type of actions that invokes the [SharePoint connector](https://docs.microsoft.com/connectors/sharepointonline/) from within desktop flows instead of running locally on the desktop. This connector is the same that is used across Power Automate cloud flows, PowerApps, and Logic Apps. It uses the same parameters and returns the same type of data. 

## Prerequisites and limitations

- During preview, you need an Attended with RPA license.

- Sharing desktop flows with SharePoint cloud actions isn't supported. Co-owners won't be able to run such desktop flows unless they overwrite the connection references with their own. **Users** with read access are unable to run such flows. 

- DLPs that include SharePoint cloud actions aren't enforced within desktop flows. During preview, machine administrators can disable the SharePoint actions by modifying the [appropriate registry setting](governance.md#prevent-power-automate-for-desktop-from-running-flows-containing-cloud-connectors). 

## Why should I use SharePoint actions inside desktop flows instead of cloud flows? 

Users can still combine SharePoint actions with the **Run a flow built with Power Automate for desktop** action.

However, SharePoint actions inside desktop flows improve performance and ease of use for users that need to loop between cloud and desktop actions. 

## List of SharePoint actions

- Get file content by path 
- Get folder by path 
- Get file metadata by path 
- Create file 
- Update file 
- Delete file 
- List folder 

## Getting started with SharePoint actions in Desktop flow 

### How to download the content of a SharePoint folder 

1. Create a SharePoint connection reference in any solution.

1. Download the [latest Power Automate for desktop version](../install.md).

1. Create a new desktop flow.

1. Find the **SharePoint (preview)** group of actions in the flow designer.

1. Drag and drop the **List folder** action in the workspace. 

1. [STEPS WILL BE ADDED HERE WHEN I HAVE A BUILD]

1. Now, you can further process the local files using other actions. For example, you can run Excel macros to those files, save them, and upload them back to SharePoint. 

### How to upload a local file to SharePoint 

1. Create a SharePoint connection reference in any solution.

1. Download the [latest Power Automate for desktop version](../install.md).
s
1. Create a new desktop flow.

1. Deploy the **Convert file to binary data** action and select the desired file on your local drive. The action stores the converted file in the **BinaryData** variable.

1. Find the **SharePoint (preview)** group of actions in the flow designer and deploy the **Create file** action in the workspace. 

1. Select an existing connection reference and fill in the required parameters. Here's an example about how to fill the fields: 

    > ![IMPORTANT]
    > Don't forget to add the appropriate file extension after the file name.

    - **Site address**: <https://contoso.sharepoint.com/sites/sitename>
    - **File path**: /Shared Documents/MyFolderName
    - **File name**: myfilename.xlsx 
    - **File content**: %BinaryData%

## How to fill action’s input fields

Until dynamic suggestions of input fields become available, here's guidance on what data to fill in for each action. 

>![NOTE}
>Another way to see which properties are expected as input and output is to create a cloud flow with the same action and observe its dynamic data properties. To find more information regarding the SharePoint cloud actions, refer to [SharePoint](https://docs.microsoft.com/connectors/sharepointonline/).

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
- Create new connection reference from within Power Automate for desktop.
- Share to **users** brings their own connection references upon each run
- Co-owners can use the same connection references
- ALM dependencies management (dependency checker upon import, add required objects, show dependencies)
- Connection references are visible in desktop flows details pages
- Exponential / manual retry policies in case the connector responds an error
- DLPs that include SharePoint cloud actions are enforced in desktop flows
- New SharePoint actions
- New actions from other connectors