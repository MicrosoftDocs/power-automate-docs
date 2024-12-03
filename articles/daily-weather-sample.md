---
title: Adaptive Cards daily weather report sample | Microsoft Docs
description: A sample for creating an Adaptive Card to post a daily weather update to a Teams channel
services: ''
suite: flow
documentationcenter: na
author: v-aangie
editor: ''
tags: ''

ms.subservice: cloud-flow
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 01/04/2020
ms.author: angieandrews
ms.reviewer: angieandrews
---

# Daily weather report sample

The **daily weather report** sample is an Adaptive Card designed to be used with MSN weather to post a daily weather update to a Teams channel.

![Sample weather.](media/adaptive-cards/weather.png)

*Inputs/Outputs and notes*

| Dynamic Token Name     | Placeholder Text | Notes                                                                         |
|------------------------|------------------|--------------------------------------------------------------------------------|
| {acCityState}          | See template     | Display text <br>  A variable can be used to hold the City, State, or Zip Code values                                                                   |
| {acDailySummary}       | See template     | Display text                                                                   |
| {acCurrentDateTime}    | See template     | Display text                                                                   |
| {acUrlConditionsImage} | See template     | Display text  <br> See template comments This must be replaced with a valid URL                                                                 |
| {acCurrentTemperature} | See template     | Display text                                                                   |
| {actempHi}             | See template     | Display text                                                                   |
| {actempLow}            | See template     | Display text                                                                   |


``` json
{
    "$schema": "http://adaptivecards.io/schemas/adaptive-card.json",
    "type": "AdaptiveCard",
    "version": "1.0",
    "body": [
        {
            "type": "TextBlock",
            "text": "{acCity}, {acState}",
            "size": "Large",
            "isSubtle": true
        },
        {
            "type": "TextBlock",
            "text": "{acCurrentDateTime}",
            "spacing": "None"
        },
        {
            "type": "TextBlock",
            "text": "{acDailySummary}",
            "spacing": "None"
        },
        {
            "type": "ColumnSet",
            "columns": [
                {
                    "type": "Column",
                    "width": "auto",
                    "items": [
                        {
                            "type": "Image",
                            "url": "{acUrlConditionsImage}",
                            "size": "Large"
                        }
                    ]
                },
                {
                    "type": "Column",
                    "width": "auto",
                    "items": [
                        {
                            "type": "TextBlock",
                            "text": "{acCurrentTemperature}",
                            "size": "ExtraLarge",
                            "spacing": "None"
                        }
                    ]
                },
                {
                    "type": "Column",
                    "width": "stretch",
                    "items": [
                        {
                            "type": "TextBlock",
                            "text": "°F",
                            "weight": "Bolder",
                            "spacing": "Small"
                        }
                    ]
                },
                {
                    "type": "Column",
                    "width": "stretch",
                    "items": [
                        {
                            "type": "TextBlock",
                            "text": "Hi {actempHi}",
                            "horizontalAlignment": "Left"
                        },
                        {
                            "type": "TextBlock",
                            "text": "Lo {actempLow}",
                            "horizontalAlignment": "Left",
                            "spacing": "None"
                        }
                    ]
                }
            ]
        }
    ]
}
```


[!INCLUDE[footer-include](includes/footer-banner.md)]
