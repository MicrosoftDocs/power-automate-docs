---
title: Learn to create and manage flows in Microsoft Teams | Microsoft Docs
description: Create and manage flows to post messages on-demand, @mention users and channels, post cards with response options, and more.
services: ''
suite: flow
documentationcenter: na
author: msftman
manager: kvivek
editor: ''
tags: ''
ms.service: flow
ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 01/15/2021
ms.author: deonhe
---

# Power Automate in Teams

### Prerequisites

1. Access to Microsoft Teams.
1. Access to Power Automate.

## Install the Power Automate app in Teams

Follow these steps to install the Power Automate app in Microsoft Teams.

1. Sign in to Microsoft Teams.

1. Select the **Apps** icon at the lower left of the Teams navigation bar.

1. Select the **Power Automate** app. You might need to search for **Power Automate** if you don't see it.

    ![Select Power Automate app](media/flows-teams/select-flow-app.png)

1. Select **Add**.

1. Power Automate is now added to Teams.

## Create a cloud flow in Teams

1. Sign in to Microsoft Teams.

1. Select the **Power Automate** app in the left-side menu pane.

1. If you haven't done so before, you might need to sign in and grant permissions.

    Access your flows in Teams by using the following tabs:

    Tab|Purpose
    ----|-----|
    Home| Summary of your flows.
    Create| Create a Power Automate flow in Teams
    Chat|Interact with the Power Automate bot.
    Approvals|Shows received and sent approval requests.
    Business process flows|Shows your business process flows
    About|Displays version and other information about Power Automate.

You now see all flows you've created from the Power Automate designer (if any).

You can also create flows from a custom template or from a blank template, just like you do from the Power Automate designer.

## Manage approvals

You can manage [approvals](modern-approvals.md) in Microsoft Teams, just like you would do in Power Automate. Follow these steps to manage your approvals:

1. Sign in to Microsoft Teams.
1. Select the **Approvals** tab.

    You'll notice the following subtabs:

    Tab|Purpose
    ----|-----|
    Received|Lists approval requests you've received and are pending action from you.
    Sent|Lists approval requests you've sent and are pending action from others.
    History|Lists received and sent approval requests.
    Create approval flow|Create approval flows.

1. Select the **Received**, **Sent**, or **History** tabs to learn more.

1. Select the create **Create** tab, and then select the **Approvals** category to find an approval template to create your approval flow in Teams. 

    ![Create approvals tab](media/flows-teams/approvals-tab.png)

    ![Approvals templates menu](media/flows-teams/approvals-tab-2.png)

## Use the bot with flows

### List and launch flows with the bot

> [!TIP]
> The bot lists and runs flows that are triggered by a schedule, or manually triggered without user input.

1. Sign in to Microsoft Teams.

1. Select the **More added apps** link (...) on the navigation bar and then select the **Power Automate** app.
    ![Select app screen](media/flows-teams/select-app.png)

1. Select the **Chat** tab.


On the **Chat** tab, you can send commands to the bot, which responds by performing the actions you command it to run. For example, to list your flows and run the flow with index 1, run the following commands:

- ```List flows``` - The bot displays a list of your flows, prefixed by an index number.
- ```Run flow 1``` - Runs flow number 1. Here, *1* is the index number of the flow you want to run.

### Get the description for flows

To get the description for the flow with index 1 from your list of flows, run ```describe flow 1```. The bot response will be similar to this image:

### Get the list of commands for the bot

To get the list of commands the bot handles, ask it with this command: ```learn more```


[!INCLUDE[footer-include](includes/footer-banner.md)]