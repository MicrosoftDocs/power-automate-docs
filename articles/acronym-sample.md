---
title: Adaptive Cards acronym form sample | Microsoft Docs
description: Create an adaptive card that collects acronyms and stores them in Dataverse.
services: ''
suite: flow
documentationcenter: na
author: v-aangie
editor: ''
tags: ''
ms.reviewer: angieandrews
ms.subservice: cloud-flow
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 01/04/2020
ms.author: angieandrews
---

# Acronyms form sample

The **acronym form** sample is an Adaptive Card input form that's designed to collect acronyms and storing them in Dataverse. These acronyms could be queried from anywhere due to this ongoing data collection.

![Acronym logger.](media/adaptive-cards/acronym-logger.png)

*Inputs/Outputs and notes*

| Dynamic Token Name | Placeholder Text                        | Notes:              |
|--------------------|-----------------------------------------|---------------------|
| {acAcronym}        | Enter the abbreviation for the acronym  | Response **output** |
| {acDefinition}     | Enter a definition of the acronym above | Response **output** |

``` json
{
    "$schema": "http://adaptivecards.io/schemas/adaptive-card.json",
    "type": "AdaptiveCard",
    "version": "1.0",
    "body": [
        {
            "type": "TextBlock",
            "text": "Acronym Logger",
            "id": "Title",
            "spacing": "Medium",
            "horizontalAlignment": "Center",
            "size": "ExtraLarge",
            "weight": "Bolder",
            "color": "Accent"
        },
        {
            "type": "Container",
            "items": [
                {
                    "type": "TextBlock",
                    "text": "Acronym",
                    "wrap": true,
                    "spacing": "Medium"
                },
                {
                    "type": "Input.Text",
                    "id": "acAcronym",
                    "placeholder": "Enter the abbreviation for the acronym"
                },
                {
                    "type": "TextBlock",
                    "text": "Definition",
                    "wrap": true
                },
                {
                    "type": "Input.Text",
                    "placeholder": "Enter a definition of the acronym above",
                    "id": "acDefinition",
                    "isMultiline": true
                }
            ]
        }
    ],
    "actions": [
        {
            "type": "Action.Submit",
            "title": "Submit",            "id": "btnSubmit"
        }
    ]
}

```

[!INCLUDE[footer-include](includes/footer-banner.md)]
