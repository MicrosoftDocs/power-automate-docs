---
title: Database actions reference
description: See all the available Database actions.
author: georgiostrantzas

ms.subservice: desktop-flow
ms.topic: reference
ms.date: 11/23/2022
ms.author: gtrantzas
ms.reviewer: marleon
contributors:
- Yiannismavridis
- NikosMoutzourakis
- PetrosFeleskouras
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Database actions

Connect to databases and execute SQL statements

## Get started with database actions

To connect to a database, use the **Open SQL connection** action. A connection string specifies all information necessary to connect to a database, such as the driver, the database, server names, and the username and password.

The following connection string connects to an Excel database:

```Connection string
Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:\myFolder\myExcelFile.xlsx;Extended Properties="Excel 12.0 Xml;HDR=YES";
```

The following connection string connects to an Access database:

```Connection string
Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:\myFolder\myAccessFile.accdb; Persist Security Info=False;
```

> [!NOTE]
> Power Automate for desktop is a 64-bit application, only 64-bit installed drivers are available for selection in the **Open SQL connection** action.

## Configure a connection string manually

To manually build a connection string:

1. Select **Build connections string** to open the **Data Link Properties** dialog. The data link tool helps you compose the required connection string step by step.

2. Once you access the wizard, select the correct driver for the database under **Provider**.

    :::image type="content" source="media\database\data-link-properties-provider-tab.png" alt-text="Screenshot of the Data Link Properties tab.":::

3. Next, under the **Connection** tab, enter the remaining details such as the server name, the username, password, and database name. Select **Test Connection** to test that the connection string connects successfully.

    :::image type="content" source="media\database\data-link-properties-connection-tab.png" alt-text="Screenshot of the data link properties connection tab.":::

4. Specify a connection timeout and other network settings in the **Advanced** tab.

    :::image type="content" source="media\database\data-link-properties-advanced-tab.png" alt-text="Screenshot of the data link properties advanced tab.":::

## <a name="connect"></a> Open SQL connection

Open a new connection to a database.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Connection string|No|[Text value](../variable-data-types.md#text-value)||The connection string to use to connect to the database|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|SQLConnection|[SQL connection](../variable-data-types.md#connections)|A handle for the new SQL connection|

### <a name="connect_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Can't connect to data source|Indicates a problem connecting to the data source|
|Invalid connection string|Indicates that the specified connection string is invalid|

## <a name="executesqlstatement"></a> Execute SQL statement

Connect to a database and execute a SQL statement.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Get connection by|N/A|Connection string, [SQL connection variable]|SQL connection variable|Specifies whether to create a new connection from a given connection string or select an already open connection|
|SQL connection|No|[SQL connection](../variable-data-types.md#connections)||The handle for the new SQL connection|
|Connection string|No|[Text value](../variable-data-types.md#text-value)||The connection string to use to connect to the database|
|SQL statement|No|[Text value](../variable-data-types.md#text-value)||The SQL statement to execute to the database|
|Timeout|Yes|[Numeric value](../variable-data-types.md#numeric-value)|30|The maximum amount of time to wait for a result from the database|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|QueryResult|[Datatable](../variable-data-types.md#datatable)|The result from the database in the form of a data table, with rows and columns|

### <a name="executesqlstatement_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Can't connect to data source|Indicates a problem connecting to the data source|
|Invalid connection string|Indicates that the specified connection string is invalid|
|Error in SQL statement|Indicates there's an error in the given SQL statement|

## <a name="close"></a> Close SQL connection

Close an open connection to a database.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|SQL connection|No|[SQL connection](../variable-data-types.md#connections)||The handle for the new SQL connection|

### Variables produced

This action doesn't produce any variables.

### <a name="close_onerror"></a> Exceptions

This action doesn't include any exceptions.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
