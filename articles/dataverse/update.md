---
title: Use a flow to update a row in Dataverse | Microsoft Docs
description: Learn how how update rows in Microsoft Dataverse with flows.  
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


# Use a flow to update a row

Use the **Update a row** action to make changes record in Microsoft Dataverse.

![Image that displays the Update a row action](../media/update-row/5a6de73bf02a1882c9948e96ca114f45.png)

For example, you can create a flow that updates an **Account** in Dataverse when you receive an email, as shown in the following image.

![Image that shows a flow that updates a record when an email arrives.](../media/update-row/bdf36001f983ce1283432f963610c016.png)

After you select an table, new fields appear. Use these fields to set values for other fields. All mandatory fields display an asterisk (\*). It's not necessary to enter a value for optional fields. Fields that are left blank are skipped in the update unless you provide a null value explicitly.

The **Item ID** field is the unique ID of the record that you are updating, as shown in the following image. If you do not see an attribute, you can select **Show advanced options** at the bottom of the card.

![Expanded update a row card](../media/update-row/8c09cb32dd9852a0c149d3651c179f01.png)