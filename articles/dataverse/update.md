---
title: Use a flow to update a row in Dataverse | Microsoft Docs
description: "Learn how to update rows in Microsoft Dataverse with flows."
services: ''
suite: flow
documentationcenter: na
author: MSFTMAN
manager: KVIVEK
ms.author: Deonhe
editor: ''
tags: ''

ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/13/2021
search.app: 
  - Flow
  - Powerplatform
search.audienceType: 
  - maker
---


# Use a flow to update a row

Use the **Update a row** action to make changes to a row in Microsoft Dataverse.

![Image that displays the Update a row action.](../media/update-row/update-row-action.png)

For example, you can create a flow that updates an **Account** in Dataverse when you receive an email, as shown in the following image.

![Image that shows a flow that updates a row when an email arrives.](../media/update-row/update-row-new-email.png)

## Update a row 

After selecting a table, the action card will display a list of inputs for the Row ID and related columns of the table to update, columns, with mandatory columns marked as required with an asterisk (\*). The **Row ID** column is the unique ID of the row that will be updated; if a row ID is provided that does not exist, or generated with the **guid()** expression, the action wili perform an update-or-insert (upsert) operation and will create a new row with the specified ID. 

If you do not see a column, you can select **Show advanced options** at the bottom of the card. Columns that are left blank are skipped in the update unless you provide a null value explicitly.