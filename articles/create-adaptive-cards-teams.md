---
title: Learn to create flows that post adaptive cards to Microsoft Teams | Microsoft Docs
description: Learn to create flows that post richly formatted content with adaptive cards to Microsoft Teams.
services: ''
suite: flow
documentationcenter: na
author: msftman
manager: kvivek
editor: ''
tags: ''
ms.service: power-automate
ms.devlang: na
ms.subservice: cloud-flow
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/29/2019
ms.author: deonhe
---


<!--from editor: I notice that adaptive cards is capitalized on the page opened by the link in the first paragraph. But the screenshots in this file don't show it being capitalized. So I'm unsure if it should change.-->


# Use adaptive cards in Microsoft Teams


You can create a cloud flow that posts [adaptive cards](https://adaptivecards.io) to a Microsoft Teams channel. With adaptive cards, you can use rich formatting to make your posts clearer, interactive, and engaging. Adaptive cards can contain components like images, graphs, richly formatted text, and more.

## Create a cloud flow that posts adaptive cards to a team

Follow these steps to create a cloud flow that posts an adaptive card to the general channel in the Strategy and Planning team. The flow we create uses the **Post your own adaptive card as the Flow bot to a channel (preview)** action to post the adaptive card's content to the team's channel weekly.

1. Sign in to Microsoft Teams.
1. Select the **Teams** icon in the navigation bar on the left, and then select the **Strategy and Planning** team.

    ![Select teams.](media/create-adaptive-cards-teams/select-teams-team.png)

1. Select the **Flow** tab at the top of the screen.
1. Select the **+** (Create from blank) icon.
1. Search for **recurrence**, and then select the **Recurrence** trigger.

    ![Recurrence card.](media/create-adaptive-cards-teams/select-recurrence.png)

1. Set the schedule as follows to repeat every week, at a time and time zone of your choice:
    
    ![Recurrence card.](media/create-adaptive-cards-teams/recurrence-card.png)
    
1. Select **New step**.
1. Search for **adaptive**, select **Microsoft Teams**, and then select the **Post your own adaptive card as the Flow bot to a channel (preview)** action.

   ![Adaptive card.](media/create-adaptive-cards-teams/select-adaptive-post-message-action.png)

1. Provide a **Team**, **Channel**, and **Message** on the **Post your own adaptive card as the Flow bot to a channel (Preview)** card to indicate the team and channel to which the adaptive card **Message** will be posted.

   ![Adaptive card.](media/create-adaptive-cards-teams/adaptive-card-message.png)

   You can use this sample JSON content for the **Message**:

    ````
        {
    "$schema": "http://adaptivecards.io/schemas/adaptive-card.json",
    "type": "AdaptiveCard",
    "version": "1.0",
    "speak": "Our team meeting is starting soon. Do you want to snooze  or do you want to send a late notification to the attendees?",
    "body": [
        {
        "type": "TextBlock",
        "text": "Strategy and Planning Weekly Team meeting",
        "size": "large",
        "weight": "bolder"
        },
        {
        "type": "TextBlock",
        "text": "Conf Room 112/3377 (10)",
        "isSubtle": true
        },
        {
        "type": "TextBlock",
        "text": "12:30 PM - 1:30 PM",
        "isSubtle": true,
        "spacing": "none"
        },
        {
        "type": "TextBlock",
        "text": "Snooze for"
        },
        {
        "type": "Input.ChoiceSet",
        "id": "snooze",
        "style": "compact",
        "value": "5",
        "choices": [
            {
            "title": "5 minutes",
            "value": "5",
            "isSelected": true
            },
            {
            "title": "15 minutes",
            "value": "15"
            },
            {
            "title": "30 minutes",
            "value": "30"
            }
        ]
        }
    ],
    "actions": [
        {
        "type": "Action.Submit",
        "title": "Snooze",
        "data": {
            "x": "snooze"
        }
        },
        {
        "type": "Action.Submit",
        "title": "I'll be late",
        "data": {
            "x": "late"
        }
        }
    ]
    }
    ````


1. Give your flow a name and save it.


## Run the flow

Notice, after the recurrence time elapses, the flow posts the adaptive card's content to the team channel that you defined.

![Run the flow.](media/create-adaptive-cards-teams/flow-run-result.png)

## Learn more

- Get started with [adaptive card samples](https://adaptivecards.io/samples/).
- Create [adaptive card content](https://adaptivecards.io) the easy way.





[!INCLUDE[footer-include](includes/footer-banner.md)]