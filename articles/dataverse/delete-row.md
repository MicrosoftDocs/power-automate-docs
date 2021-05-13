---
title: Use a flow to delete a row from Dataverse | Microsoft Docs
description: Learn how to delete rows in Microsoft Dataverse with flows.  
services: ''
suite: flow
documentationcenter: na
author: MSFTMAN
manager: KVIVEK
ms.author: Deonhe
editor: ''
tags: ''
ms.service: power-automate
ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 03/06/2021
search.app: 
  - Flow
  - Powerplatform
search.audienceType: 
  - maker
---


# Use a flow to delete a row from Dataverse

Follow these steps to delete a row from Dataverse.

1. Create a flow with the **When a new email arrives (V3)** trigger to your flow.
1. Select **New step** to add an action to your flow.
1. Enter **delete row** into the **Search connectors and actions** search box on the **Choose an operation** card.
1. Select **Microsoft Dataverse**.

   ![Delete a row action](../media/dataverse-how-tos/delete-row-action.png)

1. Select **Delete a new row** action.

   ![Delete a row card](../media/dataverse-how-tos/delete-row-card.png)

1. Select the table name, and then enter an **Item ID**. 

   ![Item id and table name](../media/dataverse-how-tos/delete-row-card-complete.png)

   The **Item ID** column is the unique ID of the row that you are deleting.

>[!TIP]
>You can retrieve the **Item Id** via the dynamic content that's generated from earlier steps in your flow.


