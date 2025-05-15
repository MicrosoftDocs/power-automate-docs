---
title: Troubleshoot known issues with Microsoft Dataverse | Microsoft Docs
description: See a list of known issues and limitations and possible workarounds for Dataverse.  
services: ''
suite: flow
documentationcenter: na
author: v-aangie
ms.author: Matow
ms.reviewer: angieandrews
editor: ''
tags: ''

ms.topic: troubleshooting-known-issue
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 10/07/2021
search.audienceType: 
  - maker
---

# Troubleshoot known issues with Dataverse

Here's a list of known issues with Microsoft Dataverse and Microsoft Power Automate.

- **Localization of metadata** – When you change the Power Automate language and regional locale settings, there's no change to metadata like table and column names. There is no change in the metadata because they display in the language and regional locale settings of your Microsoft Dataverse environment. See [Languages](/powerapps/user/set-personal-options#languages-tab-options) to view your Dataverse settings.

- **Working with lookup fields** – When working with the [Add a new row](./create.md) and [Update a row](./update.md) actions, you must enter lookup fields in the following syntax – **entity_unique_name(Item_ID)**.

- **Working with multi-select fields** – When working with the [[Add a new row](./create.md) and [Update a row](./update.md) actions, the user interface allows you to select only one option. To select multiple options, you must switch the input method to **custom**, and then enter a unique name for each option, separating each name with a comma.

- **Adding a row with attachments to the Notes table**– When you use an attachment from the dynamic output of a non-Dataverse step, you must use an expression to convert it to a string. For example, when you add a row inside an **Apply to each** loop over the output from the **When a new email arrives** trigger, use *string(triggerOutputs()?['body/attachments'])* instead of *items('Apply_to_each')?['contentBytes']*, as shown in the following image.

   ![Screenshot that shows a string expression being used.](../media/known-issues-dataverse/string-expression.png)

- **SharePoint and OneDrive document tables don't display inputs when you create a flow** - When you create a flow that triggers on the Dataverse SharePoint documents table or the OneDrive documents table, no data from these tables is passed to the editor and the flow inputs array is empty. This behavior occurs because these tables are virtual and their data isn't stored in Dataverse.
