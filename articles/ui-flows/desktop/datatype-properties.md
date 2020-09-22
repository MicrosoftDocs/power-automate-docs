---
title: Datatype properties | Microsoft Docs
description: Datatype properties
author: georgiostrantzas
ms.service: flow
ms.topic: article
ms.date: 09/22/2020
ms.author: getrantz
ms.reviewer:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Datatype properties

[!INCLUDE [cc-beta-prerelease-disclaimer.md](../../includes/cc-beta-prerelease-disclaimer.md)]

Some of the built-in data types have properties that are associated with the value stored in the variable. 

A property may contain a part of the information stored in the variable, like the day of a date, or an extra attribute describing the variable, like the size of a list.

The value of these properties can be accessed directly through the following notation: **%VariableName.PropertyName%**.

For example, if you have a list of files called **Files**, you can get the number of the stored files using the expression: **%Files.Count%**

![The Count variable property of the file datatype.](media\datatype-properties\files-count.png)

The data types that have properties are displayed in the following lists.

## Texts

|Property  |Description                                                                             |
|----------|----------------------------------------------------------------------------------------|
|Length    |The length of the stored text in characters.                                            |
|isEmpty   |This property is true if the variable is empty or false if it contains some characters. |
|ToUpper   |The text of the variable written in upper case characters.                              |
|ToLower   |The text of the variable written in lower case characters.                              |
|Trimmed   |The text of the variable written without white characters in the begging and the end.   |

## Dates

|Property  |Description                                               |
|----------|----------------------------------------------------------|
|Year      |The year part of the datetime value.                      |
|Month     |The month part of the datetime value.                     |
|Day       |The day part of the datetime value.                       |
|DayOfWeek |The name of the day (Sunday, Monday etch).                |
|DayOfYear |The day of the year part of the datetime value (1-365/6). |
|Hour      |The hour part of the datetime value.                      |
|Minute    |The minute part of the datetime value.                    |
|Second    |The seconds part of the datetime value.                   |

## Lists

|Property  |Description                              |
|----------|-----------------------------------------|
|Count     |The number of items stored into the list.|

## Files

| Property            |Description                                                                  |
|---------------------|-----------------------------------------------------------------------------|
|FullName             |The full path to the file.                                                   |
|RootPath             |The root path of the file, for example **C:\\**.                             |
|Directory            |The directory where the file is stored.                                      |
|Name                 |The name of the file, including the extension.                               |
|NameWithoutExtension |The name of the file without its extension.                                  |
|Extension            |The extension of the file.                                                   |
|Size                 |The size of the file in bytes.                                               |
|CreationTime         |The date when the file was created.                                          |
|LastAccessed         |The date when the file was last accessed.                                    |
|LastModified         |The date when the file was last modified.                                    |
|IsHidden             |This property is true if the file is hidden or false if the file is visible. |
|IsSystem             |This property is true if the file is a system file or false if it isn't.     |
|IsReadOnly           |This property is true if the file is read only or false if it isn't.         |
|IsArchive            |This property is true if the file is an archive or false if it isn't.        |
|Exists               |This property is true if the file exists or false if the file doesn't exist. |
|isEmpty              |This property is true if the file is empty or false if the file isn't empty. |

## Folders

|Property     |Description                                                                      |
|-------------|---------------------------------------------------------------------------------|
|FullName     |The full path to the folder.                                                     |
|RootPath     |The root path of the folder, for example, **C:\\**.                              | 
|Parent       |The parent directory of the folder.                                              |
|Name         |The name of the folder.                                                          |
|CreationTime |The date when the folder was created.                                            |
|LastModified |The date when the folder was last modified.                                      |
|IsHidden     |This property is true if the folder is hidden or false if the folder is visible. |
|Exists       |This property is true if the folder exists or false if the folder doesn't exist. |
|isEmpty      |This property is true if the folder is empty or false if the folder isn't empty. |
|FilesCount   |The number of files in the folder.                                               |
|FoldersCount |The number of folders in the folder.                                             |

## Mail messages

|Property    |Description                                                                                                |
|------------|-----------------------------------------------------------------------------------------------------------|
|MailFolder  |The name folder the email message is retrieved from.                                                       |
|Uid         |The unique identifier of the message.                                                                      | 
|From        |The sender of the email message.                                                                           |
|To          |A list of values containing the recipients of the message.                                                 |
|Cc          |A list of values containing additional recipients for the message (carbon copy).                           |
|Date        |The date and time in which the message was sent.                                                           |
|Subject     |The subject of the message.                                                                                |
|Body        |The body of the message. The body can be in plain text or in HTML form.                                    |
|BodyText    |If the previous property contains HTML, this property contains the body of the message in plain text form. |
|Attachments |A list of files that represent the saved attachments of the email message (if any).                        |

## Exchange connection

|Property                |Description                         |
|------------------------|------------------------------------|
|ServerAddress           |The address of the Exchange server. |

## Exchange mail messages

|Property    |Description                                                                                                |
|------------|-----------------------------------------------------------------------------------------------------------|
|MailFolder  |The name folder the email message is retrieved from.                                                       |
|ItemId      |The unique identifier of the message.                                                                      | 
|From        |The sender of the email message.                                                                           |
|To          |A list of values containing the recipients of the message.                                                 |
|Cc          |A list of values containing additional recipients for the message (carbon copy).                           |
|Date        |The date and time in which the message was sent.                                                           |
|Subject     |The subject of the message.                                                                                |
|Body        |The body of the message. The body can be in plain text or in HTML form.                                    |
|BodyText    |If the previous property contains HTML, this property contains the body of the message in plain text form. |
|Attachments |A list of files that represent the saved attachments of the email message (if any).                        |

