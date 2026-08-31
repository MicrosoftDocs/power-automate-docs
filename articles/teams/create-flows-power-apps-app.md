---
title: Create flows using the Power Apps app in Microsoft Teams 
description: Create flows using the Power Apps app in Teams.
author: v-aangie
contributors:
  - kewaiss
  - v-aangie
  - cyrilanderson
ms.service: power-automate
ms.subservice: teams
ms.topic: how-to
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 08/31/2026
ms.author: matow
ms.reviewer: cyanderson
search.audienceType: 
  - flowmaker
  - enduser
---

# Create flows by using the Power Apps app in Microsoft Teams

You can build flows to customize and add value to Teams from within the new Power Apps app in Teams. You can create [instant](../mobile/mobile-create-flow.md), [scheduled](../run-scheduled-tasks.md), and [automated](../get-started-logic-flow.md) flows, with access to more than 350 connectors. This number includes a connector to work with [Microsoft Dataverse for Teams tables](/powerapps/teams/overview-data-platform#tables-in-dataverse-for-teams) within Teams.

> [!NOTE]
> You need a [Power Automate license](https://make.powerautomate.com/pricing/) to access all Power Automate [connectors](/Connectors/connector-reference/), including the premium connectors. Users with a Microsoft 365 license can use all standard connectors.

## Prerequisites

- The Power Apps app must be installed before you can create flows in Teams. For more information, see [Install the Power Apps personal app in Microsoft Teams](/powerapps/teams/install-personal-app).

- Before you can use the Power Apps app in Teams to create a cloud flow, a Dataverse for Teams environment must already exist for that team. A Dataverse for Teams environment is automatically provisioned when you [create your first app in Teams](/powerapps/teams/create-first-app).

## Create a cloud flow in Teams

1. Go to the **Build** tab in your Power Apps app, and then select **See all**.

1. Select **New**, select **Cloud flow**, and then select the type of flow you want to create. You can create the following types of flows: [Instant](../mobile/mobile-create-flow.md), [Scheduled](../run-scheduled-tasks.md), and [Automated](../get-started-logic-flow.md).

   :::image type="content" source="../media/overview-teams-flows/new-flow.png" alt-text="Create a cloud flow.":::

1. If this is your first time creating a cloud flow, select your country/region, and then select **Get started**.

   :::image type="content" source="../media/overview-teams-flows/select-location.png" alt-text="Select your location.":::

   A build screen appears.

1. Select a name and trigger for your flow, and then select **Create**.

   >[!NOTE]
   >The screen that appears here is different depending on whether you selected **Instant** or **Scheduled** in step 2 earlier.

   :::image type="content" source="../media/overview-teams-flows/build-automated-flow.png" alt-text="View of the designer.":::

## Work with your flows

To find your saved flows:

1. Sign in to Teams.

1. On the left pane, select **Power Apps**.

   :::image type="content" source="../media/overview-teams-flows/select-power-apps.png" alt-text="Select Power Apps.":::

1. On the **Build** tab, select the team in which you created your flow, and then select **See all** in the tree view.

   :::image type="content" source="../media/overview-teams-flows/all-flows.png" alt-text="All flows.":::

## Customize a cloud flow

In Teams, you might have acquired flows from an installed app or you might have created them yourself. You can update or customize either of these types of flows.

1. To update a cloud flow, select the **Build** tab, and then select **See all** to see all the apps and flows in this team.

1. Select the flow that you want to edit, and then select **Edit**.  

   :::image type="content" source="../media/overview-teams-flows/customize-flow.png" alt-text="Select Edit.":::

## View details and run history

1. To view the details and run history for a cloud flow, select the **Build** tab, and then select **See all**.

1. Select the flow for which you want to view the details, and then select **Details**.

   :::image type="content" source="../media/overview-teams-flows/view-details-history.png" alt-text="View the details of flows.":::

## Related information

- [Use the new Power Apps app in Microsoft Teams](/powerapps/teams/create-apps-overview)<br/>
- [What is Dataverse for Teams?](/powerapps/teams/overview-data-platform)<br/>
- [About the Dataverse for Teams environment](/power-platform/admin/about-teams-environment)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
