---
title: Poll generator sample | Microsoft Docs
description: An Adaptive Card input form that's designed for submitting polls to Microsoft Teams.
services: ''
suite: flow
documentationcenter: na
author: msftman
manager: kVivek
editor: ''
tags: ''
ms.service: flow
ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 01/01/20
ms.author: deonhe
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---
# Create a poll sample

The **Create a Poll** sample is an Adaptive Card input form that's designed for submitting polls to Microsoft Teams. Replace the display text in this card to customize for the poll. This adaptive card enables you to take different decision paths based on the responses given in the poll values, or voting counts, of card consumers.

![](media/259c49cf45bbead6711e52728be96382.png)

*Inputs/Outputs and notes:*

| Dynamic Token Name | Placeholder Text | Notes:                                            |
|--------------------|------------------|---------------------------------------------------|
| Title              |                  | Display text                                      |
| acHeaderTagLine    |                  | Display text                                      |
| acHeader           |                  | Display text                                      |
| acPollQuestion     |                  | Display text                                      |
| acPollChoices      |                  | Response **output**                               |
|                    |                  | Single select as radio buttons                    |


``` json
{
    "$schema": "http://adaptivecards.io/schemas/adaptive-card.json",
    "type": "AdaptiveCard",
    "version": "1.0",
    "body": [
        {
            "type": "TextBlock",
            "text": "Poll Request",
            "id": "Title",
            "spacing": "Medium",
            "horizontalAlignment": "Center",
            "size": "ExtraLarge",
            "weight": "Bolder",
            "color": "Accent"
        },
        {
            "type": "TextBlock",
            "text": "Header Tagline Text",
            "id": "acHeaderTagLine",
            "separator": true
        },
        {
            "type": "TextBlock",
            "text": "Poll Header",
            "weight": "Bolder",
            "size": "ExtraLarge",
            "spacing": "None",
            "id": "acHeader"
        },
        {
            "type": "TextBlock",
            "text": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vestibulum lorem eget neque sollicitudin, quis malesuada felis ultrices. ",
            "id": "acInstructions",
            "wrap": true
        },
        {
            "type": "TextBlock",
            "text": "Poll Question",
            "id": "acPollQuestion"
        },
        {
            "type": "Input.ChoiceSet",
            "placeholder": "Select from these choices",
            "choices": [
                {
                    "title": "Choice 1",
                    "value": "Choice 1"
                },
                {
                    "title": "Choice 2",
                    "value": "Choice 2"
                },
                {
                    "title": "Choice 3",
                    "value": "Choice 3"
                }
            ],
            "id": "acPollChoices",
            "style": "expanded"
        }
    ],
    "actions": [
        {
            "type": "Action.Submit",
            "title": "Submit",
            "id": "btnSubmit"
        }
    ]
}
```

<!-- [block 2
[here](https://microsoft-my.sharepoint.com/:u:/p/audrie/Eb9z5H56UCBEujrbsuS4qBYBBXoCYu-uEfR4w4MOAoSqBA?e=UwU5xX)] -->

## Next steps

