---
title: Datatables | Microsoft Docs
description: Datatables
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

# Datatables

[!INCLUDE [cc-beta-prerelease-disclaimer.md](../../includes/cc-beta-prerelease-disclaimer.md)]

A datatable contains data in a tabular form. Datatables are the equivalent of two-dimensional arrays in programming terms. 

A datatable contains rows and columns that describe the position of each item uniquely. Datatables can be considered as lists that contain other datarows as items.

![An example of a datatable variable.](media\data-tables\data-table-first-item.png)

Power Automate Desktop doesn't provide a direct way to create a datatable, but three actions generate a datatable as output: the **Read from Excel worksheet** action the **Execute SQL statement** action and the **Extract data from web page** action.

To retrieve a specific item of a datatable, use the following notation: **%VariableName\[RowNumber\]\[ColumnNumber\]%**

For example, to access the A2 cell of an Excel file, use the expression displayed below. Keep in mind that the **RowNumber** and the **ColumnNumber** should be 0 for the first item (row or column).

![An epxression to access the first row's second cell of a read Excel file.](media\data-tables\data-table-row-item.png)

If you want to access a specific column in a datable that contains column headers, use the **%ExcelData[rowNumber]['ColumnName']** notation.

If you loop through a datatable with a **For Each** action, the variable that will contain the current iteration’s data is considered to be a data row. 

## Know issues and limitations

- **Issue**: The values for datarow and datatable variables are not displayed properly in the variables pane.
- **Workarounds**: None.

