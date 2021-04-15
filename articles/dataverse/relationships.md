---
title: Use relationships to modify rows | Microsoft Docs
description: Use Dataverse relationships to modify rows.
services: ''
suite: flow
documentationcenter: na
author: MSFTMan
manager: KVivek
editor: ''
tags: ''
ms.service: flow
ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/13/2021
ms.author: Deonhe
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Use relationships to modify rows

Relationships are an important concept in the Microsoft Dataverse. Power Automate allows you to work with these relationships in a few ways.

## Modify or add rows directly with relationships**

When you create or modify rows, there are columns that hold relationships. For example, when you create an **Account** there is a **Primary Contact** column.

![Primary contact column](../media/relationships/primary-contact.png)

When you want to create or modify a relationship, use standard OData notation. For example, while creating an account row, you should set the primary contact column to the OData id of a contact row like this: contacts(c96be312-4ac1-4358-99b6-1e14e2957b15).

>[!IMPORTANT]
>If you try to pass only the GUID from previous step, you’ll get an error like this: *Resource not found for the segment \<segmentname\>*. The Microsoft Dataverse connector expects the full OData ID of the target row, including the type of the row.

If the lookup column is polymorphic (meaning it can have more than one possible target types), then the target row OData ID must be provided in the correct column. For example, the **Company name** column for **Contacts** is polymorphic and can take either an **Account** or **Contact**, but not both.

![Polymorphic column notation](../media/relationships/polymorphic-column.png)

## Activity party relationships

[Activity parties](https://docs.microsoft.com/dynamics365/customer-engagement/web-api/activityparty) are
a special type of relationship in Dataverse. For example, when you create an **Appointment**, the **Required Attendees** and **Optional Attendees** are related to the **System Users** table.

![Activity party](../media/relationships/activity.png)

Select **Add new items** and then enter the required data to add multiple values for an activity party. As shown earlier in the article, you must use the OData ID syntax for systemusers(\<ID of the user\>).

You can also pass in a list of different activity parties by toggling from the item mode to the array mode by using the “T” button at the top-right. When you do that, you can use expressions to pass in data from a previous action, as shown in the following array.

![Array mode activity party](../media/relationships/array-mode.png)