## Outlook mail messages

|Property    |Description                                                                                                |
|------------|-----------------------------------------------------------------------------------------------------------|
|MailFolder  |The name folder the email message is retrieved from.                                                       |
|EntryId     |The unique identifier of the message.                                                                      | 
|From        |The sender of the email message.                                                                           |
|To          |A list of values containing the recipients of the message.                                                 |
|Cc          |A list of values containing additional recipients for the message (carbon copy).                           |
|Bcc         |A list of values containing additional recipients for the message (blind carbon copy).     
|Date        |The date and time in which the message was sent.                                                           |
|Subject     |The subject of the message.                                                                                |
|Body        |The body of the message. The body can be in plain text or in HTML form.                                    |
|BodyText    |If the previous property contains HTML, this property contains the body of the message in plain text form. |
|Attachments |A list of files that represent the saved attachments of the email message (if any).                        |

## FTP files

|Property             |Description                                               |
|---------------------|----------------------------------------------------------|
|FullName             |The full path to the file.                                |
|Directory            |The directory where the file is stored on the FTP Server. | 
|Name                 |The name of the file, including the extension.            |
|NameWithoutExtension |The name of the file without its extension.message.       |
|Extension            |The extension of the file.                                |
|Size                 |The size of the file in bytes.                            |
|LastModified         |The date when the file was last modified.                 |

## FTP folders

|Property     |Description                                 |
|-------------|--------------------------------------------|
|FullName     |The full path to the folder.                |
|Parent       |The parent directory of the folder.         | 
|Name         |The name of the folder.                     |
|LastModified |The date when the folder was last modified. |

## FTP connection

|Property         |Description                                   |
|-----------------|----------------------------------------------|
|Host             |The host of the FTP connection.               |
|SecurityProtocol |The security protocol used in the connection. |

## Datatables

|Property  |Description                                                                           |
|----------|--------------------------------------------------------------------------------------|
|RowsCount |The number of rows of the data table.                                                 |
|Columns   |A list that contains the names of the columns of the data table.                      | 
|IsEmpty   |This property is true if the datatable is empty or false if it is contains elements. | 

## Datarows

|Property     |Description                                                      |
|-------------|-----------------------------------------------------------------|
|ColumnsCount |The number of columns that the data row holds.                   |
|ColumnsNames |A list that contains the headers of the datarow.                 |

## Web browser instance

|Property                |Description                                                                |
|------------------------|---------------------------------------------------------------------------|
|DisplayRectangleX       |The position of the top-left corner of the window in the x axel.           |
|DisplayRectangleY       |The position of the top-left corner of the window in the y axel.           |
|Handle                  |The handle of the browser instance.                                        |
|HtmlDialogs             |Contains the dialogs of the current page, if they exist.                   |
|IsAlive                 |This property is true if the browser window is alive or false if it isn't. | 

## Window instance

|Property                |Description                                                                |
|------------------------|---------------------------------------------------------------------------|
|Handle                  |The handle of the window instance.                                         |

## Excel instance

|Property                |Description                                                                |
|------------------------|---------------------------------------------------------------------------|
|Handle                  |The handle of the Excel instance.                                          |

## SQL connection

|Property                |Description                                                                   |
|------------------------|------------------------------------------------------------------------------|
|ConnectionString        |The connection string used for the database connection.                       |
|IsClosed                |This property is true if the browser window is closed or false if it is open. |

## CMD session

|Property   |Description                                                                   |
|-----------|------------------------------------------------------------------------------|
|IsAlive    |This property is true if the CMD session is alive or false if it isn't.       |
|ProcessId  |The unique identifier of the process.                                         |

## Terminal session

|Property     |Description                                                                       |
|-------------|----------------------------------------------------------------------------------|
|IsTerminated |This property is true if the terminal session is terminated or false if it isn't. |

## XML node

|Property   |Description                          |
|-----------|-------------------------------------|
|Children   |The children of the XML node.        |
|InnerText  |The inner text of the XML node.      |
|InnerXML   |The inner XML  of the XML node     . |
|Name       |The name of the XML document.        |
|OuterXML   |The outer XML of the XML node.       |
|Parent     |The parent of the XML node.          |
|Value      |The value of the XML node.           |


## Active Directory entry

|Property   |Description                                       |
|-----------|--------------------------------------------------|
|LdapPath   |The LDAP path of the Active Directory connection. |

## Group info

|Property    |Description                                 |
|------------|--------------------------------------------|
|Description |The description of the group.               |
|DisplayName |The display name of the group.              |
|Members     |A list containing the members of the group. |
|Name        |The name of the group.                      |

## User info

|Property        |Description                   |
|----------------|------------------------------|
|City            |The city uf the user.         |
|Company         |The company of the user.      |
|Country         |The country of the user.      |
|Department      |The department of the user.   |
|Email           |The email of the user.        |
|Extension       |The extension of the user.    |
|FirstName       |The first name of the user.   |
|Initials        |The initials of the user.     |
|LastName        |The last name of the user.    |
|PostalCode      |The postal code of the user.  |
|State           |The state of the user.        |
|StreetAddress   |The address of the user.      |
|TelephoneNumber |The phone number of the user. |
|Title           |The title of the user.        |