---
title: Use Power Automate flows in Microsoft Teams
description: Learn how to use Power Automate flows within Microsoft Teams.
documentationcenter: na
author: v-aangie
contributors:
  - lutorre
  - kewaiss
  - v-aangie
ms.service: power-automate
ms.subservice: teams
ms.topic: overview
ms.date: 02/27/2025
ms.author: kewaiss
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
---

# Use flows in Microsoft Teams

Power Automate flows can be used in three scenarios with Teams.

Scenario|Description
--------|-------
Trigger [flows from Teams messages](../trigger-flow-teams-message.md).| In this scenario, you can create flows that are triggered when someone selects a Teams message. The flow can then run as any other flow you create.
Use flows with [adaptive cards](../create-adaptive-cards.md).| Here, adaptive cards can be used as the trigger for flows. The full set of rich adaptive cards is available to you.
Create flows from within the [Power Apps app in Teams](./create-flows-power-apps-app.md).|Use the Power Apps app in Teams to create flows that use [Dataverse for Teams](/power-apps/teams/overview-data-platform). Dataverse for Teams is a built-in, low-code data platform for Teams that empowers users to build custom apps and workflows within Teams by using Power Apps and Power Automate.

> [!NOTE]
> Department of Defense (DoD) cloud environments support the following capabilities:
>
> - Create and trigger the **When a new chat message is added** flow
> - Create and trigger the **When keywords are mentioned** flow
> - Create and trigger the **When a new team member is added** flow
> - Create and trigger the **Post a feed notification** flow
> - Create and trigger the **When I am \@mentioned** flow

## Licensing

There are no additional licensing requirements when you use Power Automate with Microsoft Teams.

For detailed licensing information about Dataverse for Teams, see [licensing and restrictions](/power-platform/admin/about-teams-environment?branch=teams-preview#licensing-and-restrictions) in the Microsoft Power Platform admin guide.

### Related information

- [Power Apps and Teams](/powerapps/teams/overview)
- [Microsoft Copilot Studio overview](https://aka.ms/pva-teams-docs)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
