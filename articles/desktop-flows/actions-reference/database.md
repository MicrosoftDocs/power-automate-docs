---
title: Database | Microsoft Docs
description: Database Actions Reference
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

# Database

[!INCLUDE [cc-beta-prerelease-disclaimer.md](../../../includes/cc-beta-prerelease-disclaimer.md)]

Connect to databases and execute SQL statements

|<!-- --> |
|-----|
|[Open SQL connection](#connect)|
|[Execute SQL statement](#executesqlstatement)|
|[Close SQL connection](#close)|

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

