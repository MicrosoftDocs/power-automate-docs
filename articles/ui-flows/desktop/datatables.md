---
title: Data tables | Microsoft Docs
description: Data tables
author: georgiostrantzas
ms.service: flow
ms.topic: article
ms.date: 02/26/2020
ms.author: getrantz
ms.reviewer:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Data tables

A data table contains data in a tabular form. Data tables are the equivalent of two-dimensional arrays in programming terms. 

A data table contains rows and columns that describe the position of each item uniquely. Data tables can be considered as lists that contain other lists as items.

![An example of a data table variable.](media\data-tables\data-table-first-item.png)

**Power Automate Desktop** doesn't provide a direct way to create a data table, but two actions generate a data table as output: the **Read from Excel** action and the **Execute SQL statement** action.

To retrieve a specific item of a data table, use the following notation: **%VariableName\[RowNumber\]\[ColumnNumber\]%**

For example, to access the A2 cell of a read Excel file, use the expression displayed below. Keep in mind that the **RowNumber** and the **ColumnNumber** should be 0 for the first item (row or column).

![An epxression to access the first row's second cell of a read Excel file.](media\data-tables\data-table-row-item.png)

If you loop through a data table with a **For Each** action, the variable that will contain the current iteration’s data is considered to be a data row. 