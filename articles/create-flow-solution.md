---
title: Create a cloud flow in a solution
description: Learn how to create solution-aware cloud flows.
services: ''
suite: flow
documentationcenter: na
author: ChrisGarty
contributors:
  - ChrisGarty
  - v-aangie
editor: ''
tags: ''
ms.subservice: cloud-flow
ms.topic: conceptual
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 02/06/2023
ms.author: cgarty
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
---

# Create a cloud flow in a solution

Cloud flows you create in a solution are known as *solution-aware cloud flows* or *solution cloud flows*. Follow these steps to create a solution-aware cloud flow.

## Prerequisites

You need to have at least one solution before you can create a solution-aware flow.

## Create a solution-aware cloud flow

1. Sign into [Power Automate](https://make.powerautomate.com).

1. On the menu to the left, select **Solutions**.

   :::image type="content" alt-text="Screenshot of the left navigation bar with the Solutions option highlighted." source="./media/create-flow-solution/select-solutions-from-left-nav.png":::

1. Select the solution in which you'll create your flow.

1. Select **New** > **Automation** > **Cloud flow** > **Automated**.

   :::image type="content" alt-text="Screenshot of the different types of items that can be created with flow highlighted." source="./media/create-flow-solution/select-new-flow.png":::

   >[!TIP]
   >If an automated cloud flow doesn't meet your requirements, you can create any other [type of flow](./flow-types.md).

   Power Automate opens.

1. Use the available connectors and triggers to build your flow.

   In this example, we'll build a flow that sends a notification when an email arrives in your inbox.

1. Give your flow a name.

1. Search for, **new email** in the **Search all triggers** box.

   :::image type="content" alt-text="Screenshot of the name of the flow and the search box with a search term entered." source="./media/create-flow-solution/search-trigger.png":::

1. Select the **When a new email arrives (V3)** trigger.

1. Select **Create**.

1. Select **New step**.

1. Search for **Notification**, and then select the **Send me a mobile notification** action.

   :::image type="content" alt-text="Screenshot of the new notification action selected." source="./media/create-flow-solution/new-notification.png":::

1. Add the **Subject** dynamic token to the **Text** field of the **Send me a mobile notification** card.

1. Select **Save** to save your flow.

   Your flow should look like the following screenshot.

   :::image type="content" alt-text="Screenshot of the flow that's created." source="./media/create-flow-solution/new-email-notification-flow.png":::

1. Select **Solutions** to see your flow in the solution.

   :::image type="content" alt-text="Screenshot of your flow inside the solution." source="./media/create-flow-solution/new-flow-inside-solution.png":::

## Find a solution-aware cloud flow

Solution-aware cloud flows can be found either in the **My flows** lists or in **Solutions** on the left navigation pane.

### Find a solution-aware cloud flow with 'My flows'

1. Sign in to [Power Automate](https://make.powerautomate.com).

1. On the left navigation pane, select **My flows**.

1. Find the flow that you want to edit.

   >[!TIP]
   >Cloud flows you own are on the **Cloud flows** tab and flows for which you're a co-owner are on the **Shared with me** tab.

    The **Shared with me** tab shows the following solution cloud flows.

    - Flows you co-own.

    - Flows that are owned by a Dataverse team in which you're a member.

    - Flows that are co-owned by a Dataverse team in which you're a member

If you're the owner of a solution cloud flow, you can always find it on the **Cloud flows** tab. If you have the 'run only' permission to a flow, you'll only see that flow on the **My flows** tab if you're an owner or a co-owner too.

### Find a solution-aware cloud flow via Solutions

1. Sign in to [Power Automate](https://make.powerautomate.com).

1. On the menu to the left, select **Solutions**.

1. Select the solution that contains the flow you want to edit.

## Find a solution that contains a solution-aware cloud flow

Solution-aware cloud flows have a **Solutions** card in the flow details page that provides a list of the solutions that reference that cloud flow. To open the solution, select the solution name.

The **Objects** tab of a solution shows all the solution objects in the solution, such as connection references, environment variables, or child flows that the flow might reference. The **Overview** tab shows the details of the solution, such as the description and status, and provides access to solution actions, such as [export](./export-flow-solution.md).

## Add an existing cloud flow into a solution

1. Sign in to [Power Automate](https://make.powerautomate.com).

1. On the menu to the left, select **Solutions**.

1. Select the solution that you want to add a cloud flow into.

1. Select **Add existing** > **Automation** > **Cloud flow**.

    Solution-aware cloud flows will be in the **From Dataverse** tab and non-solution cloud flows will be in the **Outside Dataverse** tab.

1. Select the desired cloud flow. 

    Some non-solution cloud flows can't be added into a solution. To learn more, go to [known limitations](/power-apps/maker/data-platform/solutions-overview#known-limitations).

1. Select **Add**.

## Add many flows into Dataverse solutions using PowerShell

Administrators can use PowerShell to quickly add many or all non-solution cloud flows into Dataverse solutions using the [Add-AdminFlowsToSolution](/powershell/module/microsoft.powerapps.administration.powershell/add-adminflowstosolution) cmdlet. To learn more, go to [Add flows into Dataverse solutions via PowerShell](/power-platform/admin/powerapps-powershell#Add-flows-into-Dataverse-solutions).

## Related information

- [Add canvas apps and cloud flows to a solution by default](/power-apps/maker/canvas-apps/add-app-solution-default)
- [Create a solution](./overview-solution-flows.md)
- [Export a solution](./export-flow-solution.md)
- [Import a solution](./import-flow-solution.md)
- [Edit a solution-aware flow](./edit-solution-aware-flow.md)
- [Remove a solution-aware flow](./remove-solution-aware-flow.md)

[!INCLUDE[footer-include](includes/footer-banner.md)]
