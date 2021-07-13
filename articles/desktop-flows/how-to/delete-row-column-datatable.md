---
title: Delete a row/column from a datatable | Microsoft Docs
description: Delete a row/column from a datatable
author: georgiostrantzas
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: article
ms.date: 07/13/2021
ms.author: getrantz
ms.reviewer:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Delete a row/column from a datatable

Although Power Automate Desktop doesn't provide a direct way to delete rows and columns from datatables, this functionality is feasible with the following workaround:

1. Use the **Launch Excel** action to launch a new blank Excel worksheet.

    ![The Launch Excel action.](media/delete-row-column-datatable/launch-excel-action.png)

1. Deploy the **Write to Excel worksheet** action and configure it to write the datatable to the previously launched worksheet.

    ![The Write to Excel worksheet action.](media/delete-row-column-datatable/write-excel-worksheet-action.png)

1. Use the **Delete row from Excel worksheet** or the **Delete column from Excel worksheet** action to delete the wanted row or column of the datatable, respectively.

    ![The Delete row from Excel worksheet action.](media/delete-row-column-datatable/delete-row-excel-worksheet-action.png)

1. Use the **Get first free column/row from Excel worksheet** action to retrieve the worksheet's first free row and column.

    ![The Get first free column/row from Excel worksheet action.](media/delete-row-column-datatable/get-first-free-column-row-excel-worksheet-action.png)

1. Deploy the **Read from Excel worksheet** and read all the data from the Excel worksheet. To find the last populated row and column, use the produced variables of the **Get first free column/row from Excel worksheet** action. The updated datatable is now stored in a variable named **ExcelData**.

    ![The Read from Excel worksheet action.](media/delete-row-column-datatable/read-excel-worksheet-action.png)

1. Close the Excel worksheet without saving using the **Close Excel** action.

    ![The Close Excel action.](media/delete-row-column-datatable/close-excel-action.png)