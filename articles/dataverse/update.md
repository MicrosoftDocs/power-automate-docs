---
title: Use a flow to update a row in Dataverse | Microsoft Docs
description: "Learn how to update rows in Microsoft Dataverse with flows."
services: ''
suite: flow
documentationcenter: na
author: kewaiss
ms.author: matow
ms.reviewer: angieandrews
editor: ''
tags: ''

ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 08/18/2025
search.audienceType: 
  - maker
---


# Use a flow to update a row

Use the **Update a row** action to make changes to a row in Microsoft Dataverse.

![Image that displays the Update a row action.](../media/update-row/update-row-action.png)

For example, you can create a flow that updates an **Account** in Dataverse when you receive an email, as shown in the following image.

![Image that shows a flow that updates a row when an email arrives.](../media/update-row/update-row-new-email.png)

## Update a row

After you select a table, the action card displays a list of inputs for the row ID that's related to the columns in the table to update. An asterisk (\*) marks the mandatory columns. The **Row ID** column is the unique ID for the row that's being updated. If you provide a row ID that doesn't exist or generate one with the **guid()** expression, the action performs an update or insert (upsert) operation, creating a new row with the ID you provide.

If you don't see a column, select **Show advanced options** at the bottom of the card. The update skips columns you leave blank, unless a null value is provided explicitly.

## Advanced options

### Return Full Metadata

This setting controls whether to load all columns from the table or just the essential ones for better performance. If you don't set it, the flow automatically returns full metadata if it uses dynamic content or expressions that need it.
