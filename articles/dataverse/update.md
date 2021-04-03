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


# Update a row

Using this action, you can update an existing record in Common Data Service.

![Background pattern Description automatically generated with low confidence](../media/update-row/5a6de73bf02a1882c9948e96ca114f45.png)

For example, you can set up a flow to update an existing Account in Common Data
Service when you receive an email, as shown below.

![Graphical user interface, text, application, email Description automatically generated](../media/update-row/bdf36001f983ce1283432f963610c016.png)

After selecting an entity, new fields appear that allow you to set values for
specific fields. Mandatory fields are indicated with an asterisk (\*), and it is
not necessary to enter a value for optional fields. Fields that are left blank
would be skipped in the update unless a null value is explicitly provided.

The **Item ID** field is the unique ID of the record that you are updating, as
shown below. If you do not see an attribute, you can click on **Show advanced
options** at the bottom of the card.

![Graphical user interface, application Description automatically generated](../media/update-row/8c09cb32dd9852a0c149d3651c179f01.png)