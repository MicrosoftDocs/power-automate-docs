---
title: Export process data
description: Learn how to export process data to an external file in Power Automate Process Mining.
author: rosikm
contributors:
  - rosikm
  - v-aangie
ms.service: power-automate
ms.subservice: process-advisor
ms.topic: conceptual
ms.date: 07/18/2023
ms.author: michalrosik
ms.reviewer: angieandrews
search.audienceType:
- flowmaker
- enduser
---

# Export process data

Export process data to an external file. After you choose your export type, you can choose to export data as a CSV, XES, or an MXML file. You can also choose to export as a zip file, and enter the delimiter to use. If you choose to export cases (as opposed to events), you'll see a list of statistics you can choose to export.

## Choose export options

1. On the left menu in the open view, select **Export**.

1. In the **Export as** dropdown menu, select **Events** or **Cases**.

1. If you select **Cases**, also de-select the statistics you don't want to include in your export in the **Statistics to export** list.

1. If you want to export as a zip file, place a check in the **Export as ZIP** checkbox.

1. If you want to use a delimiter other than the default comma, enter it in the **Delimiter** field.

1. Select **Export**.

    :::image type="content" alt-text="Screenshot of the Export screen." source="media/export-screen.png":::

## Export option details

The options in the following table are available for your export file.

| Option             | Description      |
|--------------------|------------------|
| Apply filters      | Specify if set filters in the currently open view should be applied to the process before export. If the filters aren't applied, all records in the process will be   exported.    |
| Export type        | Select either **Cases** or **Events**. When you export events, the entire process log is exported. When you export cases, the selected information about cases without respective individual   events is exported.   |
| Export as          | Share specific findings in the process, for example when filtering is   applied. Data can be imported again by another user who has the resource file  (export). The following formats are supported: **CSV** (comma separated records), **XES** (Extensible Event Stream), and **MXML** (Mining eXtensible Markup Language). |
| Export as ZIP    | Compress the exported file into ZIP format. If you select this, select the type of compression  to use. Choose from among **Optimal**, **Fastest**, or **No compression**.     |
| Delimiter          | Enter a record separator When exporting to the CSV format.     |
| (For exporting cases) Statistics to export | Select which metrics and attributes will be exported with individual cases. The attributes exported with the case must be imported as the case-level attributes.      |

