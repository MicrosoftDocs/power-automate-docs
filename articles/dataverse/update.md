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
ms.date: 07/11/2021
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

After you select a table, the action card displays a list of inputs for the row id that's related to the columns of the table to update. Mandatory columns are marked as required with an asterisk (\*). The **Row ID** column is the unique Id of the row that will be updated. If you provide a row Id that doesn't exist or generated with the **guid()** expression, the action will perform an update or insert (upsert) operation and will create a new row with the Id you provide. 

If you don't see a column, select **Show advanced options** at the bottom of the card. The update skips blank columns in the update unless you provide a null value explicitly.
