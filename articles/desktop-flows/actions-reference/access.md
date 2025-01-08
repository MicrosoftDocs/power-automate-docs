---
title: Access actions reference
description: See all the available Access actions.
author: NikosMoutzourakis
ms.subservice: desktop-flow
ms.topic: reference
ms.date: 01/7/2025
ms.author: nimoutzo
ms.reviewer: DanaMartens
contributors:
search.audienceType: 
  - flowmaker
  - enduser
---
# Access actions

The Access automation feature enables you to seamlessly interact with Access databases stored locally. To begin, you need to create an Access instance using the 'Launch Access' action. This instance serves as the input parameter for the rest of the actions in the group, allowing you to easily perform actions on the desired Access database.

Currently, the below actions are available:

* **Launch Access**
* **Close Word**
* **Read Access table**
* **Run Access query**
* **Run Access macro**

>[!NOTE]
> Access actions in Power Automate for desktop are compatible with Microsoft Access 2013 or later versions.

## <a name="launchaccess"></a> Launch Access

Launches an Access database.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Database path|N/A|Path of database||The full path of the Access database to open.|
|User interaction mode|N/A|Boolean value|False|Specify if the Access instance allows user interaction. This mode keeps the application running after the flow closes and permits user interaction alongside automation but may cause popups and errors requiring user attention.|
|Make instance visible|N/A|Boolean value|True|Specify whether to make the Access window visible or hide it.|
|Database password|Yes|Direct encrypted input or Text value||The encryption password of the database, if it's password protected|
|Exclusive|N/A|Boolean value|False|Specify whether you want to open the database in exclusive mode. When set to enabled, the database cannot be shared with others while it’s open.|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|`AccessInstance`|Access instance|The specific Access instance for use with later Access actions. This allows the user to specify which of potentially several Access documents to access|

### <a name="launchaccess_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|The Access database was not found|Indicates the specified Access database cannot be found.|
|Failed to open existing Access database|Indicates an with opening the specific Access database.|
|Failed to launch Access|Indicates an issue with launching the Access application.|
|Access application is not installed|Indicates that Access application is not currently installed in the specific machine.|

## <a name="readaccesstable"></a> Read Access table

Reads an Access table

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Access instance|N/A|Access instance||The Access instance to work with. This variable must have been previously specified in a Launch Access action.|
|Table name|N/A|Text||The name of the Access table. Note that you must type the exact name of the table as it is stored in the specific Access database.|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|Result|Text|The result of the read query.|

### <a name="readaccesstable_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to read an Access table|Indicates an issue with reading the specific Access table.|

## <a name="runaccessquery"></a> Run Access query

Runs a stored Access query

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Access instance|N/A|Access instance||The Access instance to work with. This variable must have been previously specified in a Launch Access action.|
|Query name|N/A|Text||The name of the stored Access query. Note that you must type the exact name of the query as it is stored in the specific Access database.|
|Query type|N/A|Select query, Action query|Select query|Specify whether this is a Select or Action query.|
|Contains parameter|Yes|Boolean|False|Specify the parameters required to run the query. Ensure the parameter names and data types match those specified in the query.|


### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|QueryResult|Text|The result of the Select query execution, returning the output of the query in a datatable.|
|AffectedRows|Text|The number of rows that are affected, as a result of executing the Action query.|

### <a name="runaccessquery_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to run an Access query|Indicates an issue with executing the specific Access query.|

## <a name="runaccessmacro"></a> Run Access macro

Runs a stored Access query

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Access instance|N/A|Access instance||The Access instance to work with. This variable must have been previously specified in a Launch Access action.|
|Macro name|N/A|Text||The name of the stored Access macro. Note that you must type the exact name of the macro as it is stored in the specific Access database.|
|Is VBA Macro|No|Boolean|False|Specify whether the macro is a VBA macro.|
|Contains parameter|Yes|Boolean|False|Specify the parameters required to run the macro. Ensure the parameter names and data types match those specified in the macro.|


### Variables produced

|Argument|Type|Description|
|-----|-----|-----|

### <a name="runaccessmacro_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to run an Access macro|Indicates an issue with executing the specific Access macro.|

## <a name="closeaccess"></a> Close Access

Closes an Access instance

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Access instance|N/A|Access instance||The Access instance to work with. This variable must have been previously specified in a Launch Access action.|
|Before closing Access|N/A|Do not save changes, Save changes|Do not save changes|Specify whether to save or not the Access database of this instance before closing this instance.|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|

### <a name="closeaccess_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to close Access|Indicates an issue with closing the specific Access instance.|

## Known limitations
Read Access table and Read Access query cannot retirve attachement and binary data type cells.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
