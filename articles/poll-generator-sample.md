---
title: Poll generator sample
description: An Adaptive Card input form that's designed for submitting polls to Microsoft Teams.
suite: flow
author: kewaiss
ms.service: power-automate
ms.subservice: cloud-flow
ms.topic: article
ms.date: 01/01/2020
ms.author: derahonuorah, dbekirop
search.audienceType: 
  - flowmaker
  - enduser
ms.reviewer: angieandrews
---
# Create a poll sample

The **create a poll** sample is an Adaptive Card input form that's designed for submitting polls to Microsoft Teams. Replace the display text in this card to customize for the poll. This adaptive card enables you to take different decision paths based on the responses given in the poll values, or voting counts, of card consumers.

![Poll sample.](media/adaptive-cards/poll.png)

*Inputs/Outputs and notes*

| Dynamic Token Name | Placeholder Text | Notes:                                            |
|--------------------|------------------|---------------------------------------------------|
| Title              |                  | Display text                                      |
| acHeaderTagLine    |                  | Display text                                      |
| acHeader           |                  | Display text                                      |
| acPollQuestion     |                  | Display text                                      |
| acPollChoices      |                  | Response **output**  <br> Single select as radio buttons|

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




[!INCLUDE[footer-include](includes/footer-banner.md)]
