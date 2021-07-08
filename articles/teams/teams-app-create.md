---
title: Create flows in Microsoft Teams | Microsoft Docs
description: Learn how to create flows using the Power Automate app in Microsoft Teams
services: ''
suite: flow
documentationcenter: na
author: msftman
manager: kvivek
editor: ''
tags: ''
ms.service: power-automate
ms.devlang: na
ms.subservice: teams
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 11/16/2020
ms.author: hamenon
---

# Create flows in Microsoft Teams

You can use the [Power Automate app](./install-teams-app.md) to create and manage flows from within Microsoft Teams. To get started quickly, use one of the existing templates to create your flows, or you can create customized flows from scratch. 

## Prerequisites

To use the Power Automate app, you need an account with access to [Microsoft Teams](https://teams.microsoft.com).

## Create a cloud flow from a template

>[!NOTE]
>By default, the Power Automate app shows you templates that have been created for Microsoft Teams. You can switch filters on the top right to view all Power Automate templates, if desired.
 
![Create tab filter](../media/power-automate-teams-app-create/create-filter.png)

Follow these steps to create a cloud flow from a Microsoft Teams template:

1. Sign into [Microsoft Teams](Https://Teams.Microsoft.com).

   >[!TIP]
   >You may also use the Microsoft Teams app.

1. Select **Apps** on the right side on the screen.
1. Search for, and then select the **Power Automate** app.

   ![A screenshot that shows a search for the Power Automate app](../media/power-automate-teams-app-create/search-app.png)

1. Select the **Create** tab, and then select the template on which you'd like to base your flow.

   ![Create tab](../media/power-automate-teams-app-create/create-tab.png)

1. If the template that you selected is optimized for Microsoft Teams, a dialog that lets you rename the flow and authenticate with the apps necessary for the flow displays.
   ![Setup connections](../media/power-automate-teams-app-create/template1.png)

   >[!NOTE]
   >You must login to all connectors so that your flow can run successfully. A green check indicates that you've authenticated.

1. Set up the connections as needed.

1. Select **Continue** to get a list of parameters that are necessary for the flow to run successfully. Provide the parameters that are needed.
   
   ![Setup parameters](../media/power-automate-teams-app-create/template2.png)

   If you wish to see the full flow, select **Edit in advanced mode**.
   
   ![Advanced mode](../media/power-automate-teams-app-create/template-advanced.png)

1. You're all set! You will get a confirmation screen showing that your flow was successfully created. After you create your flow, you can find it on the **Home** tab.

   ![Confirmation screen](../media/power-automate-teams-app-create/template3.png)

>[!IMPORTANT]
>When you create flows from within the Power Automate app in Microsoft Teams, they are always created in your organization's default environment. You can also access these flows from [Power Automate](https://flow.microsoft.com).

## Create a cloud flow from scratch

If you want full control over the flow that you create, select **Create from blank** from the top right side of the screen, instead of using a template.

   ![Create from blank](../media/power-automate-teams-app-create/create-blank.png)

This brings up the full Power Automate designer experience within Microsoft Teams where you can [create a fully customized flow](../get-started-logic-flow.md).

   ![Create from blank](../media/power-automate-teams-app-create/full-editor.png)


## Known issues

Any flow that you create from within the Power Automate app is located in your organization's default environment.

## Related articles
- [Manage your flows in Microsoft Teams](./teams-app-home.md).

- Visit the [Microsoft Teams connector documentation](/connectors/teams/).




[!INCLUDE[footer-include](../includes/footer-banner.md)]