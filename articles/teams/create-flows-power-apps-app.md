---
title: Create flows using the Power Apps app in Microsoft Teams | Microsoft Docs
description: Create flows using the Power Apps app in Teams.
author: v-aangie
contributors:
  - kewaiss
  - v-aangie
ms.subservice: teams
ms.topic: conceptual
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 11/16/2020
ms.author: kewaiss
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
---

# Create flows using the Power Apps app in Microsoft Teams

You can build flows to customize and add further value to Teams from within the new Power Apps app in Teams. You can create [instant](../mobile/mobile-create-flow.md), [scheduled](../run-scheduled-tasks.md), and [automated](../get-started-logic-flow.md) flows, with access to over 350 connectors. This includes a connector to work with [Microsoft Dataverse for Teams tables](/powerapps/teams/overview-data-platform#tables-in-dataverse-for-teams) within Teams.

> [!NOTE]
> You need a [Power Automate license](https://make.powerautomate.com/pricing/) to access all Power Automate [connectors](/Connectors/connector-reference/), including the premium connectors. Users with a Microsoft 365 license can use all standard connectors.

## Prerequisites

- The Power Apps app must be installed before you can create flows in Teams. More information: [Install the Power Apps personal app in Microsoft Teams](/powerapps/teams/install-personal-app)

- Before you can use the Power Apps app in Teams to create a cloud flow, a Dataverse for Teams environment must already exist for that team. A Dataverse for Teams environment is automatically provisioned when you [create your first app in Teams](/powerapps/teams/create-first-app).

## Create a cloud flow in Teams

1. Go to the **Build** tab in your Power Apps app, and then select **See all**.

1. Select **New**, select **Flow**, and then select the type of flow you want to create. You can create only the following types of flows: [instant](../mobile/mobile-create-flow.md), [scheduled](../run-scheduled-tasks.md), and [automated](../get-started-logic-flow.md).
 
   ![Create a cloud flow.](..\media\overview-teams-flows\new-flow.png)

1. If this is your first time creating a cloud flow, you'll have to select your country/region, and then select **Get started**.

   ![Select your location.](..\media\overview-teams-flows\select-location.png)

1. The **Build an automated flow** screen appears, where you can select a trigger, and create and save your flow.

   >[!NOTE]
   >The screen that appears here will be different depending on whether you selected **Instant** or **Scheduled** in step 2 earlier.

   ![View of the designer.](..\media\overview-teams-flows\build-automated-flow.png)

## Work with your flows

To find your saved flows:

1. Sign in to Teams.

1. On the left pane, select **Power Apps**.

   ![Select Power Apps.](..\media\overview-teams-flows\select-power-apps.png)

1. On the **Build** tab, select the team in which you created your flow, and then select **See all** in the tree view. 

   ![All flows.](..\media\overview-teams-flows\all-flows.png)

## Customize a cloud flow

In Teams, you might have acquired flows from an installed app or you might have created them yourself. You can update or customize either of these types of flows. 

1. To update a cloud flow, select the **Build** tab, and then select **See all** to see all the apps and flows in this team.

1. Select the flow that you want to edit, and then select **Edit**.  

   ![Select Edit.](..\media\overview-teams-flows\customize-flow.png)

## View details and run history

1. To view the details and run history for a cloud flow, select the **Build** tab, and then select **See all**.

1. Select the flow for which you want to view the details, and then select **Details**.

   ![View the details of flows.](..\media\overview-teams-flows\view-details-history.png)

## Related information

- [Use the new Power Apps app in Microsoft Teams](/powerapps/teams/create-apps-overview)<br/>
- [What is Dataverse for Teams?](/powerapps/teams/overview-data-platform)<br/>
- [About the Dataverse for Teams environment](/power-platform/admin/about-teams-environment)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
