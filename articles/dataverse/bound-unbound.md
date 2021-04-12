---
title: Use a flow to perform bound and unbound actions in Dataverse | Microsoft Docs
description: Learn how to use flows to perform bound and unbound actions in Dataverse.  
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

# Perform bound action or unbound actions

>[!IMPORTANT]
>In this acticle, the term "action" means a [Dataverse action](https://docs.microsoft.com/dynamics365/customer-engagement/web-api/actions?view=dynamics-ce-odata-9&preserve-view=true). Dataverse actions are not the same as Power Automate actions. In Dataverse, you use actions to extend out of the box operations on data. You can use these actions to define reusable custom business logic.



Flows can call [Dataverse actions](https://docs.microsoft.com/dynamics365/customer-engagement/web-api/actions?view=dynamics-ce-odata-9&preserve-view=true) that are available in the Microsoft Dataverse connector. These actions include everything from fulfilling a sales order to exporting a solution. 

Actions represent operations that might have side effects in the database, such as creating or updating rows. 

There are two types of Dataverse actions you can use in flows.

- [Bound actions](#bound-action).
- [Unbound actions](#unbound-action).

## Bound action

Bound actions target a single table or a set of rows from a single table.

To perform a bound action, add the **Perform a bound action** action to your flow.

Follow these steps in edit more of your flow to perform a bound action.

1. After any step in your flow, select **Add new step**.
1. Enter **bound** into the search box, select **Dataverse** from the list of connectors, and then select **Perform bound action**

   ![Bound action](../media/dataverse-how-tos/bound-1.png)

1. Select the **Table name** for the table you want to use.
1. Select the **Action name** for the action you'll perform.
1. Enter the **Row ID** for the row in the table on which you want to perform the bound action.

   ![Bound action card completed](../media/dataverse-how-tos/bound-complete.png)

1. Save, and then run your flow.
1. Confirm the bound action completes successfully on the table that you selected.

## Unbound action

Unbound actions aren’t bound to a table and are called as static operations. Unbound actions are performed on the entire environment, not on specific tables or rows.

To perform a bound action in your flow, you must add **Perform an unbound action** to your flow.

Follow these steps in edit more of your flow to perform an unbound action.

1. After any step in your flow, select **Add new step**.
1. Enter **unbound** into the search box, select **Dataverse** from the list of connectors, and then select **Perform unbound action**

   ![Unbound action](../media/dataverse-how-tos/bound-2.png)
   
1. Select an **Action name**.

   ![Action name](../media/dataverse-how-tos/bound-3.png)

1. Enter or select any of the optional details on the **Perform an unbound action** card.

1. Save, and then run your flow.
1. Confirm the unbound action completes successfully.








