---
title: Extract data from a Word table
description: Learn how to extract data from tables in Word documents by converting them to PDF format and using PDF extraction actions in Power Automate for desktop.
author: mattp123

ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: how-to
ms.date: 11/26/2025
ms.author: iomimtso
contributors:
- iomimtso
search.audienceType: 
  - flowmaker
  - enduser
---

# Extract data from a Word table

The **Get details of a UI element in window** action can't retrieve the value of the **Own text** attribute from UI elements in Word tables. This limitation occurs because these elements don't have the **Own text** attribute available.

To work around this limitation, convert the Word document to PDF format and use the **Extract tables from PDF** action. This action extracts the table data into a datatable variable that you can manipulate to retrieve the values you need.
