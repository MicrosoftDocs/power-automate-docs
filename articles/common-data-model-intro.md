---
title: Microsoft Dataverse
description: Learn how to create a cloud flow from a template that uses Microsoft Dataverse.
services: ''
suite: flow
documentationcenter: na
author: radioblazer
contributors:
  - radioblazer
  - v-aangie
ms.devlang: na
ms.subservice: cloud-flow
ms.topic: conceptual
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 01/31/2023
ms.author: Matow
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
ms.reviewer: angieandrews
---
# Create a cloud flow that uses Microsoft Dataverse

Improve operational efficiency with a unified view of business data by creating flows that use [Dataverse](https://powerapps.microsoft.com/tutorials/data-platform-intro/).

For example, you can use Dataverse within Power Automate in these key ways:

* Create a cloud flow to import data, export data, or take action (such as sending a notification) when data  changes. For detailed steps, see the procedures later in this topic.
* Instead of [creating an approval loop through email](wait-for-approvals.md), create a cloud flow that stores approval state in a table, and then build a custom app in which users can approve or reject items. For detailed steps, see [Build an approval loop with Dataverse](common-data-model-approve.md).

In this article, you will create a cloud flow that sends an email notification when a *Qualified Lead Process* creates a new *Opportunity* in Dataverse. The notification includes the *Notes* from the *Lead*.

## Prerequisites

- Sign up for [Power Automate](https://flow.microsoft.com) and [Power Apps](https://make.powerapps.com).
  
    If you have trouble, verify whether [Power Automate](sign-up-sign-in.md) and [Power Apps](https://powerapps.microsoft.com/tutorials/signup-for-powerapps/) supports the type of account that you have and your organization hasn't blocked signup.

- If you haven't used Dataverse before, create a [Dataverse environment with a database](/power-platform/admin/create-environment#create-an-environment-with-a-database) in the Power Platform admin center.

## Sign in to your environment

1. Sign into [Power Automate](https://make.powerautomate.com).

1. In the top right menu, select the environment where you created the Dataverse table. 

    >[!IMPORTANT]
    >If you don't select the same environment, you won't see your Dataverse tables.

## Use a template

You could use any template that performs a task in Dataverse that you want to automate. In this example, you'll use the **Copy Notes from Lead to Opportunity in Dataverse** template.

1. On the home page, select **Create** > **Start with a template**,

1. In the **Search by keywords** field, start typing **copy notes from lead to opportunity**.

1. When you see the **Copy Notes from Lead to Opportunity in Microsoft Dataverse** template in the **Templates based on your selections** list, select it.

    :::image type="content" source="./media/common-data-model-intro/select-template.png" alt-text="Screenshot of the 'Copy Notes from Lead to Opportunity in Microsoft Dataverse' template.":::

1. If you haven't already created a connection, select **Sign in**, and then provide your credentials as needed.

1. Select **Next**.

   You'll now see the template and its connections. In the following steps, you will customize this template.

## Customize your flow template

1. On the **When an Opportunity is created** card, select the **Environment**, **Table Name**, and **Scope** that you want to use.
   
   For more information on scope, go to [Trigger flows&mdash;scope](./dataverse/create-update-delete-trigger.md#scope).

    :::image type="content" source="./media/common-data-model-intro/specify-instance.png" alt-text="Screenshot of the details for 'When an Opportunity is Created'.":::

1. Complete the **Get Opportunity Record** card, per your requirements.

    :::image type="content" source="./media/common-data-model-intro/get-opportunity-record.png" alt-text="Screenshot of the 'Get Opportunity Record'.":::

1. In the **Did it originate from a Lead** card, select **Expand condition** and configure the card.

    :::image type="content" source="./media/common-data-model-intro/originate-from-lead.png" alt-text="Screenshot of the 'Did it originate from a Lead' card.":::

1. On the **If yes** side of the decision branch, complete the **Get Lead** and the **List Notes for the Lead** cards.

    :::image type="content" source="./media/common-data-model-intro/get-lead-list-notes.png" alt-text="Screenshot of the decision branch.":::

1. In the **Apply to each** card, delete the **Copy Lead Note to New Note** card.

1. Select **Add an action**, select **Notifications**, and then select **Send me an email notification**.

    If you don't see the **Notifications** icon, type **notifications** in the search bar.

1. Configure the notification card to send you an email notification with the details of the notes for the lead.

   ![The notification card.](./media/common-data-model-intro/notification-card.png)

>[!TIP]
>If you can't find a template that does what you need, you can [build a cloud flow from scratch](get-started-logic-flow.md) that operates on top of Dataverse.

[!INCLUDE[footer-include](includes/footer-banner.md)]