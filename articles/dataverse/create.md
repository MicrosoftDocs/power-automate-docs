---
title: Use a flow to add a row in Dataverse | Microsoft Docs
description: Learn how to add rows in Microsoft Dataverse with flows. 
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

# Use a flow to add a row in Dataverse

Use the **Add a new row** action to add a new record in Microsoft Dataverse.

![Add a new row image](../media/create-row/42343b95404d44f600cd69059f9b1dc1.png)

For example, you can set up a flow to add a new **Account** in Dataverse when you receive an email to your signup address, as shown in the following image.

![A flow that adds a new row when an email arrives](../media/create-row/9e8d26806c2cf115d0261238fc53e874.png)

After you select a table, new fields appear. Use these fields to set values for other fields. All mandatory fields display an asterisk (\*). It's not necessary to enter a value for optional fields.

If you do not see a column, you can select **Show advanced options** at the bottom of the card to view all columns.

![Cards that shows all columns for the add a new row action](../media/create-row/1cbaa257cf19b641bc183652cd7731c8.png)

You can use outputs directly from previous triggers and actions in the **Dynamic content** selector shown in the following image, or modify them by building an **Expression** as outlined in [Use expressions in flow actions](https://flow.microsoft.com/en-us/blog/use-expressions-in-actions/).

![Dynamic content](../media/create-row/ce98d6e7a86d68dc7d68d16b503c5f38.png)




