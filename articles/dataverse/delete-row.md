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

1. Add the **Delete a row** action to your flow.

   ![Delete a row action](../media/dataverse-how-tos/be211fa059451c9cede0f1889a1b1800.png)

2. Select the table name, and then enter an **Item ID**. 

   The **Item ID** column is the unique ID of the row that you are deleting, as shown in the following image.

   ![Item id and table name](../media/dataverse-how-tos/83794a709e31039ffb760dede35eabdb.png)

>[!TIP]
>You can retrieve the **Item Id** via the dynamic content that's generated from earlier steps in your flow.


