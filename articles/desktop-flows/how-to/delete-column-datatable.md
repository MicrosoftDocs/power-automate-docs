---
title: Delete columns from a datatable
description: Delete columns from a datatable
author: mattp123
ms.subservice: desktop-flow
ms.topic: how-to
ms.date: 07/13/2021
ms.author: matp
ms.reviewer: matp
contributors:
- Yiannismavridis
- NikosMoutzourakis
- PetrosFeleskouras
search.audienceType: 
  - flowmaker
  - enduser
---

# Delete columns from a datatable

Although Power Automate doesn't provide a direct way to delete columns from datatables, this functionality is feasible with the following workaround:

1. Use the **Launch Excel** action to launch a new blank Excel worksheet.

    ![Screenshot of the Launch Excel action.](media/delete-column-datatable/launch-excel-action.png)

1. Deploy the **Write to Excel worksheet** action and configure it to write the datatable to the previously launched worksheet.

    ![Screenshot of the Write to Excel worksheet action.](media/delete-column-datatable/write-excel-worksheet-action.png)

1. Use the **Delete column from Excel worksheet** action to delete the wanted column of the datatable.

    ![Screenshot of the Delete row from Excel worksheet action.](media/delete-column-datatable/delete-column-excel-worksheet-action.png)

1. Deploy the **Read from Excel worksheet** action and read all the available values from the Excel worksheet. The updated datatable is now stored in a variable named **ExcelData**.

    ![Screenshot of the Read from Excel worksheet action.](media/delete-column-datatable/read-excel-worksheet-action.png)

1. Close the Excel worksheet without saving using the **Close Excel** action.

    ![Screenshot of the Close Excel action.](media/delete-column-datatable/close-excel-action.png)
