---
title: Convert a CSV file into an Excel spreadsheet | Microsoft Docs
description: Convert a CSV file into an Excel spreadsheet
author: georgiostrantzas
ms.service: power-automate
ms.topic: article
ms.date: 06/08/2021
ms.author: getrantz
ms.reviewer:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Convert a CSV file into an Excel spreadsheet

Power Automate Desktop enables you to open comma-delimited and tab-delimited CSV files using the **Launch Excel** action.

To convert a CSV file of this type to XLSX, open the file and then save it as a new Excel workbook using the **Save document as** option in the **Close Excel** action.

![The Save document as option in the Close Excel action.](media/convert-csv-excel/close-excel-action.png)

On the other side, the **Launch Excel** action doesn't support semicolon-delimited CSV files, as Excel doesn't recognize semicolon as a valid delimiter.

To overcome this limitation, deploy the **Read from CSV file** action and set the semicolon character (**;**) as a custom separator in the advanced options.

![The custom separator option in the Read from CSV file action.](media/convert-csv-excel/read-csv-file-action.png)

Next, launch a blank Excel document using the **Launch Excel** action and paste the CSV table into cell A1 using the **Write to Excel worksheet** action.

![The populated *Write to Excel worksheet action.](media/convert-csv-excel/write-excel-worksheet-action.png)