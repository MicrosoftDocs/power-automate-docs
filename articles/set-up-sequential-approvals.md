---
title: Set up sequential approvals
description: Learn how to set up sequential approvals using an example of getting a vacation request approved.
author: donums
contributors:
  - donums
  - v-aangie  
ms.service: power-automate
ms.subservice: process-advisor
ms.topic: how-to
ms.date: 06/19/2025
ms.author: derahonuorah
ms.reviewer: angieandrews
---

# Set up sequential approvals

Some workflows require pre-approval before the final approver can sign off. For example, a company might have a sequential approval policy that requires pre-approval for invoices over $1,000.00 before the Finance department can approve them.

In this example, you set up a sequential approval for vacation requests. The requestor’s manager and the manager of the requestor’s manager must approve the vacation requests.

## Create your flow

Create a flow that triggers when a new response is submitted to a form.

1. Sign in to [Power Automate](https://make.powerautomate.com).
1. On the navigation pane to the left, select **My flows**.
1. On the menu at the top, select **New flow** > **Automated cloud flow**.
1. Give your flow a name.
1. Under **Choose your flow's trigger**, select **When a new response is submitted**, and then select **Create**.
1. Select the **When a new response is submitted** card to open the action configuration pane, and then select the **Form Id** of a form you previously created.
1. Insert a step and then select the **Get response details** action.
1. In the same action, place the same **Form Id** from the previous action.
1. In the **Response Id** field, select the response ID from the previous **Get response details** action.

## Get the manager for the person who created the vacation request

After you create the flow, you need to get the manager for the person who created the vacation request.

> [!NOTE]
> It's a good idea to periodically save changes to your flow while you work.

1. Select **New step**.
1. In the **Choose an action** search field, type **get manager**.
1. Find and select the **Get manager (V2) - Office 365 Users** action.
1. Select the **Get manager (V2)** card to open the action configuration pane, and then insert the **Responder’s Email** token into the **User (UPN)** field.
1. Rename the action to **Get level 1 manager**.

## Get the manager of the requestor’s manager

After you get the manager for the person who created the vacation request, you need to get the manager of the requestor’s manager.

1. Select **New step**.
1. In the **Choose an action** search field, type **get manager**.
1. Find and select the **Get manager (V2) - Office 365 Users** action.
1. From the **Get level 1 manager** action, insert the **Id** token into the **User (UPN)** field on the **Get manager** card.
1. Rename the action to **Get level 2 manager**.

## Add an approval action for pre-approvals

1. Select **New step**.
1. In the **Choose an action** search field, type **approval**.
1. Select the **Start and wait for an approval** action.
1. Select the **Sequential Approval** type.
1. Give the approval a title.

    In this example, you add two (2) steps.

1. In **Assigned To – 1**, enter the **Mail** token from the **Get level 1 manager** approval action.
1. To add an approval step, select **Add new item**.
1. Configure the **Start and wait for an approval** card to suit your needs.

    :::image type="content" source="media/set-up-sequential-approvals/add-approval-action.png" alt-text="Screenshot of setting up parameters for sequential pre-approvals.":::

Now, when the flow runs, it first goes to the level 1 manager. If that person approves it, then it goes to the level 2 manager for approval.

You can rename actions as you wish. You can also add other actions and subsequent actions after the approval, such as an email that sends the approval decision to the requestor. The following screenshot shows what your flow might look like with renamed actions and an email action at the end.

:::image type="content" source="media/set-up-sequential-approvals/renamed-actions.png" alt-text="Screenshot of a flow with renamed actions and an email action at the end.":::

## Limitation

1. You can't assign the same approver to different steps of your approval.
