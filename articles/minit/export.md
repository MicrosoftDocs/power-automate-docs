---
title: Export
description: Learn how to export process data to an external file in the Power Automate Process Mining desktop app.
author: maslejka
contributors:
  - maslejka
  - v-aangie
ms.subservice: process-advisor
ms.topic: conceptual
ms.date: 11/15/2022
ms.author: mmaslejova
ms.reviewer: angieandrews
search.app:
- Flow
search.audienceType:
- flowmaker
- enduser
---

# Export

Here you can export process data to an external file. After filling in all required data, press the Export button.

:::image type="content" alt-text="Screenshot of Export screen." source="media/Export.png":::

### Apply filters

This setting specifies if preset filters should be applied to the process before export. If the filters are not applied, all records in the process will be exported.

### Export type

You can select the type of export. The export of events is one of the export types in which the entire process log is exported. Another type is the export of cases in which selected information about cases without respective individual events are exported.

### Export as

You can export the data to share specific findings in the process, for example when filtering is applied. Data can be imported again by another user who has the resource file (export).  

Select a format for the data to export. At present, the following formats are supported:

- Export of events&mdash;CSV (comma separated records)

- XES (Extensible Event Stream)

- MXML (Mining eXtensible Markup Language)

### Export as a ZIP

The exported file can be compressed into ZIP format. Then select the type of compression – optimal, fast, or without compression.

### Delimiter

When exporting to the CSV format, a record separator must be specified.

### Statistics for export of cases

In the cases export you can select which metrics and attributes will be exported with individual cases. The attributes exported with the case must be imported as the case-level attributes.


