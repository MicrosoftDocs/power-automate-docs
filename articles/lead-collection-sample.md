---
title: Lead collection sample | Microsoft Docs
description: Create an Adaptive Card for collecting leads from persons interested in a set of products.
services: ''
suite: flow
documentationcenter: na
author: v-aangie
editor: ''
tags: ''

ms.service: power-automate
ms.subservice: cloud-flow
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 01/01/2020
ms.author: angieandrews
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
---
# Lead collection sample

The **lead collection** sample is an Adaptive Card input form designed for collecting leads from anyone that may come into contact with individuals interested in a set of products. Feel free to change the choices for the products, remembering that each choice can have display text, as well as an internal value which will be output after someone submits the card (they can also be the same as we show in the sample code block).

![Lead notification.](media/adaptive-cards/lead-notification.png)

*Inputs/Outputs and notes:*

| Dynamic Token Name    | Placeholder Text       | Notes                                                                                       |
|-----------------------|------------------------|--------------------------------------|
| Title                 |                        | Display text                                                                                  |
| acInstructions        |                        | Display text                                                                                  |
| acLeadFName           | {firstName}            | Response **output**                                                                           |
| acLeadLName           | {lastName}             | Response **output**                                                                           |
| acLeadEmail           | {emailAddress}         | Response **output**                                                                           |
| acLeadPrimaryPhone    | {primaryPhone10digits} | Response **output**                                                                           |
| acLeadProductInterest | {productInterests}     | Response **output**  <br>As multi-select values, where each selection will be separated by a comma.                                                                         |

``` json
{
    "$schema": "http://adaptivecards.io/schemas/adaptive-card.json",
    "type": "AdaptiveCard",
    "version": "1.0",
    "body": [
        {
            "type": "ColumnSet",
            "columns": [
                {
                    "type": "Column",
                    "width": 2,
                    "items": [
                        {
                            "type": "TextBlock",
                            "text": "Lead Notification",
                            "weight": "Bolder",
                            "id": "Title",
                            "size": "ExtraLarge"
                        },
                        {
                            "type": "TextBlock",
                            "text": "Please fill out a single form for each individual expressing interest in our products. ",
                            "isSubtle": true,
                            "wrap": true,
                            "id": "acInstructions",
                            "size": "Large"
                        }
                    ]
                }
            ]
        },
        {
            "type": "Container",
            "items": [
                {
                    "type": "TextBlock",
                    "text": "Potential Customer FIRST NAME",
                    "wrap": true,
                    "size": "Medium"
                }
            ]
        },
        {
            "type": "Input.Text",
            "id": "acLeadFName",
            "placeholder": "{firstName}"
        },
        {
            "type": "TextBlock",
            "text": "Potential Customer LAST NAME",
            "wrap": true
        },
        {
            "type": "Input.Text",
            "id": "acLeadLName",
            "placeholder": "{lastName}"
        },
        {
            "type": "TextBlock",
            "text": "Corporate email",
            "wrap": true
        },
        {
            "type": "Input.Text",
            "id": "acLeadEmail",
            "placeholder": "{emailAddress}",
            "style": "Email"
        },
        {
            "type": "TextBlock",
            "text": "Business Phone Number"
        },
        {
            "type": "Input.Text",
            "id": "acLeadPrimaryPhone",
            "placeholder": "{primaryPhone10digits}",
            "style": "Tel"
        },
        {
            "type": "RichTextBlock",
            "inlines": [
                {
                    "type": "TextRun",
                    "text": "{productInterests}"
                }
            ]
        },
        {
            "type": "Input.ChoiceSet",
            "placeholder": "Placeholder text",
            "choices": [
                {
                    "title": "Office 365",
                    "value": "Office 365"
                },
                {
                    "title": "Dynamics 365",
                    "value": "Dynamics 365"
                },
                {
                    "title": "Azure Services",
                    "value": "Azure Services"
                },
                {
                    "title": "Power Platform",
                    "value": "Power Platform"
                }
            ],
            "style": "expanded",
            "id": "acLeadProductInterest",
            "isMultiSelect": true
        }
    ],
    "actions": [
        {
            "type": "Action.Submit",
            "title": "Submit"
        }
    ]
}
```




[!INCLUDE[footer-include](includes/footer-banner.md)]
