---
title: Learn to create and manage flows in Microsoft Teams. | Microsoft Docs
description: Create and manage flows to post messages on-demand, @mention users and channels, and post cards with response options, and more.
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
ms.date: 04/29/2019
ms.author: deonhe
---

# Microsoft Flow in Teams

### Prerequisites

1. Access to Microsoft Teams.
1. Access to Microsoft Flow.

## Install the Microsoft Flow app in Teams

Follow these steps to install the Microsoft Flow app in Microsoft Teams.

1. Sign into Microsoft Teams.

1. Tap the **Apps** icon at the bottom left of the Teams navigation bar.

    ![select apps](media/flows-teams/apps.png)

1. Select the **Flow** app. You might need to search for **Flow** if you don't see it.

    ![select flow app](media/flows-teams/select-flow-app.png)

1. Select the **Install** button.

    ![install button](media/flows-teams/select-install.png)

1. Microsoft Flow is now installed.

    ![installed](media/flows-teams/flow-installed.png)


## Create a flow in teams

1. Sign into Microsoft Teams.

1. Select the **More added apps** link (three dots) on the navigation bar.

    ![added apps icon](media/flows-teams/added-apps-icon.png)

1. Select the **Flow** app.

1. If you haven't done so before, you might need sign in and  grant permissions:.

    ![sign in](media/flows-teams/grant-permissions-sign-in.png)


    Notice the following tabs

    ![flow landing page](media/flows-teams/flow-landing-page.png)

    Name|Purpose
    ----|-----|
    Conversation|Interact with the Flow bot.
    Flows|Create and manage flows.
    Approvals|Lists received and sent approval requests.
    About|Displays version and other information about Microsoft Flow.


    You now see all flows you've created from the Microsoft Flow designer (if any). 

    You can also create flows from a [custom template]() or from [blank template](), just like you do from the Microsoft Flow designer. 

## Manage approvals

You can manage [approvals](modern-approvals.md) in Microsoft Teams, just like you would do in Microsoft Flow. Follow these steps to manage your approvals:

1. Sign into Microsoft Teams.
1. Select the **Approvals** tab.

    ![approvals tab](media/flows-teams/approvals-tab.png)

    You'll notice the following sub-tabs:

    Tab|Purpose
    ----|-----|
    Received|Lists approval requests you've received and are pending action from you.
    Sent|Lists approval requests you've sent and are pending action from others.
    History|Lists received and sent approval requests.
    Create approval flow|Create approval flows.

1. Select the **Received**, **Sent**, or **History** tabs to learn more.

    ![approvals tab](media/flows-teams/approvals-tab-2.png)

1. Select the **Create approval flow** to create an approval flow.

    ![approvals tab](media/flows-teams/approvals-tab-3.png)

## Use the bot with flows

### List and launch flows with the bot

> [!TIP]
> The bot lists and runs flows that are triggered by a schedule, or manually triggered without user input.
1. Sign into Microsoft Teams.
1. Select the **More added apps** link (three dots) on the navigation bar.

    ![added apps icon](media/flows-teams/added-apps-icon.png)
1. Select the **Flow** app

1. Select the **Conversation** tab.

    ![conversation tab](media/flows-teams/conversations-tab.png)

On the **Conversation** tab, you can send commands to the bot, which responds by performing the actions you command it to run. For example, to list my flows and run the flow with index 1, run the following commands:
- ```List flows``` - The bot displays a list of your flows, prefixed by an index number.
- ```Run flow 1``` - Runs flow number 1. Here, *1* is the index number of the flow you want to run.

   ![bot commands](media/flows-teams/bot-commands.png)

### Get the description for flows

To get the description for the flow with index 1 from your list of flows, run ```describe flow 1```. The bot responds similar to this image:

   ![describe flows](media/flows-teams/bot-describe.png)

### Get the list of commands for the bot

To get the list of commands the bot handles, just ask it with this command:

```learn more```. The bot responds like this image:

   ![describe flows](media/flows-teams/bot-learn-more.png) 