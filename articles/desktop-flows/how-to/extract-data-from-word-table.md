---
title: Extract data from a Word table
description: Learn how to extract table data in Word documents by converting them to PDF format and using PDF extraction actions in Power Automate for desktop.
author: iomimtso
reviewer: EllenWehrle
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: how-to
ms.date: 01/05/2026
ms.author: iomimtso
ms.reviewer: ellenwehrle
contributors:
- iomimtso
search.audienceType: 
  - flowmaker
  - enduser
---

# Extract data from a Word table

You might want to extract table data from a Microsoft Word document. However, the **Get details of a UI element in window** action can't retrieve the value of the **Own text** attribute from UI elements in Word tables. This limitation occurs because these elements don't have the **Own text** attribute available.

## Extract tables from PDF action

To extract table data from a Word document, follow these steps:

1. [Convert the Word document to a PDF](https://support.microsoft.com/office/export-word-document-as-pdf-4e89b30d-9d7d-4866-af77-3af5536b974c) (Portable Document Format).
1. Use the [Extract tables from PDF action](../actions-reference/pdf.md) to extract the table data into a datatable variable that you can manipulate to retrieve the values you need.

