---
title: Create flows using the Power Apps app in Microsoft Teams (Preview) | Microsoft Docs
description: Create flows using the Power Apps app in Teams.
author: msftman
manager: kvivek
ms.service: flow
ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 09/22/2020
ms.author: DeonHe
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Create flows using the Power Apps app in Microsoft Teams (Preview)

[!INCLUDE [cc-beta-prerelease-disclaimer.md](../includes/cc-beta-prerelease-disclaimer.md)]

You can build flows to customize and add further value to Microsoft Teams from within the new Power Apps app in Teams. 
You can create [instant](../introduction-to-button-flows.md), [scheduled](../run-scheduled-tasks.md), and [automated](../get-started-logic-flow.md) flows, with access to over 350 connectors. This includes a connector to work with [Project Oakdale Tables](/powerapps/teams/create-table) within Teams as well.

> [!NOTE]
> - This is a preview feature.
> - [!INCLUDE [cc-preview-features-definition.md](../includes/cc-preview-features-definition.md)]
> - You need a [Power Automate license](https://flow.microsoft.com/pricing/) to access all Power Automate [connectors](https://docs.microsoft.com/Connectors/connector-reference/), including the premium connectors. Users with a Microsoft 365 license can use all standard connectors.

## Prerequisites 

- The Power Apps app must be installed before you can create flows in Teams. For more information, [Install the Power Apps personal app in Teams](/powerapps/teams/install-personal-app).

- Before you can use the Power Apps app in Teams to create a flow, a Project Oakdale environment must already exist for that team. A Project Oakdale environment is automatically provisioned when you [create your first app in Teams](/powerapps/teams/create-first-app).

## Create a flow in Teams

1. Navigate to the **Build** tab in your Power Apps app, and then select **See all**.

1. Select **New**, select **Flow**, and then select the type of flow you want to create. You can create only the following types of flows: [instant](../introduction-to-button-flows.md), [scheduled](../run-scheduled-tasks.md), and [automated](../get-started-logic-flow.md).
 
   ![Create a flow](..\media\overview-teams-flows\new-flow.png)

1. If this is your first time creating a flow, you'll have to select your country/region, and then select **Get started**.

   ![Select your location](..\media\overview-teams-flows\select-location.png)

1. The **Build an automated flow** screen appears, allowing you to select a trigger, create, and save your flow.

   >[!NOTE]
   >The screen that appears here will be different if you selected instant or scheduled flow in step 2 earlier.

   ![View of the designer](..\media\overview-teams-flows\build-automated-flow.png)


## Work with your flows

To find your saved flows:

1. Sign into Teams.

1. Select **Power Apps** from the navigation list on the left side.

   ![Select Power Apps](..\media\overview-teams-flows\select-power-apps.png)

1. Select the **Build** tab, select the team in which you created your flow, and then select **See all** in the tree view. 

   ![All flows](..\media\overview-teams-flows\all-flows.png)

## Customize a flow

In Teams, you could have acquired flows from an installed app, or you may have created them yourself. You can update or customize either of these flows. 

1. To update a flow, select the **Build** tab, and then select **See all** to see all the apps and flows in this team.

1. Select the flow that you want to edit, and then select **Edit**.  

   ![Customize flows](..\media\overview-teams-flows\customize-flow.png)

## View details and run history

1. To view the details and run history for a flow, select the **Build** tab, and then select **See all**.

1. Select the flow for which you want to view the details, and then select **Details**.

   ![Customize flows](..\media\overview-teams-flows\view-details-history.png)

## Related articles

[Use the new Power Apps app in Teams](/powerapps/teams/overview)<br/>
[About the Project Oakdale environment](/power-platform/admin/about-teams-environment)
