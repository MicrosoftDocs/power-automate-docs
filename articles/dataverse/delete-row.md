---
title: Use a flow to delete a row from Dataverse | Microsoft Docs
description: "Learn how to use flows to delete rows in Microsoft Dataverse."
services: ''
suite: flow
documentationcenter: na
author: radioblazer
ms.author: Matow
ms.reviewer: angieandrews
editor: ''
tags: ''

ms.topic: how-to
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 03/06/2021
search.audienceType: 
  - maker
---


# Use a flow to delete a row from Dataverse

Follow these steps to delete a row from Dataverse.

1. Create a flow with the **When a new email arrives (V3)** trigger to your flow.

1. Select **New step** to add an action to your flow.

1. Enter **delete row** into the **Search connectors and actions** search box on the **Choose an operation** card.

1. Select **Microsoft Dataverse**.

   ![Filter to delete row actions.](../media/dataverse-how-tos/delete-row-action.png "Filter to delete row actions")

1. Select **Delete a new row** action.

   ![Delete a row card.](../media/dataverse-how-tos/delete-row-card.png "Delete a row card")

1. Select the table name, and then enter an ID in **Row ID**.

   ![Set the table name and row ID.](../media/dataverse-how-tos/delete-row-card-complete.png "Set the table name and row ID")

   The **Row ID** column is the unique ID of the row that you are deleting.

>[!TIP]
>You can retrieve the **Row ID** by using the dynamic content that's generated from earlier steps in your flow.
