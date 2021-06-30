---
title: Database | Microsoft Docs
description: Database Actions Reference
author: mariosleon
ms.service: power-automate
ms.topic: article
ms.date: 12/02/2020
ms.author: marleon
ms.reviewer:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Database

Connect to databases and execute SQL statements

|<!-- --> |
|-----|
|[Open SQL connection](#connect)|
|[Execute SQL statement](#executesqlstatement)|
|[Close SQL connection](#close)|

## Getting started with database actions

To connect to a database, use the **Open SQL Connection** action. The Connection String field specifies all information that is necessary to connect to a database, such as the driver, the database, server names, and the username and password.


Connect to an Excel Database:

Example of a connection string used to connect to an Excel database connection string that one can use is:

```
Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:\myFolder\myExcelFile.xlsx;Extended Properties="Excel 12.0 Xml;HDR=YES";
```

Example of a connection string used to connect to an Access database:

```
Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:\myFolder\myAccessFile.accdb; Persist Security Info=False;
```

To manually build a connection string, select **Build connections string** to open the **Data Link Properties** window. The data link tool helps the user compose the required connection string step by step.

![Screenshot of label in action](\media\database\data-link-properties.png)

> [!NOTE]
> Power Automate Desktop is a 64-bit application, only 64-bit installed drivers will be available for selection in the **Open SQL connection** action.

## Database actions

### <a name="connect"></a> Open SQL connection
Open a new connection to a database

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Connection string|No|Text value||The connection string to use to connect to the database|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|SQLConnection|SQL connection|A handle for the new SQL connection|


##### <a name="connect_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Can't connect to data source|Indicates a problem connecting to the data source|
|Invalid connection string|Indicates that the specified connection string is invalid|

### <a name="executesqlstatement"></a> Execute SQL statement
Connect to a database and execute a SQL statement

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Get connection by|N/A|Connection string, SQL connection variable|SQL connection variable|Specifies whether to create a new connection from a given connection string or select an already open connection|
|SQL connection|No|SQL connection||The handle for the new SQL connection|
|Connection string|No|Text value||The connection string to use to connect to the database|
|SQL statement|No|Text value||The SQL statement to execute to the database|
|Timeout|Yes|Numeric value|30|The maximum amount of time to wait for a result from the database|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|QueryResult|Datatable|The result from the database in the form of a data table, with rows and columns|

##### <a name="executesqlstatement_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Can't connect to data source|Indicates a problem connecting to the data source|
|Invalid connection string|Indicates that the specified connection string is invalid|
|Error in SQL statement|Indicates there is an error in the given SQL statement|

### <a name="close"></a> Close SQL connection
Close an open connection to a database

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|SQL connection|No|SQL connection||The handle for the new SQL connection|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="close_onerror"></a> Exceptions
- This action doesn't include any exceptions

### Configuring the connection string
SQL actions require a database connection. To connect to a database, enter the string manually or as a variable. When the action connects to a database, it stores the connection into a SQL connection variable.

1. Select **Build connections string** to open the **Data Link Properties** window. The data link tool helps the user compose the required connection string step by step. 

2. Once you access the wizard, select the correct driver for the database under the **Provider** tab.

   ![data link properties provider tab](..\media\database\data-link-properties-provider-tab.png)

3. Next, under the **Connection** tab, enter the remaining details such as the server name, the username, password, and database name. Select the **Test Connection** button to test that the connection string connects to a database successfully. Alternatively, copy a ready-made connection string.

   ![data link properties connection tab](..\media\database\data-link-properties-connection-tab.png)

4. Specify a connection timeout and additional network settings in the **Advanced** tab.

   ![data link properties advanced tab](..\media\database\data-link-properties-advanced-tab.png)


[!INCLUDE[footer-include](../../includes/footer-banner.md)]